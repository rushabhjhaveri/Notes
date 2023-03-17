# Route 53 # 

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

### Route 53 - Alias Records ### 

Maps a hostname to an AWS resource 

An extension to DNS functionality 

Automatically recognizes changes in the resource's IP addresses 

Unlike CNAME, it can be used for the top node of a DNS namespace [Zone Apex] 

Always of type A/AAAA for AWS resources [IPv4/IPv6] 

Can't set a TTL 

Targets include: ELBs, CloudFront distributions, API Gateway, Elastic Beanstalk environments, S3 websites, VPC Interface Endpoints, Global Accelerator accelerator, R53 record in the same hosted zone 

CANNOT set an Alias record for an EC2 DNS name 

## Routing Policy ## 

Define how Route 53 responds to DNS queries 

Not the same as LB routing, which routes traffic 

DNS does not route any traffic; only responds to DNS queries 

### Routing Policy - Simple ### 

Typically routes traffic to a single resource 

Can specify multiple values in the same record 

If multiple values are returned, a random one is chosen by the client 

When alias-enabled, specify only one AWS resource 

Can't be associated with health checks 

### Routing Policy - Weighted ### 

Control the % of requests that go to each specific resource 

Assign each record a relative weight 

Weights don't need to sum up to 100 

DNS records must have the same name and type 

Can be associated with health checks 

Use cases: load-balancing between regions, testing new application versions, etc. 

Assign a weight of 0 to a record to stop sending traffic to a resource 

If all records have a weight of 0, then all records will be returned equally 

### Routing Policy - Latency ### 

Redirect to the resource that has the least latency to respond 

Super helpful when latency for users is a priority 

Latency is based on traffic between users and AWS regions 

Can be associated with health checks [has a failover capability] 

### Routing Policy - Failover ### 

### Routing Policy - Geolocation ### 

Different from latency-based 

Based on user location 

Specify location by continent, country, or U.S. state [if overlapping, most precise location is selected] 

Should create a default record in case there is no match for location 

Use cases: website localization, restrict content distribution, load balancing 

Can be associated with health checks 

### Routing Policy - Geoproximity ### 

Route traffic to resources based on the geographic location of users and resources 

Ability to shift more traffic to resources based on the defined bias 

To change the size of the geographic region, specify bias values: 
* To expand [1-99] - more traffic to the resource 
* To shrink [-1-99] - less traffic to the resource

Resources can be AWS resources [specify region] or non-AWS resources [specify latitude and longitude] 

Must use Route 53 Traffic Flow [advanced] to use this feature 

### Routing Policy - Multi-Value ### 

Use when routing traffic to multiple resources 

R53 return multiple values/resources 

Can be associated with health checks [return only values for healthy resources] 

Up to 8 healthy records are returned for each multi-value query 

Multi-value is not a substitute for having an ELB 

## Route 53 - Traffic Flow ## 

Simplify the process of creating and maintaining records in large and complex configurations 

Visual editor to manage complex routing decision trees 

Configurations can be saved as traffic flow policy 

## Route 53 Health Checks ## 

## Third Party Domains & Route 53 ## 

### Domain Registrar vs DNS Service ### 

Buy or register domain name with a domain registrar typically by paying annual charges 

The domain registrar usually provides a DNS service to manage DNS records 

Can use another DNS service to manage DNS records; not just AWS R53 

Example: purchase domain from GoDaddy and use R53 to manage the DNS record 

