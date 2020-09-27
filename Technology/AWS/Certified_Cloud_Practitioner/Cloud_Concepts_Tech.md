# Cloud Concepts & Technology # 

## What is cloud computing? ## 

Cloud computing is the on-demand delivery of compute, database storage, applications, and other IT resources through a cloud services platform via the internet with pay-as-you-go pricing. 

Analogy: think of it as simply renting out someone else’s computer.


## The Six Advantages of Cloud Computing ## 

* Trade Capital Expense for Variable Expense: Instead of having to invest heavily in data centers and servers before you know how you’re going to use them, you can pay only when you consume computing resources, and pay only for how much you consume. Pay only for what you use. 

* Benefit from massive economies of scale: You will never have the same purchasing power as Amazon. They literally build their own servers!

* Stop guessing about capacity: You will probably either buy too much or too little. If you buy too much, you’ve wasted money and if you buy too little you will have down time. Cloud can scale with your business needs, with no long term contracts.

* Increase speed and agility: Using a new type of design called serverless architecture - scales infinitely with demand. 

* Stop spending money running and maintaining data centers: Focus on what you’re good at, not at managing infrastructure. Let someone else manage that for you.

* Go global in minutes: Easily deploy your application in multiple regions around the world with just a few clicks. This means you can provide lower latency and better experience for your customers at minimal cost.


## Three Types of Cloud Computing ## 

* Infrastructure As A Service (IAAS): You manage the server [which can be physical or virtual], as well as the operating system. Usually the data center provider will have no access to your server. E.G: EC2

* Platform As A Service (PAAS): Someone else manages the underlying hardware and operating systems. You just focus on your own applications. Someone else worries about security patching, updates, maintenance, etc. E.G.: goDaddy, Elastic Beanstalk

* Software As A Service (SAAS): All you manage is the software provided to you. Provider takes care of the data centers, servers, networks, storage, maintenance, patching, etc. All you worry about is the software itself and how you want to use it. E.G.: GMail


## Three Types of Cloud Computing Deployments ## 

* Public Cloud - AWS, Azure, GCP

* Hybrid - Mixture of public and private

* Private Cloud (Or On Premise) - You manage it in your datacenter. Openstack or VMWare.



## AWS Global Infrastructure ## 


19 regions and 57 global availability zones - December 2018

5 more regions and 15 more AZ’s for 2019


Think of an AZ as a data center. It may be several data centers, but because they are so close together, they are counted as one availability zone. 


Region: geographical area. Each region consists of 2 or more availability zones.


Edge locations are endpoints for AWS which are used for caching content. Typically this consists of CloudFront [Amazon’s Content Delivery Network (CDN)]. 


There are more edge locations than regions. Currently there are over 150 edge locations.


Different support packages

* Basic: Free 

* Developer: $29/month [scales based on usage]

* Business: $100/month [scales based on usage]

* Enterprise: $15,000/month [scales based on usage] - TAM [Technical Account Manager]


Billing alerts/ billing alarms will alert you automatically when a certain level of AWS spend has been reached. If you are learning AWS for the first time, you should turn it on so that you don’t spend money without realizing it. 


## IAM ## 


IAM stands for Identity Access Management. It is Global, you do not specify a region when dealing with an IAM. When you create a user or group, this is created GLOBALLY.


You can access the AWS platform in 3 ways: 

* Via the Console

* Programmatically [Using the Command Line]

* Using the Software Developers Kit [SDK] 


Your root account is the email address you used to set up your AWS account. The root account always has full administrator access. You should not give these account credentials away to anyone. Instead, create a user for each individual within your organization. You should always secure this root account using multi-factor authentication.


A group is simply a place to store your users. Your users will inherit all permissions that the group has. Examples of groups might be developers, system administrators, human resources, finance, etc. 


To set the permissions in a group you need to apply a policy to that group. Policies consist of a JavaScript Object Notation [JSON]. These are referred to as key-value pairs. You have your key, such as name, and then the value. e,g.: 

```
{

“Name”: “ACloudGuru”

}
```

## What is S3? ## 

