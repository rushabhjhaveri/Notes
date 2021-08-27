# Security Applications and Devices # 

## Software Firewalls ## 

Personal Firewalls: Software application that protects a single computer from unwanted internet traffic [aka Host-based firewalls] 

Built-in Firewalls: 
* Windows Firewall [Windows]
* PF and IPFW [macOS]
* iptables [Linux] 

Many anti-malware suites also contain software firewalls 

## IDS ## 

Intrusion Detection System: Device or software application that monitors a system or network and analyzes the data passing through it in order to identify an incident or attack 

HIDS: Host-based IDS 

NIDS: Network-based IDS 

Signature, Policy, and Anomaly-based detection methods 

Signature-based: A specific string of bytes triggers an alert 

Policy-based: Relies on specific declaration of the security policy [i.e., "No Telnet Authorized"] 

Anomaly-based: Analyzes the current traffic against an established baseline and triggers an alert if outside the statistical average 

Types of alerts: 
* True Positive: Malicious activity is identified as an attack 
* True Negative: Legitimate activity is identified as legitimate traffic 
* False Positive: Legitimate activity is identified as an attack 
* False Negative: Malicious traffic is identified as legitimate traffic 

IDS can only alert and log suspicious activity, but cannot block/stop it 

To stop it, must invest in an IPS [Intrusion Prevention System] 

IPS can also stop malicious activity from being executed 

HIDS logs are used to recreate the events after an attack has occurred 

## Pop-up Blockers ## 

Most web-browsers have the ability to block JavaScript-created pop-ups 

Users may enable pop-ups because they are required for a website to function 

Malicious attackers could purchase ads [pay per click] through various networks 

Content Filters: Blocking of external files containing JavaScript, images, or web pages from loading in a browser 

Ensure that browser and its extensions are updated regularly 

## Data Loss Prevention ## 

DLP: Monitors the data of a system while in use, in transit, or at rest, to detect attempts to steal the data 

Come as either software or hardware solutions 

Endpoint DLP System: Software-based client that monitors the data in use on a computer and can stop a file transfer or alert an admin of the occurrence 

Network DLP System: Software or hardware-based solution that is installed on the perimeter of the network to detect data in transit 

Storage DLP System: Software installed on servers in the datacenter to inspect the data at rest 

Cloud DLP System: Cloud software as a service that protects data being stored in cloud services 

## Securing the BIOS ## 

Basic Input Output System: Firmware that provides the computer instructions for how to accept input and send output 

Unified Extensible Firmware Interface [UEFI] -- replaces legacy BIOS, but essentially the same thing, just updated/robust version of legacy 

Securing the BIOS: 
* Flash the BIOS 
* Use a BIOS password 
* Configure the BIOS boot order 
* Disable the external ports and devices 
* Enable the secure boot option 

## Securing Storage Devices ## 

Removable media comes in many different formats 

Should always encrypt files on removable media 

Removable Media Controls: Technical limitations placed on a system in regards to the utilization of USB storage devices and other removable media 

Create administrative controls such as policies 

Network Attached Storage [NAS]: Storage devices that connect directly to an organization's network 

NAS systems often implement RAID arrays to ensure high availability 

Storage Area Network [SAN]: Network designed specifically to perform block storage functions that may consist of NAS devices 

Securing NAS devices: 
* Use data encryption 
* Use proper authentication 
* Log NAS access 

## Disk Encryption ## 

Encryption scrambles data into unreadable information 

Self-Encrypting Drive [SED]: Storage device that performs whole disk encryption by using embedded hardware 

Encryption software is most commonly used 

Built-in encryption software: 
* FileVault [macOS] 
* BitLocker [Windows] 

Trusted Platform Module [TPM]: Chip residing on the motherboard that contains an encryption key 

If motherboard doesn't have a TPM, can use an external USB drive as a key 

Advanced Encryption Standard [AES]: Symmetric key encryption that supports 128-bit and 256-bit keys 

Encryption adds security but has lower performance 

Hardware Security Module [HSM]: Physical devices that act as a secure cryptoprocessor during the encryption process 

## Endpoint Analysis ## 

Anti-Virus [AV]: Software capable of detecting and removing virus infections and [in most cases] other types of malware, such as worms, Trojans, rootkits, adware, spyware, password crackers, network mappers, DoS tools, and others 

Host-based IDS/IPS [HIDS/HIPS]: A type of IDS or IPS that monitors a computer system for unexpected behavior or drastic changes to the system's state on an endpoint 

Endpoint Protection Platform [EPP]: A software agent and monitoring system that performs multiple security tasks such as anti-virus, HIDS/HIPS, firewall, DLP, and file encryption 

Endpoint Detection and Response [EDR]: A software agent that collects system data and logs for analysis by a monitoring system to provide early detection of threats 

User and Entity Behavior Analytics [UEBA]: A system that can provide automated identification of suspicious activity by user accounts and computer hosts 

UEBA solutions are heavily dependent on advanced computing techniques like artificial intelligence [AI] and machine learning 

Many companies are now marketing Advanced Threat Protection [ATP], Advanced Endpoint Protection [AEP], and NextGen AV [NGAV] which is a hybrid of EPP, EDR, and UEBA 