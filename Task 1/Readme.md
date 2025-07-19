# Nmap Network Scan Report

## 🧾 Objective
The objective of this task is to perform a basic network scan on a target machine using Nmap to identify:
- Open ports
- Running services and versions
- Operating system details

This scan helps in assessing the attack surface of a host in a local network environment.

---

## 🛠️ Tools Used
- **Operating System:** Kali Linux (running in VirtualBox)
- **Scanning Tool:** Nmap (Network Mapper)
- **Command Used:**
  ```bash
  nmap -sS -sV -O -oN nmap_results.txt 192.168.1.19
