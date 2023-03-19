# VPC Fundamentals # 

## VPC, Subnets, IGW, & NAT ## 

### VPC & Subnets Primer ### 

VPC: private network to deploy resources [regional resource] 

Subnets allow to partition network inside a VPC [AZ resource] 

A public subnet is a subnet that is accessible from the internet 

A private subnet is a subnet that is not accessible from the internet 

To define access to the internet and between subnets, use Route Tables 

### Internet Gateway & NAT Gateways ### 

Internet Gateways help VPC instances connect with the internet 

Public subnets have a route to the internet gateway 

NAT Gateways [AWS-Managed] & NAT Instances [self-managed] allow instances in private subnets to access the internet while remaining private 

## NACL, SG, VPC Flow Logs ## 

### Network ACL & Security Groups ### 

NACL: A firewall which controls traffic to/fro a subnet 

NACL can have ALLOW and DENY rules 

NACL rules are attached at the subnet-level 

NACL rules only include IP addresses 

Security Group: A firewall that controls traffic to/fro an ENI/EC2 instance 

SGs can only have ALLOW rules 

SG rules include IP addresses and other SGs 

### VPC Flow Logs ### 

Capture information about IP traffic going into interfaces 

Includes VPC flow logs, subnet flow logs, ENI flow logs 

Helps monitor and troubleshoot connectivity issues; e.g., subnet to internet, subnet to subnets, internet to subnets 

Captures network information from AWS managed interfaces too; ELBs, ElastiCache, RDS, Aurora, etc. 

VPC flow logs data can go to S3/CloudWatch logs 

## VPC Peering, Endpoints, VPN, DX ## 

### VPC Peering ### 

Connect two VPCs privately using AWS' network 

Makes them behave as if they were in the same network 

Must not have overlapping CIDRs [IP address range] 

VPC Peering connection is not transitive [must be established for each VPC that need to communicate with one another] 

### VPC Endpoints ### 

Endpoints allow to connect to AWS Services using a private network instead of the public www network 

This gives enhanced security and lower latency to access AWS services 

VPC Endpoint Gateway: S3 & DynamoDB 

VPC Endpoint Interace: the rest 

Only used within the VPC 

### Site to Site VPN & Direct Connect ### 

Site to Site VPN: 
* Connect an on-premise VPN to AWS 
* The connection is automtically encrypted 
* Goes over the public internet 

Direct Connect [DX]: 
* Establish a physical connection between on-premises and AWS 
* The connection is private, secure, and fast 
* Goes over a private network 
* Takes at least a month to establish 

Note: Site-to-Site VPN and Direct Connect cannot access VPC endpoints 