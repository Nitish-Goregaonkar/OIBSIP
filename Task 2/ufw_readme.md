# Basic Firewall Configuration Using UFW

## Objective

Set up a basic firewall using UFW (Uncomplicated Firewall) on a Linux system, allowing SSH and denying HTTP traffic.

## Tools Used

- Ubuntu/Linux OS
- UFW (Uncomplicated Firewall)

## Steps to Configure Firewall

1. **Install UFW**

```bash
sudo apt update
sudo apt install -y ufw
```

2. **Reset UFW to Default**

```bash
sudo ufw reset
```

3. **Set Default Rules**

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

4. **Allow SSH Traffic**

```bash
sudo ufw allow ssh
```

5. **Deny HTTP Traffic**

```bash
sudo ufw deny http
```

6. **Enable UFW**

```bash
sudo ufw enable
```

7. **Check UFW Status**

```bash
sudo ufw status verbose
```

## Files Included

- `ufw_configuration.sh`: A shell script to install and configure UFW.
- `ufw_status.png`: Screenshot showing the firewall rules in effect.
- `README.md`: This file, explaining the setup and configuration steps.

