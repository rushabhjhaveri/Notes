# Identity & Access Management and S3 # 

## IAM ## 

IAM allows the management of users and their level of access to the AWS Console 

IAM offers the following features: 
* centralized control of AWS account 
* shared access to AWS account 
* granular permissions 
* identity federation [incl. Active Directory, Facebook, Linkedin, etc.] 
* multifactor authentication 
* provide temporary access for users/devices and services where necessary 
* allows to set up custom password rotation policy 
* integrates with many different AWS services 
* supports PCI DSS compliance 

### Key Terminology for IAM ### 
Users: end-users, such as people, employees of an organization, etc. 

Groups: a collection of users with each user in the group inheriting the permissions of the group 

Policies: policies are made up of documents, called Policy Documents - these documents are JSON-formatted and give permissions as to what  auser/group/role is able to do 

Roles: roles can be created and assigned to AWS resources 

Notes: 
* IAM is universal - does not apply to regions 
* The "root account" is simply the account created when first setting up one's AWS account - it has complete admin access 
* New users have *NO PERMISSIONS* when first created 
* New users are assigned _Access Key ID_ and _Secret Access Keys_ when first created 
* These are NOT the same as a password - access key ID and secret access key cannot be used to login to the console - however, they can be used to access AWS via API's and command line interface 
* You only get to view these once - if lost, they will need to be regenerated, so save them in a secure location 

## S3 101 ## 

### S3 - The Basics ###

S3 - Simple Storage Service 

Provides developers and IT teams with secure, durable, highly-scalable object storage 

S3 is easy to use, has a simple web interface to store and retrieve any amount of data from anywhere on the web 

Essentially, S3 is a safe place to store files 

Object-based storage 

Data is spread across multiple devices and facilities 

S3 basics: 
* S3 is object based i.e., allows one to upload files 
* Files can be from 0 bytes to 5 TB 
* There is unlimited storage 
* Files are stored in buckets 
* S3 is universal namespace i.e., names must be unique globally 
* Bucket URL formats: 
    * https://<bucketname>.s3.amazonaws.com/ 
    * https://<bucketname>.<region>.amazonaws.com 
* When uploading a file to S3, will receive an *HTTP 200 code* if upload was successful 
* Think of objects as files 
* Objects consist of the following: 
    * key [name of the object] 
    * value [the data, made up of a sequence of bytes] 
    * version ID [important for versioning] 
    * metadata [data about the data being stored] 
    * subresources 
        * access control lists 
        * torrent 

#### Data Consistency Model for S3 #### 

Read after write consistency for PUTS of new objects - if you write a new file and read it immediately after, you will be able to view that data 

Eventual consistency for overwrite PUTS and DELETES [can take some time to propagate] - if you update an _existing_ file or delete a file and read it immediately, you may get the older version, or you may not - basically, changes to objects can take a little bit of time to propagate 

#### S3 Guarantees #### 

Built for 99.99% availability for the S3 platform 

Amazon guarantees 99.9% availability 

