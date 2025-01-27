# Check if Docker is installed
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Output "Docker is not installed. Please install Docker Desktop from https://www.docker.com/products/docker-desktop"
    Exit
}

# Check if Docker Compose is installed
if (-not (Get-Command docker-compose -ErrorAction SilentlyContinue)) {
    Write-Output "Docker Compose is not installed. Installing Docker Compose..."
    Invoke-WebRequest -Uri "https://github.com/docker/compose/releases/latest/download/docker-compose-windows-x86_64.exe" `
                      -OutFile "$env:ProgramFiles\Docker\docker-compose.exe"
    if (-not (Test-Path "$env:ProgramFiles\Docker\docker-compose.exe")) {
        Write-Output "Failed to install Docker Compose. Please install it manually from https://github.com/docker/compose."
        Exit
    }
    Write-Output "Docker Compose installed successfully."
}

# Check if docker-compose.yml exists
if (-not (Test-Path "./docker-compose.yml")) {
    Write-Output "Creating docker-compose.yml..."
    @"
services:
  ollama:
    image: ollama/ollama
    container_name: ollama
    ports:
      - "11434:11434"
    restart: unless-stopped

  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    container_name: open-webui
    ports:
      - "3000:8080"
    volumes:
      - open-webui:/app/backend/data
    extra_hosts:
      - "host.docker.internal:host-gateway"
    restart: always

volumes:
  open-webui:
    driver: local
"@ | Out-File -FilePath ./docker-compose.yml
    Write-Output "docker-compose.yml created successfully."
} else {
    Write-Output "docker-compose.yml already exists."
}

# Check if Docker is running
Write-Output "Checking if Docker Desktop is running..."
$dockerStatus = & docker info 2>&1
if ($dockerStatus -like "*Cannot connect to the Docker daemon*") {
    Write-Output "Docker Desktop is not running. Please start Docker Desktop and re-run this script."
    Exit
}

# Run Docker Compose
Write-Output "Starting Docker Compose..."
try {
    docker-compose up -d
    Write-Output "Setup complete! Access services at:"
    Write-Output "Ollama: http://localhost:11434"
    Write-Output "Open-WebUI: http://localhost:3000"
} catch {
    Write-Output "An error occurred while starting Docker Compose. Please check the logs above for details."
}
