# Perimeter Security # 

## Perimeter Security ## 

Perimeter Security: Security devices focused on the boundary between the LAN and the WAN in one's organization's network 

Perimeter security relies on several different devices 

## Firewalls ## 

Firewalls screen traffic between two portions of a network 

Three types: software-based, hardware-based, and embedded firewalls 

Packet Filtering: Inspects each packet passing through the firewall and accepts or rejects it based on the rules 
* Stateless Packet Filtering: accept/reject traffic based on the IP address and port number requested 
* Stateful Packet Filtering: tracks the requests leaving the network 

NAT Filtering: Filters traffic based upon the ports being utilized and type of connection [TCP/UDP] 

Application-Layer Gateway: conducts an in-depth inspection based upon the application being used [aka Layer 7 Firewalls] 

Circuit-Level Gateway: Operates at the session layer and only inspects the traffic during the establishment of the initial session over TCP or UDP 

MAC Filtering: Filters out devices at the firewall to prevent them accessing the network beyond the firewall 

Explicit Allow: Traffic is allowed to enter or leave the network because there is an ACL rule that specifically allows it 

Explicit Deny: Traffic is denied the ability to enter or leave the network because there is an ACL rule that specifically denies it 

Implicit Deny: Traffic is denied the ability to enter or leave the network because there is no specific rule that allows it 

Most firewalls operate at Layer 3 [blocking IP addresses] and Layer 4 [blocking ports] 

Web Application Firewall: Firewall installed to protect your server by inspecting traffic being sent to a web application 

A WAF can prevent XSS or SQL injection 

## Proxy Servers ## 

Proxy Server: A device that acts as a middleman between a device and a remote server 

Four types of proxy servers: 
* IP Proxy: is used to secure a network by keeping its machines anonymous during web browsing 
* Caching Proxy: Attempts to serve client requests by delivering content from itself without actually contacting the remote server 
    * Disable Proxy Auto-Configuration [PAC] files for security 
* Internet Content Filter: Used in organizations to prevent users from accessing prohibited websites and other content 
* Web Security Gateway: A go-between device that scans for viruses, filters unwanted content, and performs data loss prevention functions 

## Honeypots and Honeynets ## 

Honeypots and honeynets are used to attract and trap potential hackers 

Honeypot: A single computer [or file, group of files, or IP range] that might be attractive to an attacker 

Honeynet: A group of computers, servers, or networks used to attract an attacker 

Honeypots are normally used in security research 

## Data Loss Prevention ## 

Data Loss Prevention: Systems designed to protect data by conducting content inspection of data being sent out of the network 

Also called Information Leak Prevention [ILP] or Extrusion Prevention Systems [EPS] 

DLP is used to ensure private data remains secure 

## NIDS and NIPS ## 

Network Intrusion Detection Systems [NIDS]: Attempts to detect, log, and alert on malicious network activities 

NIDS use promiscuous mode to see all network traffic on a segment 

Network Intrusion Prevention Systems [NIPS]: Attemtps to remove, detain, or redirect malicious traffic 

NIPS should be installed in-line of the network traffic flow 

Should a NIPS fail open or fail shut? 

NIPS can also perform functions such as a protocol analyzer 

## Unified Threat Management ## 

Relying on a firewall is not enough 

Unified Threat Management: Combination of network security devices and technologies to provide more defense in-depth within a single device 

UTM may include a firewall, NIDS/NIPS, content filter, anti-malware, DLP, and VPN 

UTM is also known as a Next Generation Firewall [NGFW] 