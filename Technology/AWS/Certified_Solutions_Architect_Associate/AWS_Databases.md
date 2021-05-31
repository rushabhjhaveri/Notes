# Databases on AWS # 

## Databases 101 ## 

### RDS ### 
Relational databases - the most common type of database 

Think of a relational database to be like a spreadsheet: a table composed of rows and columns [fields] 

Relational databases on AWS: 
* SQL Server 
* Oracle 
* MySQL Server 
* PostgreSQL 
* Aurora 
* MariaDB 

RDS has two key features: 
* Multi-AZ: for disaster recovery 
* Read Replicas: for performance 

Non-relational Databases are the second type of database; they are structured as a collection [table] of documents [row] containing key-value pairs [fields] 

Amazon's NoSQL solution: DynamoDB 

Data Warehousing: used for business intelligence; used to pull in very large and complex data sets, and are usually used by management to perform queries on data [such as current performance vs targets, etc.] 

Data warehousing tools: Cognos, Jaspersoft, SQL Server Reporting Services, Oracle Hyperion, SAP Business Warehouse 

Data warehousing databases use different type of architecture both from a database perspective and infrastructure layer 

Amazon's Data Warehouse Solution is called Redshift 

ElastiCache: a web service that makes it easy to deploy, operate, and scale an in-memory cache in the cloud. The service improves the performance of web applications by allowing for the retrieval of information from fast, managed, in-memory caches, instead of relying entirely on slow disk-based databases 

ElastiCache supports two open-source in-memory caching engines: 
* Memcached 
* Redis 

RDS runs on virtual machines, however, cannot log into these operating systems 

Patching of the RDS OS and DB is Amazon's responsibility 

RDS is NOT serverless [however, Aurora Serverless is Serverless] 

## RDS - Backups, Multi-AZ, & Read Replicas ## 
There are two different types of backups for RDS: 
* Automated backups 
    * Allow for the recovery of databases to any point in time within a "retention period" 
    * Retention period can be between one and 35 days 
    * Will take a full daily snapshot and will also store transaction logs throughout the day 
    * When performing a recovery, AWS will first choose the most recent daily backup, and then apply transaction logs relevant to that day 
    * This allows for doing a point-in-time recovery down to the second, within the retention period 
    * Enabled by default 
    * Backup data is stored in S3 and get free storage space equal to the size of the database [aka if RDS instance is of 10GB, will get 10GB worth of storage] 
    * Backups are taken within a defined window 
    * During the backup window, storage I/O may be suspended while data is being backed up and may experience elevated latency 
* Database snapshots 
    * Done manually [i.e., user-initiated] 
    * Are stored even after deleting the original RDS instance, unlike automated backups 

Whenever restoring either an automated backup or a manual snapshot, the restored version of the database will be a new RDS instance with a new DNS endpoint 

Encryption at rest 
* Supported for MySQL, Oracle, SQL Server, PostgreSQL, MariaDB, & Aurora 
* Encryption is done using the AWS Key Management Service [KMS] 
* Once RDS instance is encrypted, the data stored at rest in the underlying storage is encrypted, as are its automated backups, read replicas, and snapshots 

Multi-AZ: allows to have an exact copy of production database in another AZ 
* AWS handles the replication, so whenever the production database is written to, the write will be automatically synchronized to the standby database 
* In the event of planned database maintenance, DB Instance failure, or an AZ failure, RDS will automatically failover to the standby so that database operations can resume quickly without administrative intervention 
* For disaster recovery only - not primarily used for improving performance; for performance improvement, need read replicas 
* Available for the following databases: SQL Server, Oracle, MySQL Server, PostgreSQL, MariaDB 

Read Replica: allow to have a read-only copy of production database - achieved by using asynchronous replication from the primary RDS instance to the read replica; can use read replicas for very read-heavy database workloads 
* Available for the follwing databases: MSSQL, MySQL Server, PostgreSQL, MariaDB, Oracle, Aurora 
* Used for scaling, not disaster recovery 
* Must have automatic backups turned on in order to deploy a read replica 
* Can have up to five read replica copies of any database 
* Can have read replicas of read replicas [watch out for latency] 
* Each read replica will have its own DNS endpoint 
* Can have read replicas that have multi-AZ 
* Can create read replicas of multi-AZ source databases 
* Read replicas can be promoted to be their own databases - this breaks the replication 
* Can have a read replica in a second region 

## DynamoDB ## 
Amazon DynamoDB is a fast and flexible NoSQL database service for all applications that need consistent, single-digit millisecond latency at any scale 

It is a fully-managed database and supports both document and key-value data models 

Its flexible data model and reliable performance make it a great fit for mobile, web, gaming, ad-tech, IoT, and many other applications 

The basics of DynamoDB are as follows: 
* Stored on SSD storage 
* Spread across three geographically distinct data centers 
* Eventual consistent reads [default] 
* Strongly consistent reads 

