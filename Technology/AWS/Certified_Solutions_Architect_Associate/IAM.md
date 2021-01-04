# Identity & Access Management and S3 # 

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

## Key Terminology for IAM ## 
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

## S3 - The Basics ##

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

### Data Consistency Model for S3 ### 

Read after write consistency for PUTS of new objects - if you write a new file and read it immediately after, you will be able to view that data 

Eventual consistency for overwrite PUTS and DELETES [can take some time to propagate] - if you update an _existing_ file or delete a file and read it immediately, you may get the older version, or you may not - basically, changes to objects can take a little bit of time to propagate 

### S3 Guarantees ### 

Built for 99.99% availability for the S3 platform 

Amazon guarantees 99.9% availability 

Amazon guarantees 99.999999999% durability for S3 information [remember 11x9's] 

### S3 Features ### 

S3 has the following features available: 
* Tiered Storage Available 
* Lifecycle Management 
* Versioning 
* Encryption 
* MFA Delete 
* Secure Data Using Access Control Lists & Bucket Policies 

### S3 Storage Classes ### 

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

### S3 - Charges ### 

Charged for S3 in the following ways: 
* storage 
* requests 
* storage management pricing 
* data transfer pricing 
* transfer acceleration 
* cross-region replication pricing 

### S3 Transfer Acceleration ### 

S3 transfer acceleration enables fast, easy, and secure transfer of files over long distances between end-users and an S3 bucket 

Transfer acceleration takes advantage of Amazon CloudFront's globally distributed edge locations; as the data arrives at an edge location, the data is routed to S3 over an optimized network path 

## S3 Pricing Tiers ## 
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

## S3 Security & Encryption ## 

By default, all newly created buckets are _private_ 

Can set up access control to buckets via _bucket policies_ and _access control lists_ 

S3 buckets can be configured to create access logs, which log all requests made to the bucket -- these logs can be sent to another bucket and even to another bucket in another account 

Encryption in transit is achieved by SSL/TLS 

Encryption at rest [server-side encryption, or SSE] is achieved by: 
* S3 Managed Keys [SSE-S3] 
* AWS Key Management Service, Managed Keys [SSE-KMS] 
* Server Side Encryption With Customer Provided Keys [SSE-C] 

Client-Side Encryption 

## S3 Versioning ## 

Using versioning with S3: 
* stores all versions of an object, including all writes and even if you delete an object 
* great backup tool 
* once enabled, *versioning cannot be disabled*; it can only be _suspended_ 
* integrates with _lifecycle rules_ 
* comes with MFA-Delete capability, which uses MFA to provide an additional layer of security when performing actions with critical effects 

## Lifecycle Management ## 

Automates moving objects between different storage tiers 

Can be used in conjunction with versioning 

Can be applied to current versions as well as previous versions 

## S3 Object Lock and Glacier Vault Lock ## 
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