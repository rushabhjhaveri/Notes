# Databases on AWS # 

## Databases 101 ## 
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

RDA is NOT serverless [however, Aurora Serverless is Serverless] 

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