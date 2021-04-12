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

## VPC Flow Logs ## 
VPC Flow Logs is a feature that enables the capture of information about the IP traffic going to and from network interfaces in a VPC 

Flow log data is stored using Amazon CloudWatch logs 

After creating a flow log, can view and retrieve its data in CloudWatch logs 

Flow logs can be created at three levels: 
* VPC 
* Subnet 
* Network Interface 

Cannot enable flow logs for VPCs that are peered with a VPC unless the peer VPC is in the same account 

Can now tag flow logs 

After creating a flow log, cannot change its configuration [e.g., cannot associate a different IAM role with the flow log] 

Not all IP traffic is monitored; 
* Traffic generated by instances when they contact the Amazon DNS server - if using own DNS server, then all traffic to that DNS is logged 
* Traffic generated by a Windows instance for Amazon Windows license activation 
* Traffic to/fro 169.254.169.254 for instance metadata 
* DHCP traffic 
* Traffic to the reserved IP address for the default VPC router 

## Bastion Hosts ## 

A bastion host is a special-purpose computer on a network specifically designed and configured to withstand attacks 

The computer generally hosts a single application, e.g., a proxy server, and all other services are removed or limited to reduce the threat to the computer 

It is hardened in this manner primarily due to its location and purpose, which is either on the outside of a firewall or in a DMZ and usually involves access from untrusted networks or computers 

A NAT Gateway or NAT instance is used to provide internet traffic to EC2 instances in private subnets 

A bastion is used to securely administer EC2 instances [using SSH or RDP] - bastions are also called jumpboxes 

Cannot use a NAT Gateway as a bastion host 

## Direct Connect ## 
AWS Direct Connect is a cloud service solution that makes it easy to establish a dedicated network connection from org-prem to AWS 

Using AWS Direct Connect, can establish private connectivity between AWS and the datacenter, office, or colocation environment, which in many cases, can reduce network costs, increate bandwidth throughput, and provide a more consistent netowrk experience than internet-based connections 

## Global Accelerator ## 
AWS Global Accelerator is a service in which one can create accelerators to improve availability and performance of applications for local and global users 

Global Accelerator directs traffic to optimal endpoints over the AWS global network - this improves the availability and performance of internet applications that are used by a global audience 

By default, Global Accelerator provides two static IP addresses that are associated with one's accelerator - alternatively, can bring one's own 

Global Accelerator includes the following components: 
* Static IP addresses 
    * By default, Global Accelerator provides two static IPs that can be associated with one's accelerator 
    * Or, can bring one's own IPs 
* Accelerator 
    * Directs traffic to optimal endpoints over the AWS global network to improve the availability and performance of internet applications 
    * Each accelerator includes one or more listeners 
* DNS Name 
    * Global Accelerator assigns each accelerator a default DNS name - similar to a1234567890abcdef.awsglobalaccelerator.com - that points to the static IP addresses that Global Accelerator assigns 
    * Depending on the use case, can use the accelerator's static IP address or DNS name to route traffic to the accelerator, or set up DNS records to route traffic using a custom domain name 
* Network Zone 
    * A network zone services the static IP addresses for one's accelerator from a unique IP subnet 
    * Similar to an AZ, a network zone is an isolated unit with its own set of physical infrastructure 
    * When configuring an accelerator, by default, Global Accelerator allocates two IPv4 addresses for it 
    * If one IP address from a network zone becomes unavailable due to IP address blocking by certain client networks, or network disruptions, client applications can retry on the healthy static IP address from the other isolated network zone 
* Listener 
    * A listener processes inbound connections from clients to Global Accelerator, based on the port [or port range] and protocol that is configured 
    * Global Accelerator supports both TCP and UDP protocols 
    * Each listener has one or more endpoint groups associated with it, and traffic is forwarded to endpoints in one of the groups 
    * Associate endpoint groups with listeners by specifying the regions that traffic needs to be distributed to 
    * Traffic is distributed to optimal endpoints within the endpoint groups associated with a listener 