Eventual consistent reads: 
* Consistency across all copies of data is usually reached within a second 
* Repeating a read after a short time should return the updated data [best read performance] 

Strongly consistent reads: 
* Returns a result that reflects all writes that received a successful response prior to the read 

## Advanced DynamoDB ## 
DynamoDB Accelerator [DAX]: 
* Fully-managed, highly available, in-memory cache 
* 10x performance imporovement 
* Reduces request time from milliseconds to microseconds - even under load 
* No need for developers to maintain caching logic 
* Compatible with DynamoDB API calls 

Transactions: 
* Multiple "all-or-nothing" operations 
* Financial transactions 
* Fulfilling orders 
* Two underlying reads or writes - one to prepare, one to commit 
* Up to 25 items or 4MB of data 

On-demand capacity: 
* Pay-per-request pricing 
* Balance cost and performance 
* No minimum capacity 
* No charge for read/write - only storage and backups 
* Pay more per request than with provisioned capacity 
* Use for new product launches, when consumption demand is uncertain 

On=demand backup and restore: 
* Full backups at any time 
* Zero impact on table performance or availability 
* Consistent within seconds, and retained until deleted 
* Operates within same region as the source table 

Point-in-Time recovery [PITR]: 
* Protects against accidental writes or deletes 
* Restore to any point in the last 35 days 
* Incremental backups 
* Not enabled by default 
* Latest restorable: five minutes in the past 

Streams: time-ordered sequence of item-level changes in a table 
* Stored for 24 hours 
* Inserts, updates, and deletes 
* Combine with Lambda functions for functionality like stored procedures 

Global tables: managed multi-master, multi-region replication 
* Globally distributed applications 
* Based on DynamoDB streams 
* Multi-region redundancy for disaster recovery or high availability 
* No application rewrites 
* Replication latency under one second 

Database Migration Service [DMS]: service to migrate source databases [on-prem, etc.] to AWS managed databases in the cloud 

DynamoDB Security: 
* Encryption at rest using KMS 
* Site-to-site VPN 
* Direct Connect [DX]
* IAM policies and roles 
* Fine-grained access 
* CloudWatch and CloudTrail 
* VPC endpoints 

## Redshift ## 
Redshift is a fast and powerful, fully-managed, petabyte-scale data warehouse service in the cloud 

Customers can start small for just $0.25/hr with no committments or upfront costs, and scale to a petabyte or more for $1,000/terabyte per year - less than a tenth of most other data warehousing solutions 

Data warehousing databases use different type of architecture both from a database perspective and infrastructure layer 

Amazon's Data Warehouse Solution is called Redshift 

Redshift can be configured as follows: 
* Single node [150Gb] 
* Multi-node 
    * Leader node [manages client connections and receives queries] 
    * Compute node [store data and perform queries and computations] - up to 128 compute nodes 

Advanced compression: 
* Columnar data stores can be compressed much more than row-based data stores because similar data is stored sequentially on disk 
* Redshift employs multiple compression techniques and can often achieve significant compression relative to traditional relational data stores 
* In addition, Redshift doesn't require indexes or materialized views, and so uses less space than traditional relational database systems 
* When loading data into an empty table, Redshift automatically samples the data and selects the most appropriate compression scheme 

Massively Parallel Processing [MPP]: 
* Redshift automatically distributes data and query load across all nodes 
* Redshift makes it easy to add nodes to data warehouses and enables the maintaining of fast query performance as the data warehouse grows  

Backups: 
* Enabled by default with a one day retention period 
* Maximum retention period is 35 days 
* Redshift always attempts to maintain at least three copies of data [the original, a replica on the compute nodes, and a backup in S3] 
* Redshift can also asynchronously replicate snapshots to S3 in another region for disaster recovery 

Redshift pricing: 
* Compute node hours [total number of hours run across all compute nodes for the billing period] 
    * Are billed for one unit per node per hour 
    * So a 3-node data warehouse cluster running persistently for an entire month would incur 2160 instance hours 
    * Will not be charged for leader node hours; only compute nodes will incur charges 
* Backup 
* Data transfer [only within a VPC, not outside it] 

Security considerations: 
* Encrypted in transit using SSL 
* Encrupted at rest using AES-256 encryption 
* By default, Redshift takes care of key management 
    * Can manage own keys through HSM 
    * AWS KMS 

Redshift availability: 
* Currently only available in one AZ 
* Can restore snapshots to new AZ's in the event of an outage 

## Aurora ## 
Aurora is a MySQL and PostgreSQL-compatible relational database engine that combines the speed and availability of high-end commercial databases with the simplicity and cost-effectiveness of open-source databases 

Aurora provides up to five times better performance than MySQL and three times better than PostgreSQL databases at a much lower price point, whilst delivering similar performance and availability 

