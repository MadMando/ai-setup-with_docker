---

# Docker AI Setup

Run AI models using  **Ollama** and **Open-WebUI** locally using Docker! This repository provides a simple PowerShell script and a pre-configured Docker Compose file to make setup easy, even for non-technical users. Dont trust random scripts on the interweb, then do it manually, we’ve got you covered for that too!

---

## Why Run AI Locally?

✔️ **No Cloud Dependency**: Your data stays secure on your machine.  
✔️ **Full Control**: Customize configurations to suit your needs.  

---

## Requirements

1. **Docker Desktop**  
   - Download and install it from [Docker Desktop](https://www.docker.com/products/docker-desktop).  
   - Ensure it is running before proceeding.

2. **A Windows Machine**  
   - PowerShell must be installed (default in Windows 10/11).

---

## Quick Start

### **Option 1: Use the Script**
For an automated setup, download the following files from this repository:
- [install_run.ps1](./install_run.ps1)  


Follow these steps:
1. Open PowerShell as **Administrator**.
2. Navigate to the folder where you saved the files:
   ```powershell
   cd C:\path\to\your\files
   ```
3. Run the script:
   ```powershell
   ./install_run.ps1
   ```

The script will:
- Check if Docker and Docker Compose are installed.
- Create the necessary `docker-compose.yml` file (if missing).
- Pull and start the Docker containers for **Ollama** and **Open-WebUI**.

---

### **Option 2: Manual Setup Using `docker pull`**

If you prefer not to use the script, you can manually pull and run the containers using Docker commands. Follow these steps:

#### Step 1: Pull the Docker Images
Run the following commands in PowerShell or any terminal with Docker installed:

```powershell
docker pull ollama/ollama
docker pull ghcr.io/open-webui/open-webui:main
```

#### Step 2: Run the Containers
Start the containers with the proper port mappings and configurations:

1. **Run Ollama**:
   ```powershell
   docker run -d -p 11434:11434 --name ollama --restart always ollama/ollama
   ```

2. **Run Open-WebUI**:
   ```powershell
   docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
   ```

#### Step 3: Verify the Containers
Check that the containers are running:
```powershell
docker ps
```

You should see both `ollama` and `open-webui` listed.

---

## Download Models for Open-WebUI

After the containers are running, follow these steps to download models in Open-WebUI:

1. Open your browser and go to [http://localhost:3000](http://localhost:3000).  
2. Navigate to **Admin → Models** in the top menu.  
3. Click the **Download button** (it looks like an arrow in a bucket).  
4. Visit [Ollama](https://ollama.com) to browse available models.  
5. Copy the model name, paste it into the Open-WebUI dialog, and hit **Download**.  
6. Once downloaded, start chatting with your AI! 🎉  

⚠️ **Pro Tip**: Stick with smaller or distilled models unless you have high-end hardware.
the most popular one now is ``` deepseek-r1:1.5b ```

---

## Access Your Local AI Apps

Once everything is set up, you can access the applications via these URLs:  
- **Ollama**: [http://localhost:11434](http://localhost:11434)  
- **Open-WebUI**: [http://localhost:3000](http://localhost:3000)  

---

## Troubleshooting

1. **Docker Desktop is not running**:  
   - Ensure Docker Desktop is installed and running before starting.

2. **Permission Denied Errors**:  
   - Always run PowerShell as **Administrator** to avoid permission issues.

3. **Volume Not Mounted Correctly**:  
   - Ensure the folder containing the volume is shared in Docker Desktop:  
     - Open Docker Desktop → **Settings** → **Resources** → **File Sharing**.  
     - Add the directory you want to mount (e.g., `C:\Users\YourName\Desktop`).

---

## How It Works

This setup uses Docker containers to run:
- **Ollama**: Provides AI-powered model functionalities.  
- **Open-WebUI**: A web-based interface for running and interacting with models.

---

## FAQ

### **Do I need a GPU to run these models?**  
No, smaller models can run on standard hardware. A GPU will improve performance for larger models.

### **Can I customize the Docker commands?**  
Absolutely! You can modify port mappings, volume mounts, and other parameters as needed.

### **What if I want to install more models later?**  
Simply follow the steps in **Download Models for Open-WebUI**.

---

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

---

## Contributions

Contributions are welcome! Feel free to fork this repository, submit pull requests, or open issues.

---

This version now includes a manual setup option (`docker pull` and `docker run`) for users who prefer not to use the script, along with the automated option for convenience. Let me know if you need any further adjustments!
