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

### Volumes & Snapshots ### 
Volumes exist on EBS - think of EBS as a virtual hard disk 

Snapshots exist on S3 - think of snapshots as a photograph of the disk 

Snapshots are point-in-time copies of Volumes 

Snapshots are incremental - this means that only the blocks that have changed since the last snapshot will be moved to S3 

The first snapshot may take some time to create 

To create a snapshot for EBS volumes that serve as root devices, it is best practice to stop the instance before taking the snapshot [however, can take a snap while the instance is running] 

Can create AMI's from Snapshots 

Can change EBS volume sizes on the fly, including changing the size and storage type 

Volumes will ALWAYS be in the same AZ as the EC2 instance 

To move an EC2 volume from one AZ to another, take a snapshot of it, create an AMI from the snapshot, and then use the AMI to launch the EC2 instance in a new AZ 

To move an EC2 volume from one region to another, take a snapshot, create an AMI from the snapshot, and then copy the AMI from one region to the other - then use the copied AMI to launch the new EC2 instance in the new region 

### AMI Types [EBS vs Instance Store] ### 
Can select AMI's based on: 
* Region 
* OS 
* Architecture [32/64-bit] 
* Launch permissions 
* Storage for the root device [root device volume] 
    * Instance Store [ephemeral storage] 
    * EBS Backed Volumes 

All AMIs are categorized as either backed by Amazon EBS or backed by instance store 

For EBS Volumes: the root device for an instance launched from the AMI is an Amazon EBS volume created from an Amazon EBS snapshot 

For Instance Store Volumes: the root device launched from the AMI is an instance store volume created from a template stored in Amazon S3 

Instance store volumes cannot be stopped - if the underlying host fails, all data on that instance will be lost 

EBS backed instances can be stopped - data will not be lost on this instance if it is stopped 

Both types can be rebooted without any loss of data 

By default, both ROOT volumes will be deleted on termination; however, with EBS volumes, can tell AWS to keep the root device volume 

## ENI vs ENA vs EFA ## 
ENI: Elastic Network Interface - essentially, a virtual network card 
* Virtual netowrk card for EC2 instances 
* It allows: 
    * a primary private IPv4 address from the IPv4 address range of the VPC 
    * one or more secondary private IPv4 addresses from the IPv4 address range of the VPC 
    * one Elastic IP address [IPv4] per private IPv4 address 
    * one public IPv4 address 
    * one or more IPv6 addresses 
    * one or more security groups 
    * a MAC address 
    * a source/destination check flag 
    * a description 
* Use case scenarios: 
    * Create a management network 
    * Use network and security appliances in the VPC 
    * Create dual-homed instances with workloads/roles on distinct subnets 
    * Create a low-budget, high-availability solution 

EN: Enhanced Networking - uses single root I/O virtualization [SR-IOV] to provide high-performance networking capabilities on supported instance types 
* SR-IOV is a method of device virtualization that provides higher I/O performance and lower CPU utilization when compared to traditional virtualized network interfaces 
* Enhanced networking provides higher bandwidth, higher packet per second [PPS] performance, and consistently lower inter-instance latencies 
* No additional charge for using enhanced networking 
* Use where good network performance is desired 
* Depending on the instance type, enhanced networking can be enabled using: 
    * Elastic Network Adapter [ENA]: supports network speeds of up to 100Gbps for supported instance types 
    * Intel 82599 Virtual Function [VF] interface: supports network speeds of up to 10Gbps for supported instance types [typically used on older instances] 
    * NOTE: In any scenario question on the exam, probably want to choose ENA over VF if given the option 

EFA: Elastic Fabric Adapter - a network device that can be attached to an EC2 instance to accelerate High Performance Computing [HPC] and machine learning applications 
* EFA provides lower and more consistent latency and higher throughput than the TCP transport traditionally used in cloud-based HPC systems 
* EFA can use OS-bypass - OS bypass enables HPC and ML applications to bypass the OS kernel and to communicate directly with the EFA device; making it a lot faster with a lot lower latency [not supported with Windows currently, only Linux] 

## Encrypted Root Device Volumes & Snapshots ## 
Snapshots of encrypted volumes are encrypted automatically 

Volumes restored from encrypted snapshots are encrypted automatically 

Can share snapshots, but only if they are unencrypted 

These snapshots can be shared with other AWS accounts or made public 

Can now encrypt root device volumes upon creation of the EC2 instance 

