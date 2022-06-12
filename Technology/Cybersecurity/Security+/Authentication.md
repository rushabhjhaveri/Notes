# Authentication # 

## Authentication ## 

Multi-factor Authentication: Use of two or more authentication factors to prove a user's identity 

Username and password are only considered single-factor authentication 

One-Time Password 

Time-Based One Time Password [TOTP]: A password is computed from a shared secret and current time 

HMAC-Based One Time Password [HOTP]: A password is computed from a shared secret and is synchronized between the client and the server 

## Authentication Models ## 

Context-Aware Authentication: Process to check the user's or system's attributes or characteristics prior to allowing it to connect 

Restrict authentication based on the time of day or location 

Single Sign-On [SSO]: A default user profile for each user is created and linked with all of the resources needed 

Compromised SSO credentials cause a big breach in security 

Federated Identity Management [FIdM]: A single identity is created for a user and shared with all of the organizations in a federation 
* Cross-Certification: Utilizes a web of trust between organizations where each one certifies others in the federation 
* Trusted Third-Party: Organizations are able to place their trust in a single third-party [also called the bridge model] 

Trusted Third-Party model is more efficient than a cross-certification or web of trust model 

Security Assertion Markup Language [SAML]: Attestation model built upon XML used to share federated identity management information between systems 

OpenID: An open standard and decentralized protocol that is used to authenticate users in a federated identity management system 

User logs into an Identity Provider [IP] and uses their account at Relying Parties [RP] 

OpenID is easier to implement than SAML 

SAML is more efficient than OpenID 

## 802.1X ## 

802.1X: Standardized framework used for port-based authentication on wired and wireless networks 

802.1X can prevent rogue devices 

Extensible Authentication Protocol [EAP]: A framework of protocols that allows for numerous methods of authentication, including passwords, digital certificates, and public key infrastructure  

EAP-MD5 uses simple-passwords for its challenge-authentication 

EAP-TLS uses digital certificates for mutual authentication 

EAP-TTLS uses a server-side digital certificate and a client-side password for mutual authentication 

EAP-FAST: Provides flexible authentication via secure tunneling [FAST] by using a protected access credential instead of a certificate for mutual authentication 

Protected EAP [PEAP]: Supports mutual authentication by using server certificates and Microsoft's Active Directory to authenticate a client's password 

LEAP is proprietary to Cisco-based networks 

## LDAP and Kerberos ## 

Lightweight Directory Access Protocol [LDAP]: A database used to centralize information about clients and objects on the network 

LDAP communicates over port 389 [unencrypted] and port 636 [encrypted] 

Active Directory is Microsoft's version of LDAP 

Kerberos: An authentication protocol used by Windows to provide for two-way [mutual] authentication using a system of tickets 

Kerberos communicates over port 88 

A domain controller can be a single point of failure for Kerberos 

## Remote Desktop Services ## 

Remote Desktop Protocol [RDP]: Microsoft's proprietary protocol that allows administrators and users to remotely connect to another computer via a GUI 

RDP doesn't provide authentication natively 

Virtual Network Computing [VNC]: Cross-platform version of RDP for remote user GUI access 

VNC requires a client, server, and protocol to be configured 

RDP communicates over port 3389; VNC over port 5900 

## Remote Access Service ## 

Password Authentication Protocol [PAP]: Used to provide authentication but is not considered secure since it transmits the login credentials unencrypted [in the clear] 

Challenge Handshake Authentication Protocol [CHAP]: Used to provide authentication by using the user's password to encrypt a challenge string of random numbers 

Microsoft's version of CHAP is MS-CHAP 

PAP and CHAP used mostly with dial-up 

## VPN ## 

Virtual Private Network [VPN]: Allows end users to create a tunnel over an untrusted network and connect remotely and securely back to the enterprise network 

Client-to-Site VPN / Remote Access VPN 

VPN Concentrator: Specialized hardware device that allows for hundreds of simultaneous VPN connections for remote workers 

Split Tunneling: A remote worker's machine diverts internal traffic over the VPN but external traffic over their own internet connection 

Prevent split tunneling through proper configuration and network segmentation 

## RADIUS vs TACACS+ ## 

Remote Authentication Dial-In User Service [RADIUS]: Provides centralized administration of dial-up, VPN, and wireless authentication services for 802.1X and the Extensible Authentication Protocol [EAP] 

RADIUS operates at the application layer 

RADIUS operates via UDP 

AAA - Authentication, Authorization, and Accounting 

RADIUS communicates over ports 1812 [Authentication] and 1813 [Accounting] [Standard Variants]; ports 1645 [Authentication] and 1646 [Accounting] [Proprietary Variants] 

Cisco's TACACS+ is a proprietary version of RADIUS 

TACACS+ communicates over port 49 via TCP 

## Authentication Attacks ## 

Spoofing: A software-based attack where the goal is to assume the identity of a user, process, address, or other unique identifier 

Man-in-the-Middle [MitM] Attack: An attack where the attacker sits between two communicating hosts and transparently captures, monitors, and relays all communication between the hosts 

Man-in-the-Browser [MitB] is an attack that intercepts API calls between the browser process and its DLLs 

Online password attacks involve guessing and entering directly to a service 

Restricting the number or rate of logon attempts can prevent online password attacks 

Password Spraying: Brute force attack in which multiple user accounts are tested with a dictionary of common passwords 

Credential Stuffing: Brute force attack in which stolen user account names and passwords are tested against multiple websites 

Credential stuffing can be prevented by not reusing passwords across different websites 

Broken Authentication: A software vulnerability where the authentication mechanism allows an attacker to gain entry 