Simple Storage Services


S3 provides developers and IT teams with secure, durable, highly-scalable object storage. Amazon S3 is easy to use, with simple web services interface to store and retrieve any amount of data from anywhere on the web.


Safe place to store your files.

Object-based storage.

Data is spread across multiple devices and facilities.


Basics of S3:

* Object based - allows you to upload files.

* Files can be from 0 bytes - 5 TB.

* Unlimited storage.

* Files are stored in buckets.


Universal namespace - names must be unique globally


When you upload a file to S3, you will receive an HTTP 200 code if the upload was successful. 


S3 is object based - think of objects just as files. 


Objects consist of the following:

* Key [name of the object]

* Value [this is simply the data and is made up of a sequence of bytes]

* Version ID [important for versioning]

* Metadata [data about the data you are storing]

* Subresources [access control lists, torrent]



How does data consistency work for S3? 

* Read after write consistency for PUTS of new objects

* Eventual consistency for overwrite PUTS and DELETES (can take some time to propagate]


If you write a new file and read it immediately afterwards, you will be able to view that data.


If you update AN EXISTING FILE or delete a file and read it immediately, you may get the older version, or you may not. Basically, changes to objects can take a bit of time to propagate.


S3 has the following guarantees from Amazon: 

* Built for 99.99% availability for the S3 platform. 

* Amazon Guarantee 99.9% availability. 

* Amazon guarantees 99.999999999% durability for S3 information. [Remember 11 x 9s]


S3 has the following features: 

* Tiered storage available

* Lifecycle management

* Versioning

* Encryption

* Secure your data using Access Control Lists and Bucket Policies


## S3 Storage Classes ## 

* S3 Standard: 99.99% availability, 99.999999999% durability, stored redundancy across multiple devices in multiple facilities, and is designed to sustain the loss of 2 facilities concurrently.

* S3-IA [Infrequently Accessed]: For data that is accessed less frequently, but requires rapid access when needed. Lower fee than S3, but you are charged a retrieval fee.

* S3 One Zone - IA: For when you want a lower cost option for infrequently accessed data, but do not require multiple Availability Zone data resilience. 

* S3-Intelligent Tiering: Designed to optimize costs by automatically moving data to the most cost-effective access tier, without performance impact or operational overhead.

* S3 Glacier: Secure, durable, low cost storage class for data archiving. You can reliably store any amount of data at costs that are competitive with or cheaper than on-premises solutions. Retrieval times configurable from minutes to hours. 

* S3 Glacier Deep Archive: Amazon S3’s lowest cost storage class where a retrieval time of 12 hours is acceptable. 



You are charged for S3 in the following ways: 

* Storage

* Requests

* Storage Management Pricing

* Data Transfer Pricing

* Transfer Acceleration

* Cross Region Replication Pricing


Amazon S3 Transfer Acceleration enables fast, easy, and secure transfers of files over long distances between your end users and an S3 bucket. Transfer Acceleration takes advantage of Amazon CloudFront’s globally distributed edge location. As the data arrives at an edge location, data is routed to Amazon S3 over an optimized network path.  

Main Exam Tips for S3: 
* You can use bucket policies to make entire S3 buckets public 
* You can use S3 to host static websites (such as .html). Websites that require database connections such as Wordpress, etc. cannot be hosted on S3. 
* S3 scales automatically to meet demand. Many enterprises will put static websites on S3 when they think there are going to be a large number of requests. 


## CloudFront ##  


A content delivery network [CDN] is a system of distributed servers [network] that deliver webpages and other web content to a user based on the geographic locations of the user, the origin of the webpage, and a content delivery server.


CloudFront - Key Terminology

* Edge Location - This is the location where content will be cached. This is separate to an AWS Region/AZ. 

* Origin - This is the origin of all the files that the CDN will distribute. This can be an S3 Bucket, an EC2 instance, an Elastic Load Balancer, or Route53. 

* Distribution - This is the name given to the CDN which consists of a collection of Edge Locations.


