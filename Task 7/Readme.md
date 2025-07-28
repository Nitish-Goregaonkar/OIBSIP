
# 🛡️ Vulnerability Scanning with Nikto 

**Tool Used:** Nikto v2.5.0  
**Scan Date:** 28-07-2025  


---

## 🔍 Target Information

- **Target Host:** 127.0.0.1
- **Target Port:** 80
- **Server Technology:** Apache (inferred from `/server-status` and file paths)
- **Platform:** WordPress (inferred from file paths and themes)

---

## 📋 Scan Summary

Nikto was used to perform a vulnerability scan on the web server hosted at `127.0.0.1:80`. The scan revealed **multiple critical, high, and medium severity vulnerabilities**, indicating that the server is exposed to significant risks.

---

## ⚠️ Key Findings

| Severity | Vulnerability | Description |
|----------|---------------|-------------|
| Critical | PHP Backdoors Detected | Multiple PHP file manager backdoors exist in common paths, allowing arbitrary file access (e.g., `/server.php?filesrc=/etc/hosts`). |
| Critical | Local File Inclusion (LFI) | File paths like `///etc/hosts` are retrievable, allowing attackers to read system files. |
| High     | Apache Server-Status Disclosure | `/server-status` is publicly accessible, revealing real-time server info. |
| High     | Remote Code Execution Pattern | URI `/login.cgi?cli=aa%20aa’cat%20/etc/hosts` shows signs of command injection. |
| High     | Missing HTTP Security Headers | X-Frame-Options and X-Content-Type-Options headers are missing, increasing the risk of clickjacking and MIME-based attacks. |
| Medium   | ETag Inode Leakage | ETags contain inode information, which could help fingerprint the server (CVE-2003-1418). |
| Low      | HTTP Method Disclosure | `OPTIONS` method is enabled, potentially exposing unused HTTP methods. |

---

## 🔥 Risk Analysis

### 1. **Backdoors & File Inclusion**
- **Risk:** Attackers can execute arbitrary code or access sensitive system files.
- **Impact:** Full system compromise, data exfiltration, privilege escalation.

### 2. **Missing Security Headers**
- **Risk:** Absence of `X-Frame-Options` makes the site vulnerable to clickjacking.
- **Risk:** Without `X-Content-Type-Options`, browsers might misinterpret files.
- **Impact:** User session hijacking, content spoofing, XSS opportunities.

### 3. **Server Status Disclosure**
- **Risk:** Attackers can monitor server load, client IPs, and running processes.
- **Impact:** Useful for DDoS, targeted attacks, or privilege escalation.

### 4. **Inode Leakage via ETags**
- **Risk:** Can aid attackers in fingerprinting and cache poisoning.
- **Impact:** Minor but useful in coordinated attacks.

---

## 🛡️ Recommended Security Practices

### 🔐 Server Hardening
- Disable `server-status` or restrict it using `Require ip 127.0.0.1` in Apache config.
- Disable unnecessary HTTP methods (`OPTIONS`, `TRACE`) via `.htaccess` or `httpd.conf`.

### 🧼 Backdoor Cleanup
- Manually audit and remove all listed PHP files with file manager capabilities.
- Perform a full file integrity scan of WordPress directories.
- Change all admin credentials and rotate database credentials.

### 🔏 Header Implementation
- Add the following headers to Apache or via `.htaccess`:
  ```apache
  Header always set X-Frame-Options "SAMEORIGIN"
  Header set X-Content-Type-Options "nosniff"
  Header unset ETag
  FileETag None
  ```

### 🕵️ Patch & Monitor
- Update all WordPress core, themes, and plugins.
- Use tools like `fail2ban`, `mod_security`, and `WAFs` for runtime protection.
- Enable logging and periodic monitoring for suspicious access.

---

## 📚 References

- [X-Frame-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options)
- [X-Content-Type-Options](https://www.netsparker.com/web-vulnerability-scanner/vulnerabilities/missing-content-type-header/)
- [CVE-2003-1418](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2003-1418)
- [Nikto GitHub](https://github.com/sullo/nikto)

---

## ✅ Conclusion

The scan results highlight critical security risks stemming from backdoors, weak configuration, and a lack of fundamental protections. Immediate action is required to clean up malicious files, harden the server, and implement standard security headers.
