# Shop-Smart
<img width="1024" height="1024" alt="Logo" src="images/LOGO-transparent.png" />
## Getting Started

### 1) Get the project files (no Git required)
1. Open the repo page: [https://github.com/nghongwatsang/Shop-Smart](https://github.com/nghongwatsang/Shop-Smart)
2. Click **Code** → **Download ZIP**
3. Unzip it (you’ll get a folder like `Shop-Smart-main/`)

### 2) Install Docker
**Windows or macOS:**
1. Install **Docker Desktop** from [Docker’s official site](https://www.docker.com/products/docker-desktop/).
2. Open Docker Desktop and ensure it’s running.

**Linux:**
1. Install Docker Engine + the Compose plugin.
2. Start Docker:
   ```bash
   sudo systemctl enable --now docker
   ```
3. (Optional) Run without sudo:
   ```bash
   sudo usermod -aG docker $USER
   ```
   *Then log out and back in.*

### 3) Run the app with Docker Compose
1. Open a terminal (PowerShell, Terminal, etc.).
2. Navigate to the unzipped folder:
   ```bash
   cd ~/Downloads/Shop-Smart-main
   ```
3. Build and start the application:
   ```bash
   docker compose up --build
   ```
   *(Leave this terminal window open.)*

### 4) Open it in your browser
Go to: [http://localhost:3000](http://localhost:3000)

### 5) Stopping / Cleaning up
*   **Stop (keep containers):** Press `Ctrl + C` in the terminal.
*   **Stop + remove containers:**
    ```bash
    docker compose down
    ```
*   **Full reset (deletes database volume):**
    ```bash
    docker compose down -v
    ```

## Common Issues & Fixes
**Port already in use (3000 / 5432):**
*   Close application using the port or change mapping in `docker-compose.yml`, then re-run `docker compose up --build`.

**Docker isn’t running:**
*   Start Docker Desktop or the docker service.

**Command not found: docker:**
*   Ensure Docker installed correctly or restart your terminal.
