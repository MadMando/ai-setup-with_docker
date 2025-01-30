---

# Docker AI Setup

Run AI models using Docker! It's much easier than you think!!  **Ollama** and **Open-WebUI** locally using Docker! This repository provides a simple PowerShell script and a pre-configured Docker Compose file to make setup easy, even for non-technical users. Don't trust random scripts on the interweb, neither do I!! then do it manually, we’ve got you covered for that too!

---

## Why Run AI Locally?

✔️ **No Cloud Dependency**: Your data stays secure on your machine.  
✔️ **Full Control**: Customize configurations to suit your needs.  
✔️ **Lots of Choices**: Choose from many different models.   
✔️ **Open Source**: Did I mention its FREE!!!.   

---

## Requirements

1. **Docker Desktop**  
   - Download and install it from [Docker Desktop](https://www.docker.com/products/docker-desktop).
   - Restart when asked by docker installation.
   - START DOCKER!  Don't forget, you don't have to sign in or register; click on skip on the upper right. 
   - Ensure it is running before proceeding.

2. **Windows Only**  
   - PowerShell or terminal window.
   - Search for PowerShell in the start menu search
   - Right click and open as administrator
  
   - WARNING! This is for personal computers only. I would not recommend installing it on a work or school computer!

---

## Quick Start
⚠️Security Note:⚠️

⚠️Avoid using automated scripts from untrusted sources (I can be trusted, but you don't know me so it's up to you!) as they pose security risks. For best practices, review the script contents before running it.

### **Option 1: Use the Script**  dont do this its a bad idea!  too many security issues!  Just go to option 2!

  ⚠️ - PERMISSIONS- to continue you would need to allow the script to run, and you would need to give unrestricted access to run the script to the current user.
  
  ⚠️ -    this is where I would recommend using the manual installation.  Once you do, you can revoke unrestricted access.
  
  ⚠️-    to give permission, run the following command in the PowerShell  ``` Set-ExecutionPolicy Unrestricted -Scope CurrentUser ```
  
  ⚠️-    Hit R for run once.  

For an automated setup, download the following files from this repository:
- [docker_ai_setup.ps1](./docker_ai_setup.ps1)
- click the download button, looks like an arrow in a bucket near the top of the code.


Follow these steps:
1. Open PowerShell as **Administrator**.
2. Navigate to the folder where you saved the files:
   ```powershell
   cd C:\path\to\your\files
   ```
3. Run the script:
   ```powershell
   ./docker_ai_setup.ps1
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

2. **Run Open-WebUI**:give it a couple minutes to loadmand
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
2. Sign up; you can use any name and email; this will create the admin account. 
3. Navigate to **Admin → Models** in the top menu.  
4. Click the **Download button** (it looks like an arrow in a bucket).  
5. Visit [Ollama](https://ollama.com) to browse available models.  
6. Copy the model name, paste it into the Open-WebUI dialog, and hit **Download**.  
7. Once downloaded, start chatting with your AI! 🎉  

⚠️ **Pro Tip**: Stick with smaller or distilled models unless you have high-end hardware.
the most popular one now is ``` deepseek-r1:1.5b ```


CONGRATS! You should have your own personal GenAI running locally, be patient if you have old or not as-powerful hardware, or if you have nice hardware, then choose a larger model stick to 
models that are typically 4gb in size, they tend to work well.


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

## Garuntee
there is none, use at your own risk, stick to models from known sources like ollama and huggingface.  this is for entertainmaint use only.  

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.

---

this was created with the assistance of the above instructions, !!!!  ENJOY !!!!
