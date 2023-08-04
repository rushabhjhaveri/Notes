# Amazon S3 Security # 

## S3 CORS ## 

Cross-Origin Resource Sharing 

Origin = scheme [protocol] + host [domain] + port 

Web browser based mechanism to allow requests to other origins while visiting the main origin 

The requests won't be fulfilled unless the other origin allows for the reqeusts, using CORS headers [ex.: access-control-allow-origin] 

If a client makes a cross-region request to an S3 bucket, the correct CORS headers must be enabled 

Can allow for a specific origin or for * [all origins] 

## S3 MFA Delete ## 

MFA [Multi-Factor Authentication]: force users to generate a code on a device [usually a mobile phone or hardware] before doing important operations on S3 

MFA will be required to: 
* Permanently delete an object version 
* Suspend versioning on the bucket 

MFA won't be required to: 
* Enable versioning 
* List deleted versions 

To use MFA Delete, versioning must be enabled on the bucket 

Only the bucket owner [root account] can enable/disable MFA Delete 

## S3 Access Logs ## 

For audit purposes, may want to log all access to S3 buckets 

Any request made to S3, from any account, authorized or denied, will be logged into another S3 bucket 

That data can be analyzed using data analysis tools 

The target logging bucket must be in the same AWS region 

Do not set logging bucket to be the monitored bucket [it will create a logging loop, and the bucket will grow exponentially] 

## S3 Pre-Signed URLs ## 

Generate pre-signed URLs from the S3 Console, AWS CLI, or SDK 

URL Expiration: 
* S3 Console: 1 min up to 720 min [12 hours] 
* CLI: configure expiration with expires-in parameter in seconds; default 3600s, 604800s [168 hours] 

Users given the presigned URL inherit the permissions of the user that generated the URL for GET / PUT 

## S3 Access Points ## 

Access points simplify security management for S3 buckets 

Each Access Point has: 
* its own DNS name [internet origin or VPC origin] 
* an access point policy [similar to a bucket policy] - to manage security at scale 

### S3 Access Points - VPC Origin ### 

Can define the access point to only be accessible from within the VPC 

Must create a VPC Endpoint to access the Access Point [Gateway or Interface Endpoint] 

The VPC Endpoint Policy must allow access to the target bucket and Access Point 

## S3 Object Lambda ## 

Use AWS Lambda Functions to change the object before it is retrieved by the caller application 

Only one S3 bucket is needed, on top of which we create an S3 Access Point and an S3 Object Lambda Access Point 

Use cases: redacting PII for analytics/non-production environments; converting across data formats e.g., from XML to JSON; resizing/watermarking images on the fly 