# Network Attacks # 

## Network Attacks ## 

## Ports and Protocols ## 

Port: A logical communication endpoint that exists on a computer or server 

Inbound Port: A logical communication opening on a server that is listening for a connection from a client 

Outbound Port: A logical communication opening created on a client in order to call out to a server that is listening for a connection 

Ports can be any number between 0-65,535 

Well-Known Ports: Ports 0-1023 are considered well-known and are assigned by the Internet Assigned Numbers Authority [IANA] 

Registered Ports: Ports 1024-49,151 are considered registered and are usually assigned to proprietary protocols 

Dynamic or Private Ports: Ports 49,152-65,535 can be used by any application without being registered with IANA 

## Memorization of Ports ## 

65,536 ports are available for use 

21 [TCP]: FTP [File Transfer Protocol] - used to transfer files from host to host 

22 [TCP/UDP]: SSH, SCP, SFTP - Secure Shell is used to remotely administer network devices and systems; SCP is used for secure copy; SFTP for secure FTP 

22 [TCP/UDP]: Telnet - unencrypted method to remotely administer network devices [should not be used] 

25 [TCP]: SMTP [Simple Mail Transfer Protocol] - used to send email over the internet 

53 [TCP/UDP]: DNS [Domain Name Service] - used to resolve hostnames to IPs and vice-versa 

69 [UDP]: TFTP [Trivial File Transfer Protocol] - used as a simplified version of FTP to put a file on a remote host, or get a file from a remote host 

80 [TCP]: HTTP [Hyper Text Transfer Protocol] - used to transmit web page data to a client for unsecured web browsing 

88 [TCP/UDP]: Kerberos - used for network authentication using a system of tickets within a Windows domain 

110 [TCP]: POP3 [Post Office Protocol v3] - used to receive mail from a mail server 

119 [TCP]: NNTP [Network News Transfer Protocol] - used to transport Usenet articles 

135 [TCP/UDP]: RPC/DCOM-scm [Remote Procedure Call] - used to locate DCOM ports to request a service from a program from another computer on the network 

137-139 [TCP/UDP]: NetBIOS - used to conduct name querying, sending of data, and other functions over a NetBIOS connection 

143 [TCP]: IMAP [Internet Message Access Protocol] - used to receive email from a mail server with more features than POP3 

161 [UDP]: SNMP [Simple Network Management Protocol] - used to remotely monitor network devices 

162 [TCP/UDP]: SNMPTRAP - used to send Trap and InformRequests to the SNMP Manager on a network 

389 [TCP/UDP]: LDAP [Lightweight Directory Access Protocol] - used to maintain directories of users and other objects 

443 [TCP]: HTTPS [Hyper Text Transfer Protocol Secure] - used to transmit web page data to a client over an SSL/TLS encrypted connection 

445 [TCP]: SMB [Server Message Block] - used to provide shared access to files and other resources on a network 

465/587 [TCP]: SMTP with SSL/TLS - used to send email over the internet with an SSL and TLS-secured connection 

514 [UDP]: Syslog - used to conduct computer message logging, especially for routers and firewall logs 

636 [TCP/UDP]: LDAP SSL/TLS - used to maintain directories of users and other objects over an encrypted SSL/TLS connection 

860 [TCP]: iSCSI - used for linking data storage facilities over IP 

989/990 [TCP]: FTPS [File Transfer Protocol Secure] - used to transfer files from host to host over an encrypted connection 

993 [TCP]: IMAP4 with SSL/TLS - used to receive mail from a mail server over an SSL/TLS encrypted connection 

995 [TCP]: POP3 with SSL/TLS - used to receive email from a mail server using an SSL/TLS encrypted connection 

1433 [TCP]: MS-SQL-S [Microsoft SQL Server] - used to receive SQL database queries from clients 

1645/1646 [UDP]: RADIUS [alternative] [Remote Authentication Dial-In User Service] - used for authentication and authorization [1645] and accounting [1646] 

1701 [UDP]: L2TP [Layer 2 Tunning Protocol] - used as an underlying VPN protocol but has no inherent security 

1723 [TCP/UDP]: PPTP [Point-to-Point Tunneling Protocol] - an underlying VPN protocol with built-in security 

1812/1813 [UDP]: RADIUS [standard] [Remote Authentication Dial-In User Service] - used for authentication and authorization [1812] and accounting [1813] 

3225 [TCP/UDP]: FCIP [Fibre Channel IP] - used to encapsulate Fibre Channel frames within TCP/IP packets 

3260 [TCP]: iSCSI Target - a listening port for a iSCSI targeted device when linking data storage facilities over IP 

3389 [TCP/UDP]: RDP [Remote Desktop Protocol] - used to remotely view and control other Windows systems via a Graphical User Interface 

3869 [TCP]: Diameter - a more advanced AAA protocol that is a replacement for RADIUS 

6514 [TCP]: Syslog over TLS - used to conduct computer message logging, especially for routers and firewall logs, over a TLS-encrypted connection 