If the root device volume was not encrypted at creation, it can be done so afterwards by creating a snapshot of the unencrypted root device volume, creating a copy of the snapshot and selecting the encrypt option, creating an AMI from the encrypted snapshot, and then using said AMI to launch new encrypted instances 

## Spot Instances & Spot Fleets ## 

### Spot Instances ### 

EC2 Spot instances enables taking advantage of unused EC2 capacity in the AWS Cloud 

Spot instances are available at up to a 90% discount compared to on-demand prices 

Can use spot instances for various stateless, fault-tolerant, or flexible applications, such as big data. containerized workloads, CI/CD, web servers, high-performance computing [HPC], and other test and development workloads 

To use spot instances, must first decide on a max spot price - the instance will be provisioned so long as the spot price is below the desired max spot price 

The hourly spot price varies depending on capacity and region 

If the spot price goes above the specified maximum, have two minutes to choose whether to stop or terminate the running instance[s] 

Can also utilize spot blocks to stop spot instances from being terminated even if the spot price goes above the specified max - can set spot blocks for one to six hours currently 

Spot instances not recommended for persistent workloads, critical jobs, and databases 

### Spot Fleets ### 

Spot Fleets: a collection of spot instances, and optionally, on-demand instances 

The spot fleet attempts to launch the number of spot instances and on-demand instances to meet the target capacity specified in the spot fleet request 

The request for spot instances is fulfilled if there is available capacity and the maximum price specified in the request exceeds the current spot price 

The spot fleet also attempts to maintain its target capacity fleet if spot instances are interrupted 

Set up different launch pools, define things like EC2 instance type, OS, AZ 

Can have multiple pools, and the fleet will choose the best way to implement depending on the strategy defined 

Spot fleets will stop launching instances once the price threshold or desired capacity is reached 

Strategies: 
* capacityOptimized: the spot instances come from the pool with optimal capacity for the number of instances launching 
* lowestPrice: the spot instances come from the pool with the lowest price [this is the default strategy] 
* diversified: the spot instances are distributed across all pools 
* InstancePoolsToUseCount: the spot instances are distributed across the number of spot instance pools specified [this parameter is valid only when used in combination with lowestPrice] 

## EC2 Hibernate ## 
If an instance is stopped, the data is kept on the disk [with EBS] and will remain on the disk until the EC2 instance is started 

If the instance is terminated, then by default, the root device volume will also be terminated 

When an EC2 instance is started, the following happens: 
* OS boots up 
* User data script runs [bootstrap scripts] 
* Applications start [can take some time] 

EC2 Hibernate: when an EC2 instance is hibernated, the OS is told to perform hibernation [suspend-to-disk] - hibernation saves the contents from the instance memory [RAM] to the EBS root volume - the instance's EBS root volume is persisted along with any attached EBS data volumes 

When an instance is started out of hibernation: 
* The EBS root volume is restored to its previous state 
* RAM contents are reloaded 
* The processes that were previously running on the instance are resumed 
* Previously attached data volumes are reattached and the instance retains its instance ID 

With EC2 Hibernate, the instance boots much faster - the OS does not need to reboot because the in-memory state [RAM] is preserved 

This is useful for: 
* Long-running processes 
* Services that take time to initialize 

Instances cannot be hibernated for more than 60 days 

## CloudWatch 101 ## 

CloudWatch is a monitoring service to monitor AWS resources, as well as the applications running on AWS 

CloudWatch can monitor things like: 
* Compute 
    * EC2 Instances 
    * Autoscaling Groups 
    * Elastic Load Balancers 
    * Route53 Health Checks 
* Storage & Content Delivery 
    * EBS Volumes 
    * Storage Gateways 
    * CloudFront 

Can create CloudWatch alarms which trigger notifications 

### CloudWatch & EC2 ### 
Host-level metrics consist of: 
* CPU 
* Network 
* Disk 
* Status Check 

Will monitor events every five minutes by default 

Can also have one-minute-intervals by turning on detailed monitoring 

### CloudTrail ### 
CloudTrail increases visibility into user and resource activity by recording AWS Management Console actions and API calls 

Can identify which users and accounts called AWS, the source IP from which the calls were made, and when the calls ocurred 

### CloudWatch vs CloudTrail ### 
CloudWatch monitors performance 

CloudTrail monitors API calls in the AWS platform 

## IAM Roles ## 
Roles are more secure thatn storing access key and secret access key on individual EC2 instances 

Roles are easier to manage 

Roles can be assigned to an EC2 instance after it is created using both the console and the command line 

Roles are universal - can be used in any region 