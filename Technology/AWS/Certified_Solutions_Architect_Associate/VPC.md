# VPC # 

## VPC Overview ## 
VPC - akin to a virtual datacenter in the cloud 

Amazon VPC lets one provision a logically isolated section of the AWS Cloud where one can launch AWS resources in a defined virtual network 

Have complete control over the virtual networking environment, including selection of IP address range, creation of subnets, and configuration of route tables and network gateways 

Can easily customize the network configuration for a VPC - e.g., can create public-facing subnets for webservers that have access to the internet, and place backend systems such as databases or application servers in a private-facing subnet with no internet access 

Can leverage multiple layers of security, including security groups and network access control lists, to help control access to EC2 instances in each subnet 

Additionally, can create a Hardware Virtual Private Network [VPN] connection between one's corporate datacenter and a VPC and leverage the AWS Cloud as an extension of the corporate datacenter 

What can be done with a VPC?: 
* Launch instances into a subnet of choice 
* Assign custom IP address ranges in each subnet 
* Configure route tables between subnets 
* Create internet gateway and attach it to a VPC 
* Much better security control over AWS resources 
* Instance security groups 
* Subnet network access control lists 

Default VPC vs. Custom VPC: 
* Default VPC is user-friendly, allowing to immediately deploy instances 
* All subnets in default VPC have a route out to the internet 
* Each EC2 instance has both a public and private IP address 

VPC Peering: 
* Allows to connect one VPC with another via a direct network route using private IP addresses 
* Instances behave as if they were on the same private network 
* Can peer VPCs with other AWS accounts as well as with other VPCs in the same account 
* Peering is in a star configuration - i.e., one central VPC peers with four others - NO TRANSITIVE PEERING 
* Can peer between regions 

When creating a VPC, a default route table, network ACL, and a default SG are created along with it - will not create any subnets nor a default internet gateway [must be created by user] 

Amazon always reserves five IP addresses within subnets 

Can only have one IG per VPC 

SGs cannot span VPCs 

## NAT Instances & NAT Gateways ## 
NAT: Network Address Translation 

https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html 

When creating a NAT instance, must disable source/destination check on the instance 

NAT instances 
* must be in a public subnet 
* There must be a route out of the private subnet to the NAT instance, in order for this to work 
* The amount of traffic that NAT instances can support depends on the instance size - if bottlenecking, increase the instance size 
* Can create high availability using ASGs, multiple subnets in different AZs, and a script to automate failover 
* Behind an SG 

NAT Gateways: 
* Redundant inside the AZ 
* Preferred by the enterprise 
* Starts at 5Gbps and scales currently to 45Gbps 
* No need to patch 
* Not associated with SGs 
* Automatically assigned a public IP address 
* Remember to update route tables 
* No need to disable source/destination checks 
* If have resources in multiple AZs and they share one NAT Gateway, in the event that the NAT Gateway's AZ is down, resources in the other AZs lose internet access 
* To create an AZ-independent architecture, create a NAT Gateway in each AZ and configure routing to ensure that resources use the NAT Gateway in the same AZ 

NACL: 
* VPC automatically comes with a default network ACL, and by default, it allows all outbound and inbound traffic 
* Can create custom NACLs - by default, each custom NACL denies all inbound and outbound traffic until specific allow/deny rules are added 
* Each subnet in a VPC must be associated with a NACL - if a subnet is not explicitly associated with a NACL, the subnet is automatically associated with the default NACL 
* Can block IP addresses using NACLs but not using SGs 
* Can associate a NACL with multiple subnets; however, a subnet can only be associated with one NACL at a time - when associating a NACL with a subnet, the previous association is removed 
* NACLs contain a numbered list of rules that are evaluated in order, starting with the lowest-numbered rule 
* NACLs have separate inbound and outbound rules, and each rule can either allow or deny traffic 
* NACLs are stateless; responses to allowed inbound traffic are subject to the rules for outbound traffic, and vice-versa 