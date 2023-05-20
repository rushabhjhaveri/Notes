# Advanced Amazon S3 # 

## S3 Lifecycle Rules ## 

### Moving Between Storage Classes ### 

Can transition objects between storage classes 

For infrequently accessed objects, move them to Standard IA 

For archive objects that don't need fast access to, move them to Glacier or Glacier Deep Archive 

Moving objects can be automated using lifecycle rules 

### Lifecycle Rules ### 

Transition Actions: configure objects to transition to another storage class 

Expiration Actions: configure objects to expire [delete] after some time 

Rules can be created for a certain prefix 

Rules can be created for certain object Tags 

### S3 Analytics ### 

Helps decide when to transition objects to the right storage class 

Recommendations for Standard and Standard IA 

Does NOT work for One-Zone IA or Glacier 

Report is updated daily 

24-48 hours to start seeing data analysis 

## S3 Event Notifications ## 

S3 ObjectCreated, ObjectRemoved, ObjectRestore, Replication ... 

Object name filtering possible 

Use case: generate thumbnails of images uploaded to S3 

Can create as many "S3 Events" as desired 

S3 event notifications typically delivery events in seconds but can sometimes take a minute or longer 

### S3 Event Notifications with Amazon EventBridge ### 

Advanced filtering options with JSON rules [metadata, object size, name, ...] 

Multiple Destinations: Step Functions, Kinesis Streams / Firehose 

EventBridge Capabilities: Archive, Replay Events, Reliable Delivery 

## S3 Performance ## 

### S3 Baseline Performance ### 

S3 automatically scales to high request rates, latency 100-200ms 

Applications can achieve at least 3500 PUT / COPY / POST / DELETE or 5500 GET / HEAD reqeusts per second per prefix in a bucket

There are no limits to the number of prefixes in a bucket 

### S3 Performance ### 

Multipart upload: recommended for files > 100 MB, must use for files > 5 GB; can help parallelize uploads [speed up transfers] 

S3 Transfer Acceleration: increase transfer speed by transferring file to an AWS edge location which will forward the data to the S3 bucket in the target region; compatible with multipart upload 

### S3 Byte-Range Fetches ### 

Parallelize GETs by requesting specific byte-ranges 

Better resilience in case of failures 

Can be used to speed up downloads 

Can be used to retrieve only partial data [for example, the head of a file] 

## S3 Select & Glacier Select ## 

Retrieve less data using SQL by performing server-side filtering 

Can filter by rows and columns [simple SQL statements] 

Less network transfer, less CPU cost client-side 

## S3 Object Tags and Metadata ## 

S3 user-defined object metadata: 
* when uploading an object, can also assign metadata 
* name-value [key-value] pairs 
* user-defined metadata names must begin with "x-amz-meta-" 
* S3 stores user-defined metadata keys in lowercase 
* metadata can be retrieved while retrieving the object 

S3 object tags: 
* key-value pairs for objects in S3 
* useful for fine-grained permissions [only access specific objects with specific tags] 
* useful for analytics purposes [using S3 Analytics to group by tags] 

Cannot search the object metadata or object tags 

Instead, must use an external DB as a search index such as DynamoDB 