Things to know about Aurora: 
* Start with 10GB, scales in 10GB increments to 64TB [storage autoscaling] 
* Compute resources can scale up to 32vCPUs and 244GB of memory 
* Two copies of data is contained in each AZ, with a minimum of three AZs - total of six copies of data 

Scaling Aurora: 
* Aurora is designed to transperantly handle the loss of up to two copies of data without affecting database write availability and up to three copies without affecting read availability 
* Aurora storage is also self-healing; data blocks and disks are continuously scanned for errors and repaired automatically 

Three types of Aurora replicas: 
* Aurora replicas [currently 15] 
* MySQL read replicas [currently 5] 
* PostgreSQL [currently 1] 

Backups with Aurora: 
* Automated backups are always enabled on Aurora DB instances 
* Backups do not impact database performance 
* Can also take snapshots with Aurora [also does not impact performance] 
* Can share Aurora snapshots with other AWS accounts 

### Aurora Serverless ### 
Aurora Serverless is an on-demand, autoscaling configuration for the MySQL-compatible and PostgreSQL-compatible editions of Aurora 

An Aurora Serverless DB cluster automatically starts up, shuts down, and scales capacity [up or down] based on applications' needs 

Provides a relatively simple, cost-effective option for infrequent, intermittent, or unpredictable workloads 

## ElastiCache ## 
ElastiCache is a web service that makes it easy to deploy, operate, and scale an in-memory cache in the cloud 

The service improves the performance of web applications by allowing for the retrieval of information from fast, managed, in-memory caches; instead of relying entirely on slower disk-based databases 

ElastiCache supports two open-source in-memory caching engines: 
* Memcached 
* Redis [multi-AZ and supports backups and restores]

Use case: increase database and web application performance 

## Database Migration Service [DMS] ## 
DMS is a cloud service that makes it easy to migrate relational databases, data warehouses, NoSQL databases, and other types of data stores 

Can use AWS DMS to migrate data into the AWS Cloud, between on-premise instances [through an AWS Cloud setup], or between combinations of cloud and on-prem setups 

How DMS works: 
* At its most basic level, DMS is a server in the AWS Cloud that runs replication software 
* Create a source and target connection to tell DMS where to extract from and where to load to 
* Then schedule a task that runs on this server to move the data 
* DMS creates the tables and associated primary keys if they do not exist on the target 
* Can pre-create the target tables manually, or can use AWS Schema Conversion Tool [SCT] to create some or all of the target tables, indexes, views, triggers, etc. 

Types of DMS migrations: 
* Supports homogenous migrations [e.g., Oracle on-prem to Oracle on-prem] 
* Supports heterogeneous migrations [e.g., Microsoft SQL Server on-prem to Amazon Aurora in cloud] 

Sources: 
* On-prem and EC2 instances databases [Oracle, Microsoft SQL Server, MySQL, MariaDB, PostgreSQL, SAP, MongoDB, Db2] 
* Azure SQL database 
* Amazon RDS [including Aurora] 
* Amazon S3 

Targets: 
* On-prem and EC2 instances databases [Oracle, Microsoft SQL Server, MySQL, MariaDB, PostgreSQL, SAP] 
* RDS 
* Redshift 
* DynamoDB 
* S3 
* Elasticsearch service 
* Kinesis data streams 
* DocumentDB 

Do not need SCT if migrating to identical databases, but do need it for heterogeneous migrations 

## Caching Strategies on AWS ## 
The following services have caching capabilities: 
* CloudFront 
* API Gateway 
* ElastiCache - memcached and redis 
* DynamoDB Accelerator [DAX] 

Caching is a balancing act between up-to-date, accurate information, and latency 

## EMR ## 
Elastic Map Reduce [EMR] is the industry-leading cloud big data platform for processing vast amounts of data using open-source tools such as Apache Spark, Apache Hive, Apache HBase, Apache Flink, Apache Hudi, and Presto 

With EMR, can run petabyte-scale analysis at less than half the cost of traditional on-prem solutions and over three times faster than standard Apache Spark 

The central component of EMR is the cluster: 
* A cluster is a collection of EC2 instances 
* Each instance in the cluster is called a node 
* Each node has a role within the cluster, referred to as the node type 

EMR also installs different software components on each node type, giving each node a role in a distributed application like Apache Hadoop 

The node types in EMR are as follows: 
* Master node 
    * Node that manages the cluster 
    * Tracks the status of tasks and monitors the health of the cluster 
    * Every cluster has a master node 
* Core node 
    * Node with software components that runs tasks and stores data in the Hadoop Distributed File System [HDFS] on the cluster 
    * Multi-node clusters have at least one core node 
* Task node 
    * Node with software components that only runs tasks and does not store data in HDFS 
    * Task nodes are optional 

Can configure a cluster to periodically archive the log files stored on the master node to S3 
* This ensures the log files are available after the cluster terminates, whether this is through normal shutdown or due to an error 
* EMR archives the log files to S3 at five-minute intervals 
* This can only be configured when setting up the cluster / creating it for the first time 