## Unnecessary Ports ## 

Unnecessary Port: Any port that is associated with a service or function that is non-essential to the operation of one's computer or network 

Any open port represents a possible vulnerability that might be exposed 

## Denial of Service ##  

Term used to describe many different types of attacks which attempt to make a computer or server's resources unavailable 

Flood Attack: A specialized type of DoS whcih attempts to send more packets to a single server or host than they can handle 
* Ping Flood: An attacker attempts to flood the server by sending too many ICMP echo request packets [which are known as pings] 
* Smurf Attack: Attacker sends a ping to subnet broadcast address and devices reply to spoofed IP [victim server] using up bandwidth and processing power 
* Fraggle Attack: Attacker sends a UDP echo packet to port 7 [ECHO] and port 19 [CHARGEN] to flood a server with UDP packets 
* SYN Flood: Variant on a Denial of Service [DoS] attack where attacker initiates multiple TCP sessions but never completes the three-way handshake 
    * Flood guards, timeouts, and an IPS can prevent SYN Floods 
* XMAS Attack: A specialized network scan that sets the FIN, PSH, and URG flags and can cause a device to crash and reboot 

Ping of Death: An attack that sends an oversized and malformed packet to another computer or server 

Teardrop Attack: Attack that breaks apart packets into IP fragments, modifies them with overlapping and oversized payloads, and sends them to a victim machine 

Permanent Denial of Service: Attack which exploits a security flaw to permanently break a networking device by reflashing its firmware 

Fork Bomb: Attack that creates a large number of processes to use up the available processing power of a computer 

## DDoS ## 

Distributed Denial of Service [DDoS]: A group of compromised systems attack a single target simultaneously to create a Denial of Service [DoS] 

DNS Amplification: Attack which relies on the large amount of DNS information that is sent in response to a spoofed query on behalf of the victimized server 

Blackholing/Sinkholing: Identifies any attacking IP addresses and routes all their traffic to a non-existent server through the null interface 

An IPS can prevent a small-scale DDoS 

Specialized security services cloud providers can stop DDoS attacks 

## Spoofing ## 

Spoofing: Occurs when an attacker masquerades as another person by falsifying their identity 

Anything that uniquely identifies a user or system can be spoofed 

Proper authentication is used to detect and prevent spoofing 

## Hijacking ## 

Hijacking: Exploitation of a computer session in an attempt to gain unauthorized access to data, services, or other resources on a computer or server 

Session Theft: Attacker guesses the session ID for a web session, enabling them to takeover the already authorized session of the client 

TCP/IP Hijacking: Occurs when an attacker takes over a TCP session between two computers without the need of a cookie or other host access 

Blind Hijacking: Occurs when an attacker blindly injects data into the communication stream without being able to see if it is successful or not 

Clickjacking: Attack that uses multiple transperant layers to trick a user into clicking on a button or link on a page when they were intending to click on the actual page 

Man-in-the-Middle [MITM]: Attack that causes data to flow through the attacker's computer where they can intercept or manipulate the data 

Man-in-the-Browser [MITB]: Occurs when a Trojan infects a vulnerable web browser and modifies the web pages or transactions being done within the browser 

Watering Hole: Occurs when malware is placed on a website that the attacker knows their potential victims will access 

XSS 

## Replay Attack ## 

Network-based attack where a valid data transmission is fraudulently or maliciously rebroadcast, repeated, or delayed 

MFA can help prevent successful replay attacks 

## Null Sessions ## 

Null Connection: A connection to the Windows interprocess communications share [IPC$] 

## Transitive Attacks ## 

Transitive attacks aren't really an attack but more of a conceptual method 

When security is sacrificed in favor of more efficient operations, additional risk exists 

## DNS Attacks ## 

DNS Poisoning: Occurs when the name resolution information is modified in the DNS server's cache 

If the cache is poisoned, then the user can be redirected to a malicious website 

Unauthorized Zone Transfer: Occurs when an attacker requests replication of the DNS information to their systems for use in planning future attacks 

Altered Hosts File: Occurs when an attacker modifies the host file to have the client bypass the DNS server and redirects them to an incorrect or malicious website 

Windows stores the host file in the following directory: \%systemroot%\system 32\drivers\etc 

Pharming: Occurs when an attacker redirects one website's traffic to another website that is bogus or malicious 

Domain Name Kiting: Attack that exploits a process in the way a domain name is registered so that the domain name is kept in a limbo and cannot be registered by an authenticated buyer 

## ARP Poisoning ## 

ARP: Protocol for mapping an Internet Protocol address [IP address] to a physical machine address that is recognized in the local network 

ARP Poisoning: Attack that exploits the IP address to MAC resolution in a network to steal, modify, or redirect frames within the local area network 

Allows an attacker to essentially take over any sessions within the LAN 

ARP Poisoning is prevented by VLAN segmentation and DHCP spoofing 