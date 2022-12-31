# AWS Fundamentals: RDS, Aurora, Elasticache # 

## Amazon RDS Overview ## 

RDS: Relational Database Service 

Managed DB service for databases using SQL as a query language 

Allows for the creation of databases in the cloud, that are managed by AWS: 
* Postgres 
* MySQL 
* MariaDB 
* Oracle 
* Microsoft SQL Server 
* Aurora [AWS proprietary database] 

Advantages of using RDS vs deploying DB on EC2: 
* RDS is a managed service 
* Automated provisioning, OS patching 
* Continuous backups and restore to specific timestamp [point in time restore] 
* Monitoring dashboards 
* Read replicas for improved read performance 
* Multi-AZ setup for disaster recovery 
* Maintenance window for upgrades 
* Scaling capability [horizontal and vertical] 
* Storage backed by EBS [gp2 or io1] 

However, cannot SSH into instances 

### RDS - Storage Autoscaling ### 

Helps increase storage on RDS DB instances dynamically 

When RDS detects that database instance is running out of storage, it scales automatically 

Helps avoid manually scaling database storage 

Have to set Maximum Storage Threshold [max limit for db storage] 

Automatically modify storage if: 
* Free storage is less than 10% of allocated storage 
* Low-storage lasts for at least five minutes 
* Six hours have passed till last modification 

Useful for applications with unpredictable workloads 

Supports all RDS database engines 

## RDS Read Replicas vs Multi-AZ ## 

### RDS Read Replicas for Read Scalability ### 

Up to five read replicas 

Within AZ, Cross-AZ, or Cross-region 

Replication is ASYNC, so reads are EVENTUALLY consistent 

Replicas can be promoted to their own DB 

Applications must update the connection string to leverage read replicas 

### RDS Read Replicas - Network Cost ### 

In AWS, there's a network cost when data moves from one AZ to another 

For RDS read replicas within the same region, that fee does not have to be paid 

For cross-region read replicas, a replication fee will be incurred 

### RDS Multi-AZ [Disaster Recovery] ### 

SYNC replication 

One DNS name - automatic app failover to standby 

Increased availability 

Failover in case loss of AZ, loss of network, instance or storage failure 

No manual intervention in apps 

Not used for scaling 

Read replicas can be setup as multi-AZ for DR 

### RDS: From Single-AZ to Multi-AZ ### 

Zero downtime operation [no need to stop the DB] 

Just click on "modify" for the database 

The following happens internally: 
* A snapshot is taken 
* A new DB is restored from the snapshot in a new AZ 
* Synchronization is established between the two databases 

## Amazon Aurora ## 

Aurora is a proprietary technology from AWS [not open-sourced] 

Postgres and MySQL are both supported as Aurora DB [drivers will work as if Aurora was a Postgres or MySQL database] 

Aurora is "AWS cloud optimized" and claims 5x performance improvement over MySQL on RDS, over 3x the performance of Postgres on RDS 

Aurora storage automatically grows in increments of 10GB up to 128 TB 

Aurora can have 15 replicas while MySQL has 5, and the replication process is faster [sub-10ms replica lag] 

Failover in Aurora is instantaneous; is HA-native 

Aurora costs more than RDS [~20% more] but is more efficient 

### Aurora High Availability and Read Scaling ### 

Six copies of data are stored across three AZs 
* Four copies out of six needed for writes 
* Three copies out of six needed for reads 
* Self-healing with peer-to-peer replication 
* Storage is striped across 100s of volumes 

One Aurora instance takes writes [master] 

Automated failover for master in less than 30 seconds 

Master + up to 15 Aurora Read Replicas serve reads 

Supports cross-region replication 

## RDS & Aurora Security ## 

At-rest encryption 
* Database master & replicas encryption using AWS KMS - must be defined at launch time 
* If the master is not encrypted, the read replicas cannot be encrypted 
* To encrypt an unencrypted database, go through a DB snapshot & restore as encrypted 

In-flight encryption: TLS ready by default, use the AWS TLS root certificates client-side 

IAM authentication: IAM roles to connect to database, instead of username/password 

Security groups: Control network access to RDS/Aurora DB 

No SSH available except on RDS Custom 

Audit logs can be enabled and sent to CloudWatch Logs for longer retention 

## Elasticache Overview ## 

Elasticache is used to get managed Redis or Memcached 

Caches are in-memory databases with really high performance and low latency 

Helps reduce load off of databases for read-intensive workloads 

Helps make application stateless 

AWS takes care of OS maintenance/patching, optimizations, setup, configuration, monitoring, failure recovery, and backups 

Using Elasticache involves heavy application code changes 

## Elasticache Strategies ## 

Read more at: https://aws.amazon.com/caching/best-practices/ 

Is it safe to cache data? 
* Data may be out of date, eventually consistent 

Is caching effective for that data? 
* Pattern: data changing slowly, few keys are frequently needed 
* Anti-Patterns: data changing rapidly, all large key space frequently needed 

Is data structured well for caching? 
* example: key value caching, or caching of aggregations results 

Which caching design pattern is the most appropriate? 

### Lazy Loading / Cache-Aside / Lazy Population ### 

Pros: 
* Only requested data is cached [cache isn't filled with unused data] 
* Node failures are not fatal [just increased latency to warm the cache] 

Cons: 
* Cache miss penalty that results in three round trip calls, noticeable delay for that request 
* Stale data: data can be updated in the database and outdated in the cache 

### Write Through - Add/Update Cache When Database Is Updated ### 

Pros: 
* Data in cache is never stale, reads are quick 
* Write penalty vs Read Penalty [each write requires 2 calls] 

Cons: 
* Missing data until it is added/updated in the DB; mitigation is to implement lazy loading strategy as well 

### Cache Evictions and Time-To-Live [TTL] ### 

Cache eviction can occur in three ways: 
* delete the item explicitly in the cache 
* item is evicted because memory is full and it's not recently used [LRU] 
* set an item's TTL 

TTL are helpful for any kind of data: 
* leaderboards 
* comments 
* activity streams 

TTL can range from a few seconds to hours or days 

If too many evictions happen due to memory, should scale up or out 

## Elasticache Redis Cluster Modes ## 

### Elasticache Replication: Cluster Mode Disabled ### 

One primary node, up to five replicas 

Asynchronous replication 

Primary node is used for read/write 

The other nodes are read-only 

One shard, all nodes have all the data 

Guard against data loss if node failure 

Multi-AZ enabled by default for failover 

Helpful to scale read performance 

### Elasticache Replication: Cluster Mode Enabled ### 

Data is partitioned across shards [helpful to scale writes] 

Each shard has a primary and up to five replica nodes [same concept as above] 

Multi-AZ capability 

Up to 500 nodes per cluster - 500 shared/single master, 250 shards with one master and one replica, and so on 