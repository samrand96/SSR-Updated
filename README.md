# **One-Click Install ShadowsocksR Server**

This script allows you to quickly install or uninstall a **ShadowsocksR Server** on systems running CentOS, Debian, or Ubuntu. It includes support for modern configurations and ensures optimal compatibility for bypassing firewalls. Best configuration of ShadowSocksR (SSR) with updaete to support systems with Python3.10+

---

## **Requirements**
- VPS
  - I strongly recommend [Hetzner](https://bit.ly/ssr_vps) They offer: 2 CPU - 4 GB RAM - 20 TB Traffic - IPv4 & IPv6 for only 4.5$, for Signup: [https://bit.ly/ssr_vps](https://bit.ly/ssr_vps)
- Supported operating systems:
  - CentOS 6, 7, or later.
  - Debian 7 or later.
  - Ubuntu 12 or later.
- Root privileges.

---

## **Installation**

1. **Download the Script**:
   ```bash
   wget https://raw.githubusercontent.com/samrand96/SSR-Updated/refs/heads/main/install.sh -O install-shadowsocksr.sh
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x install-shadowsocksr.sh
   ```

3. **Run the Script**:
   ```bash
   sudo ./install-shadowsocksr.sh 2>&1 | tee shadowsocksR.log
   ```
---


---

## **Uninstallation**
To uninstall ShadowsocksR:
```bash
sudo ./install-shadowsocksr.sh uninstall
```

---

## **Usage Instructions**
1. **Start ShadowsocksR**:
   ```bash
   sudo /etc/init.d/shadowsocks start
   ```

2. **Stop ShadowsocksR**:
   ```bash
   sudo /etc/init.d/shadowsocks stop
   ```

3. **Restart ShadowsocksR**:
   ```bash
   sudo /etc/init.d/shadowsocks restart
   ```

---

## **Customization Options**
During installation, you can customize the following settings:

1. **Password**:
   - Default: Randomly generated.
   - You can enter your own password during the setup prompt.

2. **Port**:
   - Default: Random port between `9000` and `19999`.
   - You can specify your own port during setup.

3. **Stream Cipher**:
   - Default: `aes-192-cfb`.
   - Options include `none`, `aes-256-cfb`, `chacha20`, and more.

4. **Protocol**:
   - Default: `auth_sha1_v4`.
   - Options include `origin`, `auth_chain_a`, `auth_chain_f`, etc.

5. **Obfuscation**:
   - Default: `tls1.2_ticket_auth`.
   - Options include `http_simple`, `http_post`, `tls1.2_ticket_fastauth`, etc.

---

## **Firewall Configuration**
The script automatically opens the specified port for both TCP and UDP traffic:
- For CentOS 6: Configures `iptables`.
- For CentOS 7 and later: Configures `firewalld`.

[*] **If you didn't install firewall yet and still on minimal linux use `open-ports.sh` file**

---

## **Advanced Features**
1. **Python Compatibility**:
   - If Python 3.10 or later is detected, updated configuration files are downloaded to ensure optimal performance.

2. **Automatic Dependency Installation**:
   - The script installs all required dependencies (`python`, `openssl`, `wget`, etc.) for both CentOS and Debian-based systems.

---

## **Troubleshooting**
- **Permission Denied**:
  Ensure you are running the script as root:
  ```bash
  sudo ./install-shadowsocksr.sh install
  ```

- **Firewall Issues**:
  Check your firewall settings to ensure the configured port is open.

- **Python Not Installed**:
  Install Python 3:
  ```bash
  sudo apt install python3
  ```

- **Installation Failed**:
  Check for errors in the logs or missing dependencies.

---

## **Credits**
- **Updated By**: Samrand ([me@samrand.me](mailto:me@samrand.me))
- **Original Author**: Teddysun ([i@teddysun.com](mailto:i@teddysun.com))
- **ShadowSocksR**: [github repo](https://github.com/shadowsocksrr/shadowsocksr)
- **Intro**: [https://shadowsocks.be/9.html](https://shadowsocks.be/9.html)

--- 

## Disclaimer

The ShadowsocksR installation script is provided “as-is” without any guarantees or warranties. While every effort has been made to ensure the script’s reliability and functionality, the user assumes all risks associated with its use. The script may not guarantee complete anonymity, security, or bypassing of all firewalls and restrictions. Use it responsibly and ensure compliance with local laws and regulations. The authors are not liable for any misuse, legal consequences, or issues arising from its deployment.
