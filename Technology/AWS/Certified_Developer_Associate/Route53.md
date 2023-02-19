# Route 53 # 

## Route 53 - TTL ## 

High TTL: less traffic on R53, but possibly outdated records 

Low TTL: more traffic on R53, but records are outdated for less time; easier to change records  

Except for Alias records, TTL is mandatory for each DNS record 

## CNAME vs Alias ## 

AWS resources [LB/CloudFront] expose an AWS hostname 

CNAME: 
* Points a hostname to any other hostname 
* Only for non-root domain 

Alias: 
* Points a hostname to an AWS resource 
* Works for root domain as well as non-root domains 
## What is DNS? ## 

Domain Name System translates the human-friendly hostnames into the machine IP addresses 

DNS is the backbone of the internet 

DNS uses hierarchical naming structure 

### DNS Terminologies ### 

Domain Registrar 

DNS Records 

Zone File 

Name Server 

Top Level Domain 

Second Level Domain 

## Route 53 Overview ## 

A highly available, scalable, fully managed and authoritative DNS 

Authoritative = customer can update DNS records 

Route 53 is also a domain registrar 

Ability to check the health of resources 

Only AWS service which provides 100% availability SLA 

### Route 53 - Records ### 

How traffic will be routed for a domain 

Each record contains a domain/subdomain name, record type, value, routing policy, TTL 

Route 53 supports the following DNS record types: A / AAAA / CNAME / NS, as well as CAA / DS / MX / NAPTR / SOA / TXT / SPF / SRV 

### Route 53 - Record Types ### 

A - maps hostname to IPv4 

AAAA - maps hostname to IPv6 

CNAME - maps hostname to another hostname 
* Target is a domain name which must have an A or AAAA record 
* Can't create a CNAME record for the top node of a DNS namespace [Zone Apex] 
* e.g., can't create for example.com, but can for www.example.com 

NS - name servers for the hosted zone 

### Route 53 - Hosted Zones ### 

A container for records that define how to route traffic to a domain and its subdomains 

Public Hosted Zones - contains records that specify how to route traffic on the internet [public domain names] 

Private Hosted Zones - contain records that specify how to route traffic within one or more VPCs [private domain names] 

Pay $0.50 per month per hosted zone 