Amazon CloudFront can be used to deliver your entire website, including dynamic, static, streaming, and interactive content using a global network of edge locations. Requests for your content are automatically routed to the nearest edge location, so content is delivered with the best possible performance. 


CloudFront uses two different kinds of distributions: 

* Web Distribution - Typically for websites. 

* RTMP - Used for media streaming. 

Additional Notes 
* Edge locations are not just read-only -- you can write to them too (i.e., put an object on to them). 
* Objects are cached for the live of TTL. 
* Cached objects can be cleared, but there is a charge for that. 


## EC2 - Elastic Compute Cloud ## 


What is EC2? 

Amazon Elastic Compute Cloud [Amazon EC2] is just a virtual server [or servers] in the cloud. 


Amazon EC2 reduces the time required to obtain and boot new server instances to minutes, allowing you to quickly scale capacity, both up and down, as your computing requirements change.


EC2 Pricing Models


* On Demand: Allows you to pay a fixed rate by the hour [or by the second] with no commitment. 

* Reserved: Provides you with a capacity reservation, and offer a significant discount on the hourly charge for an instance. Contract Terms are 1 year or 3 year terms. 

* Spot: Enables you to bid whatever price you want for instance capacity, providing for even greater savings if your applications have flexible start and end times. 

* Dedicated Hosts: Physical EC2 server dedicated for your use. Dedicated Hosts can help you reduce costs by allowing you to use your existing server-bound software licenses. 


On Demand Pricing is useful for: 

* Users that want the low cost and flexibility of Amazon EC2 without any up-front payment or long-term commitment. 

* Applications with short-term, spiky, or unpredictable workloads that cannot be interrupted. 

* Applications being developed or tested on Amazon EC2 for the first time.


Reserved Pricing is useful for: 

* Applications with steady state or predictable usage. 

* Applications that require reserved capacity. 

* Users able to make upfront payments to reduce their total computing costs even further.


Reserved Pricing Types: 

* Standard Reserved Instances: These offer up to 75% off on demand instances. The more you pay up front and the longer the contract, the greater the discount. 

* Convertible Reserved Instances: These offer up to 54% off on demand capability to change the attributes of the RI as long as the exchange results in the creation of Reserved Instances of equal or greater value.

* Scheduled Reserved Instances: These are available to launch within the time windows you reserve. This option allows you to match your capacity reservation to a predictable recurring schedule that only requires a fraction of a day, a week, or a month. 


Spot Pricing is useful for: 

* Applications that have flexible start and end times. 

* Applications that are only feasible at very low compute prices. 

* Users with urgent computing needs for large amounts of additional capacity. 


Dedicated Hosts Pricing is useful for: 

* Useful for regulatory requirements that may not support multi-tenant virtualization.

* Great for licensing which does not support multi-tenancy or cloud deployments.

* Can be purchased on-demand [hourly].

* Can be purchased as a Reservation for up to 70% off on the on-demand price. 


## Amazon EBS ## 


What is EBS? 


Amazon EBS allows you to create storage volumes and attach them to Amazon EC2 instances. Once attached, you can create a file system on top of these volumes, run a database, or use them in any other way you would use a block device. Amazon EBS volumes are placed in a specific AZ, where they are automatically replicated to protect you from the failure of a single component. 


Types of EBS: 

* SSD

    * General Purpose SSD (GP2) - balances price and performance for a wide variety of workloads. 

    * Provisioned IOPS SSD (IO1) - Highest-performance SSD volume for mission-critical low-latency or high-throughput workloads. 

* Magnetic

    * Throughput Optimized HDD (ST1) - Low cost HDD volume designed for frequently accessed, throughput-intensive workloads.

    * Cold HDD (SC1) - Lowest cost HDD volume designed for less frequently accessed workloads [File Servers].

    * Magnetic - Previous Generation. 

Notes: 
* EC2 is a compute-based service - is not serverless, it's a server 
* Use private key to connect to EC2 
* Security groups are virtual firewalls in the cloud. You need to open ports to use them. Popular ports are SSH [22], HTTP [80], HTTPS [443], RDP [3389]. 
* Always design for failure. Have one EC2 instance in each availability zone. 

