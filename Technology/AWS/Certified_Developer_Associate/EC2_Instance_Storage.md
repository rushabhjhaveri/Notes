# EC2 Instance Storage # 

## EBS Overview ## 

An EBS [Elastic Block Store] is a network drive that can be attached to instances while they run 

Allows instances to persist data, even after termination 

Usually attacked to one instance at a time; "multi-attach" feature for some EBS 

Bound to a specific availability zone 

Uses network to communicate with the instance, which means there might be a bit of latency 

Can be detached from an EC2 instance and attached to another one quickly 

To move an EBS volume across AZs, first need to snapshot it 

Has provisioned capacity [size in GBs, and IOPS] 

Delete on Termination Attribute controls the EBS behavior when an EC2 instance terminates 
* By default, the root EBS volume is deleted [attribute enabled] 
* By default, any other attached EBS volume is not deleted [attribute disabled] 
* This can be controlled by the AWS conole/CLI 

Use case: preserve root volume when instance is terminated 

## EBS Snapshots ## 

Make a backup [snapshot] of EBS volumes at a point in time 

Not necessary to detach volume to do snapshot, but recommended 

Can copy snapshots across AZs or regions 

EBS Snapshots Features: 
* EBS Snapshot Archive: 
    * Move a snapshot to an "archive tier" that is 75% cheaper 
    * Takes within 24-72 hours for restoring the archive 
* Recycle Bin for EBS Snapshots: 
    * Setup rules to retain deleted snapshots so they can be recovered after accidental deletion 
    * Specify retention [from one day to one year] 
* Fast Snapshot Restore [FSR]: 
    * Force full initialization of snapshot to have no latency on the first use [$$$] 

## AMI Overview ## 

AMI = Amazon Machine Image 

AMI are a customization of an EC2 instance 
* Add one's own software, configuration, OS, monitoring, etc. 
* Faster boot/configuration time because all the software is pre-packaged 

AMIs are built for a specific region [and can be copied across regions] 

## EC2 Instance Store ## 

EBS volumes are network drives with good but "limited" performance 

If a high-performance hard disk is desired, use EC2 Instance Store 

Better I/O performance 

EC2 Instance Store lose their storage if they are stopped [ephemeral storage] 

Good for buffer / cache / scratch data / temporary content 

Risk of data loss if hardware fails 

Backup and replication are customer's responsibility 

## EBS Volume Types ## 

gp2/gp3 [SSD]: General purpose SSD volume that balances price and performance for a wide variety of workloads 

io1/io2 [SSD]: Highest-performance SSD volume for mission-critical low-latency or high-throughput workloads 

st1 [HDD]: Low cost HDD volume designed for frequently accessed, throughput-intensive workloads 

sc1 [HDD]: Lowest cost HDD volume designed for less frequently accessed workloads 

EBS volumes are characterized in size / throughput / IOPS 

Only gp2/gp3 and io1/io2 can be used as boot volumes 

Provisioned IOPS [PIOPS] SSD: 
* Critical business applications with sustained IOPS performance 
* Or applications that need more than 16000 IOPS 
* Great for database workloads [sensitive to storage performance and consistency] 

Over 32000 IOPS, need EC2 nitro for PIOPS 

## EBS Multi-Attach ## 

Attach the same EBS volume to multiple EC2 instances in the same AZ 

Each instance has full read & write permissions to the high-performance volume 

Use cases: achieve higher application availability in clustered Linux applications / application must manage concurrent write operations 

Up to 16 instances at a time 

Must use a file system that is cluster-aware 

## Amazon EFS ## 

Managed NFS [network file system] that can be mounted on many EC2s 

EFS works with EC2 instances in multiple AZs 

Highly available, scalable, expensive [3x gp2], pay per use 

Use cases: content management, web serving, data sharing, Wordpress 

Uses NFSv4.1 protocol 

Uses security group to control access to EFS 

Compatible with Linux-based AMI [not Windows] 

Encryption at rest using KMS 

POSIX file system [~Linux] that has a standard file API 

File system scales automatically, pay-per-use, no capacity planning! 