Amazon guarantees 99.999999999% durability for S3 information [remember 11x9's] 

#### S3 Features #### 

S3 has the following features available: 
* Tiered Storage Available 
* Lifecycle Management 
* Versioning 
* Encryption 
* MFA Delete 
* Secure Data Using Access Control Lists & Bucket Policies 

#### S3 Storage Classes #### 

S3 Standard 
* 99.99% availability 
* 99.999999999% durability 
* Stored redundancy across multiple devices in multiple facilities 
* Designed to sustain the loss of two facilities concurrently 

S3 - IA 
* IA -- Infrequently Accessed 
* For data that is accessed less frequently but requires rapid access when needed 
* Lower fee than S3 but there is a retrieval fee charged 

S3 One Zone - IA 
* For when a lower-cost option is desired for infrequently-accessed data, but do not require the multiple AZ data resilience 

S3 - Intelligent Tiering 
* Designed to optimize costs by automatically moving data to the most cost-effective access tier, without performance impact or operational overhead 

S3 - Glacier 
* Secure, durable low-cost storage class for data archiving 
* Reliably store any amount of data at costs that are competitive with or cheaper than on-premise solutions 
* Retrieval times configurable from minutes to hours 

S3 - Glacier Deep Archive 
* S3's lowest-cost storage class where a retrieval time of 12 hours is acceptable 

#### S3 - Charges #### 

Charged for S3 in the following ways: 
* storage 
* requests 
* storage management pricing 
* data transfer pricing 
* transfer acceleration 
* cross-region replication pricing 

#### S3 Transfer Acceleration #### 

S3 transfer acceleration enables fast, easy, and secure transfer of files over long distances between end-users and an S3 bucket 

Transfer acceleration takes advantage of Amazon CloudFront's globally distributed edge locations; as the data arrives at an edge location, the data is routed to S3 over an optimized network path 

### S3 Pricing Tiers ### 
What makes up the cost of S3: 
* Storage 
* Requests & Data Retrievals 
* Data Transfer 
* Management & Replication 

S3 Storage Tiers: 
* S3 Standard 
* S3 - IA 
* S3 One Zome - IA 
* S3 - Intelligent Tiering 
* S3 Glacier 
* S3 Glacier Deep Archive 

Understand how to get the best value out of S3 

Often, using S3 Intelligent Tiering will help save costs 

### S3 Security & Encryption ### 

By default, all newly created buckets are _private_ 

Can set up access control to buckets via _bucket policies_ and _access control lists_ 

S3 buckets can be configured to create access logs, which log all requests made to the bucket -- these logs can be sent to another bucket and even to another bucket in another account 

Encryption in transit is achieved by SSL/TLS 

Encryption at rest [server-side encryption, or SSE] is achieved by: 
* S3 Managed Keys [SSE-S3] 
* AWS Key Management Service, Managed Keys [SSE-KMS] 
* Server Side Encryption With Customer Provided Keys [SSE-C] 

Client-Side Encryption 

### S3 Versioning ### 

Using versioning with S3: 
* stores all versions of an object, including all writes and even if you delete an object 
* great backup tool 
* once enabled, *versioning cannot be disabled*; it can only be _suspended_ 
* integrates with _lifecycle rules_ 
* comes with MFA-Delete capability, which uses MFA to provide an additional layer of security when performing actions with critical effects 

### Lifecycle Management ### 

Automates moving objects between different storage tiers 

Can be used in conjunction with versioning 

Can be applied to current versions as well as previous versions 

### S3 Object Lock and Glacier Vault Lock ### 
Cam use S3 Object Lock to store objects using a _write once, read many_ [WORM] model 

Helps prevent objects from being deleted or modified for a fixed amount of time or indefinitely 

Can use S3 Object Lock to meet regulatory requirements that require WORM storage, and/or to add an extra layer of protection against object changes and deletion 

S3 Object Lock Modes: 
* Governance Mode: users can't overwrite or delete an object version or alter its lock settings unless they have special permissions. Protects objects against being deleted by most users, but can still grant some users permission to alter the retention settings or delete the object if necessary 
* Compliance Mode: a protected object version cannot be overwritten or deleted by any user, including the root user in the AWS account. When an object is locked in compliance mode, its retention mode can't be changed and its retention period can't be shortened. Compliance mode ensures an object version *cannot be overwritten or deleted* for the duration of the retention period 

Retention Period: protects an object version for a fixed amount of time. When a retention period is placed on an object version, S3 stores a timestamp in the object version's metadata to indicate when the retention period expires. After the retention period expires, the object version can be overwritten or deleted unless a legal hold is placed on the object version 

Legal Hold: similar to a retention period, a legal hold prevents an object version from being overwritten or deleted, but they do not have an associated retention period and remains in effect until removed. Legal holds can be freely placed and removed by any user who has the *s3:PutObjectLegalHold* permission 

S3 Glacier Vault Lock allows to easily deploy and enforce compliance controls for individual S3 Glacier vaults with a vault lock policy 

Can specify controls, such as WORM, in a vault lock policy and lock the policy from future edits 
* Once locked, the policy can no longer be changed 

### S3 Performance ### 
S3 Prefix: part of full S3 path between bucket name and filename 

S3 has extremely low latency - can get the first byte out of S3 within 100-200 milliseconds 

Can also achieve a high number of requests - 3500 PUT/COPY/POST/DELETE and 5500 GET/HEAD requests per second per prefix 

Can get better performance by spreading your reads _across different prefixes_ 

S3 limitations when using KMS: 
* if using SSE-KMS to encrypt objects in S3, then must keep in mind KMS limits 
* when uploading a file, the _GenerateDataKey_ call is made to the KMS API 
* When downloading a file, the _Decrypt_ call is made to the KMS API 
* Uploading/downloading will count towards the KMS quota 
* Region-specific, however, the KMS quota is usually 5500, 10000, or 30000 requests per second 
* Currently, cannot request a quota increase 

Multipart Uploads - enables parallelizing uploads to increase efficiency; recommended for files over 100 MB, required for files over 5GB 

S3 Byte-Range Fetches - enables parallelizing downloads by specifying byte ranges; if there's a failure in the download, it's only for a specific byte range 
* Can be used to speed up downloads 
* Can be used to just download partial amounts of file [e.g., header info] 

### S3 Select & Glacier Select ### 

S3 Select enables applications to retrieve only a subset of data from an object using simple SQL expressions 

By using S3 Select to retrieve only the data needed by the application [instead of the entire data object], can achieve a drastic performance increase - in many cases, can achieve as much as 400% improvement 

Similarly, Glacier Select allows to run SQL queries against Glacier directly 

### AWS Organizations & Consolidated Billing ### 
AWS Organizations is an account management service that enables the consolidation of multiple AWS accounts into an organization that one can create and centrally manage 

Advantages of Consolidated Billing: 
* one bill per AWS account 
* very easy to track charges and allocate costs 
* volume pricing discount 

Best Practices with AWS Organizations: 
* always enable MFA on root account 
* always use a strong and complex password on root account 
* paying account should be used for billing purposes only; do not deploy resources into the paying account 
* enable/disable AWS services using Service Control Policies [SCP] either on OUs or on individual accounts 

### Sharing S3 Buckets Across Accounts ### 
S3 - Cross-Account Access 

Three different ways to share S3 buckets  across accounts: 
* using bucket policies & IAM [applies across the entire bucket] -- programmatic access only 
* using bucket ACLs & IAM [individual objects] -- programmatic access only 
* cross-account IAM roles -- programmatic and console access 

### Cross Region Replication ### 
Versioning must be enabled on both the source and destination buckets 

Files in an existing bucket are not replicated automatically 

All subsequent updated files will be replicated automatically 

Delete markers are not replicated 

Deleting individual versions or delete markers will not be replicated 

### S3 Transfer Acceleration ### 
S3 Transfer Acceleration utilizes the CloudFront Edge Network to accelerate uploads to S3. 

Instead of uploading directly to an S3 bucket, one can use a distinct URL to upload directly to an edge location which will then transfer that file to S3 

Will get a distinct URL to upload to: e.g., acloudguru.s3-accelerate.amazonaws.com 

### AWS DataSync ### 
Basically allows one to move large amounts of data into AWS 

Typically used in an on-prem environment [a DataSync Agent is deployed] and automatically encrypts data and accelerates transfer over the WAN 

Seamlessly and securely connects to Amazon S3/EFS/FSx to copy data and metadata to and from AWS 

Performs automatic data integrity checks on data in-transit and at rest as well 

Used with NFS and SMB-compatible file systems 

Can also be used to replicate EFS to EFS 

Replication can be done hourly, daily, or weekly 

### CloudFront ### 
CloudFront is a content delivery network [CDN] 

A CDN is a system of distributed servers [network] that delivers webpages and other web content to a user based on the geographic location of the user, the origin of the webpage, and a content delivery server 

#### CloudFront - Key Terminology #### 
Edge Location: this is the location where the content will be cached; separate to an AWS Region/AZ 

Origin: this is the location of all the files that the CDN will distribute - can be an S3 Bucket, an EC2 Instance, an Elastic Load Balancer, or Route53 

Distribution: this is the name given the CDN which consists of a collection of Edge Locations 

Web Distribution: typically used for websites 

RTMP: used for media streaming 

#### Additional Notes #### 

Items stored in Edge Location are cached for the Time to Live [TTL] duration specified [a configurable item] 

TTL is measured in seconds 

CloudFront can be used to deliver an entire website, including dynamic, static, streaming, and interactive content using a global network of edge locations 

Requests for content are routed to the nearest edge location, so content is delivered with the best possible performance 

Edge Locations are not just read-only - can write to them too [i.e., put an object on to them] 

Can clear cached objects, but will be charged 

### CloudFront Signed URLs & Cookies ### 

#### URLs vs. Cookies #### 
Use CloudFront Signed URLs or Signed Cookies 

A signed URLis for individual files - 1 URL = 1 file  

A signed cookie is for multiple files - 1 cookie = multiple files 

#### Signed Cookie/URL Policies #### 
When creating a signed URL or signed cookie, a policy is attached 

Policy can include: 
* URL expiration 
* IP ranges 
* Trusted signers [which AWS accounts can create singed URLs] 

#### CloudFront Signed URL Features #### 
Can have different origins, does not have to be EC2 

Key-pair is account-wide and managed by the root user 

Can utilize caching features 

Can filter by date, path, IP address, expiration, etc. 

#### S3 Signed URL Features #### 

Issues a request as the IAM user who creates the pre-signed URL 

Limited lifetime 

### Snowball ### 
Snowball is a petabyte-scale data transport solution that uses secure appliances to transfer large amounts of data into and out of AWS 

Using Snowball addresses common challenges that accompany large-scale data transfers, including high network costs, long transfer times, and security concerns 

Transferring data with Snowball is simple, fast, secure, and can be as little as one-fifth the cost of high-speed internet 

Snowball comes in either a 50 TB or an 80 TB size 

Snowball uses multiple layers of security designed to protect data including tamper-resistant enclosures, 256-bit encryption, and an industry-standard Trusted Platform Module [TPM] designed to ensure both security and full chain-of-custody of the data 

Once the data transfer job has been processed and verified, AWS performs a software erasure of the Snowball appliance 

#### Snowball Edge #### 
100 TB data transfer device with on-board storage and compute capabilities; can be used to move large amounts of data into and out of AWS, as a temporary storage tier for large local datasets, or to support local workloads in remote or offline locations 

Connects to existing applications and infrastructure using standard storage interfaces, streamlining the data transfer process and minimizing setup and integration 

Snowball Edge can cluster together to form a local storage tier and process data on-premise, helping ensure applications continue to run even when they are unable to access the cloud 

#### Snowmobile #### 
Exabyte-scale data transfer service used to move extremely large amounts of data to AWS 

Can transfer up to 100 PB per Snowmobile, a 45-foot long ruggedized shopping container, pulled by a semi-trailer truck 

Makes it easy to move massive volumes of data to the cloud, including video libraries, image repositories, or even complete data center migration 

Transferring data with Snowmobile is secure, fast, and cost-effective 

### Storage Gateway ### 
AWS Storage Gateway is a service that connects on-premise software appliances with cloud-based storage to provide seamless and secure integration between an organization's on-premise IT environment and AWS' storage infrastructure 

The service enables the secure storage of data to the AWS cloud for scalable and cost-effective storage 

Storage Gateway's software appliance is available for download as a virtual machine [VM] image that is installed on a host in a datacenter 
* supports either VMWare ESXi of Microsoft HyperV 
* once the gateway has been installed, and has been associated with the AWS account via the activation process, the AWS Management Console can be used to create the appropriate storage gateway option 

#### Storage Gateway Types #### 
File Gateway: NFS and SMB 
* Files are stored as objects in S3 buckets, accessed through a Network File System [NFS] mount point 
* Ownership, permissions, and timestamps are durably stored in S3 in the user-metadata of the object associated with the file 
* Once objects are transferred to S3, they can be managed as native S3 objects, and bucket policies such as versioning,  lifecycle management, and cross-region replication apply directly to objects stored in the buckets 

Volume Gateway - iSCSI  
* The volume interface presents applications with disk volumes using the iSCSI block protocol 
* Data written to these volumes can be asynchronously backed up as point-in-time snapshots of volumes, and stored in the cloud as Amazon EBS snapshots 
* Snapshots are incremental backups that capture only changed blocks; all snapshot storage is also compressed to minimize storage charges 
* Stored volumes 
    * Enables the storage of primary data locally, while asynchronously backing up said data to AWS 
    * Provide on-prem applications with low-latency access to their entire datasets, while providing durable, off-site backups 
    * Can create storage volumes and mount them as iSCSI devices from on-prem application servers 
    * Data written to stored volumes is stored on on-prem storage hardware 
    * This data is then asynchronously backed up to AWS S3 in the form of Elastic Block Store [EBS] snapshots 
    * 1 GB - 16 TB in size for stored volumes 
* Cached volumes 
    * Enables the usage of S3 as primary data storage while retaining frequently accessed data locally in the storage gateway 
    * Minimize the need to scale on-prem storage infrastructure, while still providing applications with low-latency access to their frequently accessed data 
    * Can create storage volumes up to 32 TB in size and attach to them as iSCSI devices from on-prem application servers 
    * Gateway stores data that are written to these volumes in S3 and retains recently read data in on-prem storage gateway's cache and upload buffer storage 
    * 1 GB - 32 TB in size for cached volumes 

Tape Gateway - VTL 
* Offers durable, cost-effective solution to archive data in the AWS Cloud 
* Virtual Tape Libraray [VTL] interface it provides allows for the leveraging of existing tape-based backup application infrastructure to store data on virtual tape cartridges that can be created on the tape gateway 
* Each tape gateway is preconfigured with a media changer and tape drives, which are available to existing client backup applications as iSCSI devices 
* Add tape cartridges as needed to archive data 
* Supported by NetBackup, Backup Exec, Veeam, etc. 

### Athena vs. Macie ### 
#### Athena #### 
Interactive query service which enables the analysis and querying of data stored in S3 using standard SQL 
* Serverless, nothing to provision, pay per query/ per TB scanned 
* No need to set up complex Extract, Transform, Load [ETL] processes 
* Works directly with data stored in S3 

Use cases: 
* Can be used to query log files stored in S3, e.g., ELB logs, S3 access logs, etc. 
* Generate business reports on data stored in S3 
* Analyze AWS cost and usage reports 
* Run queries on click-stream data 

#### Macie #### 
Personally Identifiable Information [PII]: 
* Personal data used to establish an individual's identity 
* This data can be exploited by criminals, used in identity theft and financial fraud 
* Home address, email address, SSN 
* Passport Number, driver's license number 
* DOB, phone number, bank account number, credit card number 

Macie is a security service which uses machine learning and natural language processing [NLP] to discover, classify, and protect sensitive data stored in S3 
* Uses AI to recognize if S3 objects contain sensitive data such as PII 
* Dashboards, reporting, and alerts 
* Works directly with data stored in S3 
* Can also analyze CloudTrail logs 
* Great for PCI-DSS and preventing ID theft 