* Endpoint Group 
    * Each endpoint group is associated with a specific AWS region 
    * Endpoint groups include one or more endpoints in the region 
    * Can increase or reduce the percentage of traffic that would be otherwise directed to an endpoint group by adjusting a setting called a traffic dial 
    * The traffic dial allows for easy performance testing or blue/green deployment testing for new releases across AWS regions 
* Endpoint 
    * Endpoint can be Network Load Balancers, Application Load Balancers, EC2 instances, or Elastic IP addresses 
    * An ALB endpoint can be internet-facing or internal 
    * Traffic is routed to endpoints based on configuration options that are chosen, such as endpoint weights 
    * For each endpoint, can configure weights, which are numbers that can be used to specify the proportion of traffic to route to each one 
    * This can be useful, e.g., to do performance testing within a region 

    ## VPC Endpoints ## 
    A VPC endpoint enables the ability to privately connect a VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection 

    Instances in the VPC do not require public IP addresses to communicate with resources in the service 

    Traffic between VPC and the other service does not leave the Amazon network 

    Endpoints are virtual devices - they are horizontally scaled, redundant, and highly available VPC components that allow communication between instances in the VPC and services without imposing availability risks or bandwidth constraints on network traffic  

    There are two types of VPC endpoints: 
    * Interface endpoints 
        * An interface endpoint is an elastic network interface with a private IP address that serves as an entry point for traffic destined to support a device 
        * The following services are supported: 
            * API Gateway 
            * CloudFormation 
            * CloudWatch 
            * CloudWatch Events 
            * CloudWatch Logs 
            * CodeBuild 
            * Config 
            * EC2 API 
            * ELB API 
            * KMS 
            * Kinesis Data Streams 
            * SageMaker, SageMaker Runtime 
            * SageMaker Notebook Instance 
            * Secrets Manager 
            * STS 
            * Service Catalog 
            * SNS 
            * SQS 
            * Systems Manager 
            * Endpoint services hosted by other AWS accounts 
            * Supported AWS Marketplace partner services 
    * Gateway endpoints 
        * The following services are supported: 
            * S3 
            * DynamoDB 

## AWS PrivateLink ## 
To open applications up to other VPCs, can either: 
* Open the VPC up to the internet: 
    * Security considerations; everything in the public subnet is public 
    * A lot more to manage 
* Use VPC peering: 
    * Will have to create and manage many different peering relationships 
    * The whole network will be accessible - not good if there are multiple applications within the VPC 
* Use PrivateLink: 
    * The best way to expose a service VPC to tens, hundreds, or thousands of customer VPCs 
    * Doesn't require VPC peering; no route tables, NAT, IGWs, etc. 
    * Requires a network load balancer on the service VPC and an ENI on the customer VPC 

## AWS Transit Gateway ## 
Allows to have transitive peering between thousands of VPCs and on-prem data centers 

Works on a hub-and-spoke model 

Works on a regional basis, but can have it across multiple regions 

Can use it across multiple AWS accounts using RAM [Resource Access Manager] 

Can use route tables to limit how VPCs talk to one another 

Works with Direct Connect as well as VPN connections 

Supports IP multicast [not supported by any other AWS service] 

## AWS VPN CloudHub ## 
For multiple sites, each with its own VPN connection - can use AWS VPN CloudHub to connect those sites together 

Hub-and-spoke model 

Low cost; easy to manage 

Operates over the public internet; but all traffic between customer gateway and the AWS VPN CloudHub is encrypted 

## AWS Network Costs ## 
Use private IP addresses over public IP addresses to save on costs - this then utilizes the AWS backbone network 

To cut all netowrk costs, group EC2 instances in the same AZ and use private IP addresses - this will be cost-free, but keep in mind single-point-of-failure issues 