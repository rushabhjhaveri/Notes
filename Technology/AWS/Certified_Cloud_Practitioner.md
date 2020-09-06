# AWS Certified Cloud Partitioner # 

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
* YOu can use bucket policies to make entire S3 buckets public 
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
