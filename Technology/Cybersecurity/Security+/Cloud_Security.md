# Cloud Security # 

## Cloud Computing ## 

Cloud Computing: A way of offering on-demand services that extend the traditional capabilities of a computer or network 

Cloud computing relies on virtualization to gain efficiencies and cost savings 

Hyperconvergence allows providers to fully integrate the storage, network, and servers 

Virtual Desktop Infrastructure: VDI allows a cloud provider to offer a full desktop operating system to an end user from a centralized server 

Secure Enclaves and Secure Volumes 

## Cloud Types ## 

Public Cloud: A service provider makes resources available to the end users over the internet 

Private Cloud: A company creates its own cloud environment that only it can utilize as an internal enterprise resource 

A private cloud should be chosen when security is more important than cost 

Hybrid Cloud: Mix of public and private cloud 

Community Cloud: Resources and costs are shared among several different organizations who have common service needs 

## As a Service ## 

Software as a Service [SaaS]: Provides all the hardware, operating system, software, and applications needed for a complete service to be delivered 

Infrastructure as a Service [IaaS]: Provides all the hardware, operating system, and backend software needed in order to develop one's own software or service 

Platform as a Service [PaaS]: Provides one's organization with the hardware and software needed for a specific service to operate 

Security as a Service [SECaaS]: Provides one's organization with various types of security services without the need to maintain a cybersecurity staff 

Anti-malware solutions were one of the first SECaaS products 

Some solutions may not scan all the files on one's system 

Cloud-based vulnerability scans can better provide the attacker's perspective 

However, one's vulnerability data may be stored on the cloud provider's server 

Sandboxing: Utilizes separate virtual networks to allow security professionals to test suspicious or malicious files 

## Cloud Security ## 

Co-located data can become a security risk 

Configure, manage, and audit user access to virtualized servers 

Utilizing the cloud securely requires good security policies 

Data remnants may be left behind after deprovisioning 

## Defending Servers ## 

File Servers: Servers are used to store, transfer, migrate, synchronize, and archive files for one's organization 

Email servers are a frequent target of attacks for the data they hold 

Web servers should be placed in a DMZ 

FTP Server: A specialized type of file server that is used to host files for distribution across the web 

FTP servers should be configured to require TLS connections 

Domain Controller: A server that acts as a central repository of all the user accounts and their associated passwords for the network 

Active Directory is targeted for privileged escalation and lateral movement 

## Cloud-Based Infrastructure ## 

Cloud-based infrastructure must be configured to provide the same level of security as a local solution 

Virtual Private Cloud [VPC]: A private network segment made available to a single cloud consumer within a public cloud 

The consumer is responsible for configuring the IP address space and routing within the cloud 

VPC is typically used to provision internet-accessible applications that need to be accessed from geographically remote sites 

On-premise solutions maintain their servers locally within the network 

Many security products offer cloud-based and on-premise versions 

Consider compliance or regulatory limitations of storing data in a cloud-based security solution 

Be aware of the possibility of vendor lock-in 

## CASB ## 

Cloud Access Security Broker [CASB]: Enterprise management software designed to mediate access to cloud services by users across all types of devices 

Enables: 
* Single sign-on 
* Malware and rogue device detection 
* Monitor/audit user activity 
* Mitigate data exfiltration 

CASBs provide visibility into how clients and other network nodes use cloud services 

Can be set up as: 
* Forward Proxy 
* Reverse Proxy 
* API Access 

Forward Proxy: A security appliance or host positioned at the client network edge that forwards user traffic to the cloud network if the contents of that traffic comply with policy 

Warning: Users may be able to evade the proxy and connect directly 

Reverse Proxy: An appliance positioned at the cloud network edge and directs traffic to cloud services if the contents of that traffic comply with policy 

Warning: This approach can only be used if the cloud application has proxy support 

Application Programming Interface [API]: A method that uses the broker's connections between the cloud service and the cloud consumer 

Warning: Dependent on the API supporting the functions that one's policies demand 

## API ## 

Application Programming Interface [API]: A library of programming utilities used to enable software developers to access functions of another application 

APIs allow for the automated administration, management, and monitoring of a cloud device 

curl: A tool to transfer data from or to a server, using one of the supported protocols [HTTP, HTTPS, FTP, FTPS, SCP, SFTP, TFTP, DICT, TELNET, LDAP, FILE] 

## FAAS and Serverless ## 

Function as a Service [FaaS]: A cloud service model that supports serverless software architecture by provisioning runtime containers in which code is executed in a particular programming language 

Serverless: A software architecture that runs functions within virtualized runtime containers in a cloud rather than on dedicated server instances 

Everything in serverless is developed as a function or a microservice 

Serverless eliminates the need to manage physical or virtual servers 

No patching, no administration, no file system monitoring 

The underlying architecture is managed by the cloud service provider 

Ensure that clients accessing the service have not been compromised 

Serverless depends on orchestration 

## Cloud Threats ## 

Insecure API 
* Warning: An API must only be used over an encrypted channel [HTTPS] 
* Data received by an API must pass server-side validation routines 
* Implement throttling/rate-limiting mechanisms to protect from a DoS attack 

Improper Key Management 
* APIs should use secure authentication and authorization such as SAML or OAuth/OIDC before accessing data 
* Warning: Do not hardcode or embed a key into the source code 
* Delete unnecessary keys and regenerate keys when moving into a production environment 

[Insufficient] Logging and Monitoring 
* Warning: SaaS may not supply access to log files or monitoring tools 
* Logs must be copied to non-elastic storage for long-term retention 

Unprotected Storage 
* Cloud storage containers are referred to as buckets or blobs 
* Warning: Access control to storage is administered through container policies, IAM authorizations, and object ACLs 
* Incorrect permissions may occur due to default read/write permissions left over from creation 
* Incorrect origin settings may occur when using content delivery networks 
* Warning: Weak CORS policies expose the site to vulnerabilities like XSS 

Cross Origin Resource Sharing [CORS] Policy: A content delivery network policy that instructs the browser to treat requests from nominated domains as safe 