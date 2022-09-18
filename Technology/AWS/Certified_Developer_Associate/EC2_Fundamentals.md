# EC2 Fundamentals # 

## EC2 Basics ## 

EC2 = Elastic Compute Cloud = Infrastructure as a Service 

Capabilities: 
* Rent virtual machines [EC2] 
* Storing data on virutal devices [EBS] 
* Distributing load across machines [ELB] 
* Scaling services using auto-scaling [ASG] 

EC2 Sizing and Configuration Options: 
* OS: Linux, Windows, or macOS 
* Compute power and cores [CPU] 
* RAM 
* Storage space: network-attached [EBS/EFS] or hardware [EC2 Instance Store] 
* Network card: speed of the card / public IP address 
* Firewall rules: security group[s] 
* Bootstrap script [configure at first launch]: EC2 user data 

It is possible to bootstrap instances using EC2 user data script 

Bootstrapping: specify launch commands to be executed when a machine starts 

Bootstrap scripts are only run once at the instance's first start 

Common uses of bootstrap scripts: installing updates/software, downloading common files from the internet 

EC2 userdata script runs as root user 

## EC2 Instance Types ## 

General Purpose 
* Great for diversity of workloads such as web servers or code repositories 
* Balance between compute / memory / networking 

Compute Optimized 
* Great for compute-intensive tasks that require high-performance processors 
* E.g.: batch processing workloads / media transcoding / high performance web servers / high performance computing [HPC] / scientific modeling / machine learning / gaming servers 

Memory Optimized 
* Fast performance for workloads that process large data sets in memory 
* E.g.: high-performance relational/non-relational databases / distributed web scale cache stores / in-memory databases optimized for BI / applications performing real-time processing of big, unstructured data 

Accelerated Computing 

Storage Optimized 
* Great for storage-intensive tasks that require high, sequential read and write access to large data sets on local storage 
* E.g.: high frequency online transaction processing systems / relational and NoSQL databases / cache for in-memory databases / data warehousing applications / distributed file systems 

Instance Features 

Measuring Instance Performance 

AWS Instance Type naming convention: <instance class><generation>.<size within instance class> 

## Security Groups & Classic Ports Overview ## 

Security groups are fundamental to AWS network security 

Control how traffic is allowed into or otu of EC2 instances 

Only contain allow rules 

SG rules can reference IPs or other SGs 

Act as "firewalls" for EC2 instances 

Regulate access to ports, authorized IP ranges [IPv4 & IPv6], control of inbound/outbound network 

Can be attached to multiple instances 

Locked down to a region/VPC combination 

Good to maintain one separate SG for SSH access 

If application is not accessible [timeout], then likely it could be an SG issue 

However, if application gives a "connection refused", then it's an application error/launch issue, not an SG issue 

All inbound traffic is blocked by default 

All outbound traffic is authorized by default 

Port 22: SSH 
Port 21: FTP 
Port 22: SFTP 
Port 80: HTTP 
Port 443: HTTPS 
Port 3389: RDP 

## EC2 Instances Purchasing Options ## 

On-Demand Instances: short workload, predictable pricing, pay by second 

Reserved [1 & 3 years]: Reserved instances for long workloads, convertible reserved instances for long workloads with flexible instances 

Savings Plan [1 & 3 years]: commitment to an amount of usage, long workload 

Spot Instances: Short workloads, cheap, can lose instances [less reliable] 

Dedicated Hosts: Book an entire physical server, control instance placement 

Capacity Reservations: Reserve capacity in a specific AZ for any duration 

EC2 On Demand: 
* Pay per use 
    * Linux or Windows: billing per second after the first minute 
    * All other operating systems: billing per hour 
* Has the highest cost but no upfront payment 
* No long-term commitment 
* Recommended for short-term and uninterrupted workloads, where one cannot predict how the application will behave 

Reserved Instances: 
* Up to 72% discount compared to on-demand 
* Reserve specific instance attributes [instance type, region, tenancy, OS] 
* Reservation Period - 1 year [+discount] or 3 years [+++discount] 
* Payment Options - no upfront [+], partial upfront [++], all upfront [+++] 
* Reserved Instance's Scope - Regional or Zonal [reserve capacity in an AZ] 
* Recommended for steady-state usage applications [e.g., databases] 
* Can buy and sell in the Reserved Instance Marketplace 

EC2 Savings Plans: 
* Get a discount based on long-term usage [up to 72% - same as RIs] 
* Commit to a certain type of usage [$10/hr for 1-3 years] 
* Usage beyond EC2 Savings Plans is billed at the On-Demand price 
* Locked to a specific instance family and AWS region 
* Flexible across: instance size / OS / Tenancy 

EC2 Spot Instances: 
* Can get a discount of up to 90% compared to on-demand 
* Instances can be "lost" at any point of time if the max price is less than the current spot price 
* The most cost-efficient instances in AWS 
* Useful for workloads that are resilient to failure 
* E.g.: batch jobs / data analysis / image processing / any distributed workloads / workloads with a flexible start and end time 
* Not suitable for critical jobs or databases 

EC2 Dedicated Hosts: 
* A physical server wtih EC2 instance capacity fully dedicated for one's use 
* Allows to address compliance requirements and use existing server-bound licenses [per-socket, per-core, per-VM software licenses] 
* Purchasing options: 
    * on-demand - pay per second for active dedicated host 
    * reserved - 1 or 3 years [no upfront, partial upfront, all upfront] 
* The most expensive option 
* Useful for software that have complicated licensing model [BYOL] 
* Or for companies that have strong regulatory or compliance needs 

EC2 Dedicated Instances: 
* Instances run on hardware dedicated for one's use 
* May share hardware with other instances in same account 
* No control over instance placement [can move hardware after stop/start] 

EC2 Capacity Reservations: 
* Reserve on-demand instances capacity in a specific AZ for any duration 
* Always have access to EC2 capacity when needed 
* No time commitment [create/cancel anytime], no billing discounts 
* Combine with Regional Reserved Instances and Savings Plan to benefit from billing discounts 
* Charged at on-demand rate whether instances are run or not 
* Suitable for short-term, uninterrupted workloads that needs to be in a specific AZ 