# Identity & Access Management # 

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