## IAM Roles ## 
Roles are much more secure than using access key id's and secret access keys, and are easier to manage. 

You can apply roles to EC2 instances at any time. When done, the change takes place immediately. 

Roles are universal [do not need to specify what region they apply to]. 

## Elastic Load Balancers ##  

Load balancing: the process of distributing a set of tasks over a set of resources, with the aim of making their overall processing more efficient. 

In AWS EC2, there are three different types of load balancers to choose from: 
* Application Load Balancer 
    * For when a flexible feature set is needed for web applications with HTTP/HTTPS traffic 
    * Operates at the request level 
    * Provide advanced routing and visibility features targeted at application architectures, including microservices and containers 
* Network Load Balancer 
    * For when the application needs the following: 
        * ultra-high performance 
        * TLS offloading at scale 
        * centralized certificate deployment 
        * support for UDP 
        * static IP addresses 
    * Operates at the connection level 
    * Capable of handling millions of requests per second securely while maintaining low latency 
* Classic Load Balancer 
    * For when an existing application is running in the EC2-Classic network 
    * Previous Generation

## Databases ## 
Relational databases: tables [composed of columns and rows]

Relational databases on AWS - RDS 
* Microsoft SQL Server 
* Oracle 
* MySQL 
* PostgreSQL 
* Amazon Aurora 
* MariaDB 

RDS has two key features: 
* Multi-AZ [Multiple Availability Zones]: For disaster recovery 
* Read Replicas: for performance 

Non-Relational Databases: collections [equivalent to tables] composed of documents [equivalent to rows], with each document containing key-value pairs [equivalent to fields] 
* Columns in table can vary 
* This will not affect other rows in the database 

Amazon's non-relational database: DynamoDB 

Data Warehousing
* Used for business intelligence 
* Tools like: 
    * Cognos 
    * Jaspersoft 
    * SQL Server Reporting Services 
    * Oracle Hyperion 
    * SAP Netweaver 
* Used to pull in very large and complex data sets 
* Usually used by management to do queries on data [such as current performance vs targets, etc] 
* Data warehousing databases use a different type of architecture from both a database perspective and infrastructure layer perspective 
* Amazon's data warehouse solution: Redshift 

ElastiCache 
* Web service that makes it easier to deploy, operate, and scale in-memory cache in the cloud 
* Service improves the performance of web applications by allowing one to retrieve information from fast, managed, in-memory caches, instead of relying entirely on slower disk-based caches 
* Supports two open-source in-memory caching engines: 
    * Memcached 
    * Redis 
* Helps take huge load off production databases for commonly queried items [especially when number of such queries scales very rapidly] 

## Route 53 ## 
Amazon's DNS Service 

Is global, similar to IAM and S3 

Can use it to direct traffic all around the world and to register domain names 

## Elastic Beanstalk ## 
Quickly deploy and manage applications in the AWS cloud without worrying about the infrastructure that runs those applications. 

Simply upload your application, and EBS automatically handles the details of capacity provisioning, load balancing, scaling, and application health monitoring. 

## CloudFormation ## 
AWS CloudFormation is a service that helps model and set up AWS resources so that less time can be spent managing said resources, and more time on the applications in AWS. 

Create a template that describes all the AWS resources needed [such as EC2 instances, RDS DB instances, etc.] and CloudFormation takes care of configuring the resources for you. 

Do not need to individually create and configure AWS resources and figure out what's dependent on what; CloudFormation handles all of that. 

Elastic Beanstalk and CloudFormation are both free resources, but the resources that they provision, such as EC2 instances, are not free. 

Elastic Beanstalk is limited in what it can provision and is not programmable; CloudFormation can provision almost any AWS Service and is completely programmable. 

## Architecting For The Cloud - Best Practices ## 
This section based on AWS white paper - read it! 

Traditional Computing vs Cloud Computing 
* IT assets as provisioned resources 
* Global, available, and scalable capacity 
* Higher level managed services 
* Built-in security 
* Architecting for cost 
* Operations on AWS 

