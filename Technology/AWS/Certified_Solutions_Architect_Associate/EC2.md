# EC2 - Elastic Compute Cloud # 

## Introduction ## 

Amazon Elastic Compute Cloud [EC2] is a web service that provides resizable compute capacity in the cloud 

EC2 reduces the time required to obtain and boot new server instances to minutes, thereby allowing for the quick scaling of capacity; both up and down, as computing requirements change 

## EC2 Pricing Models ## 
On-Demand 
* allows to pay a fixed rate by the hour [or second] with no committment 
* useful for: 
    * users that want the low cost and flexibility of EC2 without any up-front payment or long-term committment 
    * applications with short-term, spikey, or unpredictable workloads that cannot be interrupted 
    * applications being developed or tested on EC2 for the first time 

Reserved 
* provides a capacity reservation, and offers a significant discount on the hourly charge for an instance -- contract terms are 1 year or 3 year terms 
* useful for: 
    * applications with steady state or predictable usage 
    * applications that require reserved capacity 
    * users able to make upfront payments to reduce their total computing costs even further 
* reserved pricing types: 
    * Standard Reserved Instances: offer up to 75% off on demand instances; the more paid up-front and the longer the contract, the greater the discount 
    * Convertible Reserved Instances: offer up to 54% off on demand capability to change the attributes of the RI as long as the exchange results in the creation of RIs of equal or greater value 
    * Scheduled Reserved Instances: available to launch within the time windows reserved; this option allows to match capacity reservations to a predictable recurring schedule that only requires a fraction of a day, week, or month  

Spot 
* enables to bid for whatever price is desired for instance capacity, providing for even greater savings if applications have flexible start and end times 
* useful for: 
    * applications that have flexible start and end times 
    * applications that are only feasible at very low compute prices 
    * users with urgent computing needs for large amounts of additional capacity 
* if the Spot instance is terminated by EC2 then will not be charged for a partial hour of usage; however if it us terminated by the developer themself, then they will be charged for any hour in which the instance ran 

Dedicated Hosts 
* physical EC2 server dedicated for use -- can help reduce costs by allowing to use existing server-bound software licenses 
* useful for: 
    * regulatory requirements that may not support multi-tenant virtualization 
    * great for licensing which does not support multi-tenancy or cloud deployments 
    * can be purchased on-demand [hourly] 
    * can be purchased as a reservation for up to 70% off the on-demand price 

## Launching An EC2 Instance ## 
Termination Protection turned *off* by default; must be turned on manually 

On an EBS-backed instance, the default action is for the root EBS volume to be deleted when the instance is terminated 

EBS Root Volumes of the default AMI's CAN be encrypted; can also use a third-party tool [bitlocker, etc.] to encrypt the root volume, or this can be done when creating AMI's in the AWS Console or using the API 

Additional volumes can also be encrypted 

## Security Groups ## 
All inbound traffic is blocked by default 

All outbound traffic is allowed 

Changes to Security Groups take effect immediately 

Can have any number of EC2 instancesz within a security group 

Can have multiple security groups attached to EC2 instances 

Security Groups are *stateful* - creating an inbound rule to allow traffic in automatically results in the creation of an outbound rule to allow traffic back out 

Cannot block specific IP addresses using security groups; use Network Access Control Lists [NACLs] instead 

Can specify allow rules, but not deny rules 

## EBS ## 

### EBS 101 ### 

Elastic Block Store [EBS] provides persistent block storage volumes for use with EC2 instances in the AWS Cloud 

Each EBS volume is automatically replicated within its AZ to protect users from component failure, offering high availability and durability 

Five different types of EBS storage: 
* General Purpose [SSD] 
    * General-purpose SSD volume that balances price and performance for a wide variety of transactional workloads 
    * Use cases: most workloads 
    * API name: gp2 
    * Volume size: 1GB - 16TB 
    * Max IOPS volume: 16000 
* Provisioned IOPS [SSD] 
    * Highest-performance SSD volume designed for mission-critical applications 
    * Use cases: databases 
    * API name: io1 
    * Volume size: 4GB - 16TB 
    * Max IOPS volume: 64000 
* Thoughput Optimized Hard Disk Drive [HDD] 
    * Low-cost HDD volume designed for frequently-accessed, throughput-intensive workloads  
    * Use cases: big data and data warehouses  
    * API name: st1  
    * Volume size: 500GB - 16TB 
    * Max IOPS volume: 500 
* Cold Hard Disk Drive [HDD] 
    * Low-cost HDD volume designed for less-frequently accessed workloads 
    * Use cases: file servers  
    * API name: sc1 
    * Volume size: 500GB - 16TB 
    * Max IOPS volume: 250 
* Magnetic [HDD] 
    * Previous generation HDD  
    * Use cases: workloads where data is infrequently accessed   
    * API name: standard 
    * Volume size: 1GB - 1TB 
    * Max IOPS volume: 40-200  