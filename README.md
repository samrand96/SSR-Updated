# One-Click Installation of ShadowsocksR Server

This project offers a streamlined script for the rapid deployment of a **ShadowsocksR (SSR)** server on Linux-based systems, including CentOS, Debian, and Ubuntu. Designed with modern compatibility in mind, the script incorporates updated components to ensure full support for environments running **Python 3.10+**, and delivers a robust, firewall-friendly proxy service for secure and reliable connectivity.

---

## System Requirements

To proceed with the installation, ensure your system meets the following prerequisites:

- **VPS (Virtual Private Server)**  
  For optimal performance and cost-efficiency, we strongly recommend using **Hetzner**:  
  ✅ 2 vCPU  
  ✅ 4 GB RAM  
  ✅ 20 TB Bandwidth  
  ✅ IPv4 & IPv6  
  All available for just **€4.5/month**.  
  👉 Sign up here to get **€20 credit**: [https://bit.ly/ssr_vps](https://bit.ly/ssr_vps)

- **Supported Operating Systems**:
  - CentOS 6, 7, or later
  - Debian 7 or later
  - Ubuntu 12 or later

- **Root Access**:  
  You must have root privileges to install and manage the service.

---

## Installation Instructions

Follow the steps below to install ShadowsocksR:

1. **Download the Installation Script**:
   ```bash
   wget https://raw.githubusercontent.com/samrand96/SSR-Updated/refs/heads/main/install.sh -O install-shadowsocksr.sh
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x install-shadowsocksr.sh
   ```

3. **Run the Installer**:
   ```bash
   sudo ./install-shadowsocksr.sh 2>&1 | tee shadowsocksR.log
   ```

The script will prompt you for configuration preferences and handle all dependencies and service setup automatically.

---

## Uninstallation

To remove the ShadowsocksR server from your system, simply run:

```bash
sudo ./install-shadowsocksr.sh uninstall
```

---

## Managing the ShadowsocksR Service

Use the following commands to control the SSR service:

- **Start**:
  ```bash
  sudo /etc/init.d/shadowsocks start
  ```

- **Stop**:
  ```bash
  sudo /etc/init.d/shadowsocks stop
  ```

- **Restart**:
  ```bash
  sudo /etc/init.d/shadowsocks restart
  ```

---

## Configuration Options (During Setup)

The script allows for full customization of your SSR instance at the time of installation:

- **Password**  
  - Default: Randomly generated  
  - Custom: You may enter your own password when prompted

- **Port**  
  - Default: Random port between `9000`–`19999`  
  - Custom: Enter a preferred port during setup

- **Stream Cipher**  
  - Default: `aes-192-cfb`  
  - Supported: `none`, `aes-256-cfb`, `chacha20`, etc.

- **Protocol**  
  - Default: `auth_sha1_v4`  
  - Supported: `origin`, `auth_chain_a`, `auth_chain_f`, etc.

- **Obfuscation**  
  - Default: `tls1.2_ticket_auth`  
  - Supported: `http_simple`, `http_post`, `tls1.2_ticket_fastauth`, etc.

---

## Firewall Configuration

The script automatically configures the necessary firewall rules to open your chosen port for both TCP and UDP:

- On **CentOS 6**: Uses `iptables`
- On **CentOS 7+**: Uses `firewalld`

If you're on a minimal installation without a firewall pre-configured, you can use the included `open-ports.sh` script to open ports manually.

---

## Advanced Features

- **Python 3.10+ Support**  
  The script detects and adapts to newer Python versions by fetching updated SSR components for compatibility and performance.

- **Automatic Dependency Resolution**  
  The installer takes care of all required packages such as `python`, `openssl`, `wget`, and others, making it compatible with both Red Hat- and Debian-based distributions.

---

## Troubleshooting Tips

- **Permission Errors**  
  Make sure the script is executed with `sudo` or as the root user.

- **Firewall Issues**  
  Verify that the selected port is open for both TCP and UDP, and that your server’s security group (if applicable) allows traffic.

- **Python Not Installed**  
  Install Python 3 if missing:
  ```bash
  sudo apt install python3
  ```

- **Installation Failure**  
  Check the `shadowsocksR.log` file for errors or review your system’s missing dependencies.

---

## Credits

- **Maintained by**: Samrand — [me@samrand.me](mailto:me@samrand.me)  
- **Original Author**: Teddysun — [i@teddysun.com](mailto:i@teddysun.com)  
- **Official SSR Project**: [ShadowsocksR GitHub Repository](https://github.com/shadowsocksrr/shadowsocksr)  
- **Additional Resources**: [Shadowsocks Intro Guide](https://shadowsocks.be/9.html)

---

## Disclaimer

This script is provided *as-is* with no express or implied guarantees. While it has been tested on multiple systems and configurations, users should assume full responsibility for its deployment and usage. It is not intended to provide absolute anonymity or guaranteed firewall circumvention. Please use responsibly and in compliance with all applicable laws and regulations in your jurisdiction.