Diving into each one: 
* Scalability 
    * Scale up 
    * Scale out 
        * Stateless applications (like lambdas) 
        * Distribute load to multiple nodes 
        * Stateless components 
        * Stateful components 
        * Implement session affinity 
        * Distributed processing 
        * Implement distributed processing 
* Disposable Resources Instead of Fixed Servers 
    * Instantiating compute resources 
        * Bootstrapping 
        * Golden images 
        * Containers 
        * Hybrid 
    * Infrastructure as code 
        * CloudFormation 
* Automation 
    * Serverless management and deployment 
    * Infrastructure management and deployment 
        * AWS Elastic Beanstalk 
        * EC2 auto recovery 
        * AWS Systems Manager 
        * Autoscaling 
    * Alarms and events 
        * CloudWatch alarms 
        * CloudWatch events 
        * Lambda scheduled events 
        * AWS WAF security automations  
* Loose Coupling 
    * Well defined interfaces 
        * Amazon API Gateway 
    * Service discovery 
        * Implement service discovery 
    * Asynchronous integration 
    * Distributed systems best practices 
        * Graceful failure in practice 
* Services Not Servers 
    * Managed services 
    * Serverless architectures 

* Databases 
    * Relational databases [Aurora] 
        * Scalability 
        * High availability - multi-az 
        * Anti-patterns - no need for joins or complex transactions; use no-sql 
    * Non-Relational databases [DynamoDB] 
        * Scalability 
        * High availability - multi-az 
        * Anti-patterns - requires joins or complex transactions, use relational databases. If you have large binary files [audio/video/image], consider storing them in Amazon S3 
    * Data Warehouse [Redshift] 
        * Scalability 
        * High availability - multi-az 
        * Anti-patterns - not meant for on line transaction processing [OLTP] 
    * Search 
        * Scalability 
        * High availability 
    * Graph Databases [Neptune]
        * Scalability 
        * High availability 
* Managing Increased Volumes of Data 
    * Data lake approach 
* Removing Single Points of Failure 
    * Introducing redundancy 
    * Detect failure 
    * Durable data storage 
    * Automated multi-data center resilience 
    * Fault isolation & traditional horizontal scaling 
    * Sharding 
* Optimize for Cost 
    * Right sizing 
    * Elasticity 
    * Take advantage of the variety of purchasing options 
        * Reserved capacity 
        * Spot instances 
* Caching 
    * Application caching 
    * Edge caching 
* Security 
    * Use AWS features for defense in depth 
    * Share security responsibility with AWS 
    * Reduce privileged access 
    * Security as code 
    * Real-time auditing 

## Global AWS Services ## 
Global services: 
* IAM 
* Route53 
* CloudFront 
* SNS 
* SES 

Some services give global views but are regional [such as S3] 

## AWS Services Deployed On Premise ## 
AWS services that can be used on-prem: 
* Snowball [data disk to load on-prem data to send back to AWS to upload to S3]
* Snowball Edge [Snowball + a CPU]
* Storage Gateway [Snowball but stays on-prem - way to cache on-prem files] 
* CodeDeploy [deploy application code to EC2 + on-prem] 
* Opsworks [similar to EBS] 
* IoT Greengrass [connects IoT devices to the cloud] 

## CloudWatch 101 ## 
Amazon CloudWatch is a monitoring service to monitor AWS resources in addition to applications running on AWS 

Things CloudWatch can monitor: 
* Compute 
    * EC2 instances 
    * Autoscaling groups 
    * Elastic load balancers 
    * Route53 health checks 
* Storage & Content Delivery 
    * EBS volumes 
    * Storage gateways 
    * CloudFront 
* Host-Level Metrics 
    * CPU 
    * Network 
    * Disk 
    * Status check 
By default, CloudWatch with EC2 will monitor events every five minutes, but that can be lowered to a minute by toggling on detailed monitoring 

Can create CloudWatch alarms which trigger further notifications 

## AWS Systems Manager ## 
AWS Systems Manager allows you to manage your EC2 instances at scale 

Can be inside AWS and on-prem 

Integrates with CloudWatch to give you a dashboard of your entire estate. 