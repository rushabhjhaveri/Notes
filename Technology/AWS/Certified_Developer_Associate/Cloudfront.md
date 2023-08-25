# CloudFront # 

## AWS CloudFront ## 

Content Delivery Network [CDN] 

Improves read performance; content is cached at the edge 

Improves user experience 

216 Points of Presence [PoPs] globally [edge locations] 

DDoS protection [because worldwide]; integration with Shield & AWS Web Application Firewall 

### CloudFront - Origins ### 

S3 Bucket 
* For distributing files and caching them on the edge 
* Enhanced security with CloudFront Origin Access Control [OAC] 
* OAC is replacing Origin Access Identity [OAI] 
* CloudFront can be used as an ingress [to upload files to S3] 

Custom Origin [HTTP] 
* ALB 
* EC2 
* S3 website [must first enable the bucket to be a static site] 
* Any desired HTTP backend 

### CloudFront vs. S3 Cross-Region Replication ### 

CloudFront: 
* Global edge network 
* Files are cached for a TTL [usually a day] 
* Great for static content that must be available everywhere 

S3 Cross-Region Replication: 
* Must be set up for each region where replication is desired 
* Files are updated in near real-time 
* Read-only 
* Great for dynamic content that needs to be available at low-latency in few regions 

## CloudFront - Caching & Caching Policies ## 

### CloudFront Caching ### 

The cache lives at each CloudFront Edge Location 

CloudFront identifies each object in the cache using a Cache Key 

Want to maximize cache hit ratio to minimize requests to origin 

Can invalidate part of the cache using the CreateInvalidation API 

### CloudFront Cache Key ### 

A unique identifier for every object in the cache 

By default, consists of hostname + resource portion of the URL 

If an application serves up content that varies based on user/device/language/location, can add other elements like HTTP headers, cookies, query strings to the Cache Key using CloudFront Cache Policies 

### Cache Policy ### 

Cache based on: 
* HTTP headers: None - Whitelist 
* Cookies: None - Whitelist - Include All-Except - All 
* Query Strings: None - Whitelist - Include All-Except - All 

Control the TTL [0s to 1 year]: can be set by the origin using the Cache-Control header, the Expires header 

Create one's own policy or use predefined managed policies 

All HTTP headers, cookies, query strings included in the Cache Key are automatically included in origin requests 

### Origin Request Policy ### 

Specify values that are desired to be included in origin requests without including them in the Cache Key [no duplicated cache content] 

Can include: 
* HTTP header: None - Whitelist - All view headers options 
* Cookies: None - Whitelist - All 
* Query Strings: None - Whitelist - All 

Ability to add HTTP headers and custom headers to an origin request that were not included in the viewer request 

Create one's own policy or use predefined managed policies 

## CloudFront - Cache Invalidations ## 

In case the backend origin is updated, CloudFront does not know about it and will only get the refreshed content once the TTL has expired 

However, can force an entire or partial cache refresh [thus bypassing the TTL] by performing CloudFront Invalidation 

Can invalidate all files [*] or a specific path 

## CloudFront - Cache Behaviors ## 

Can configure different settings for a given URL path pattern 

Route to different kinds of origin / origin groups based on content type or the path pattern 

When adding additional Cache Behaviors, the Default Cache Behavior is always processed last and is always /* 

## CloudFront Geo Restriction ## 

Can restrict who can access one's distribution 

Allowlist: Allow users to only access content if they're on an allowed list of countries 

Denylist: Disallow users to access content if they're on a list of denied countries 

The user's country is determined using a third-party Geo IP database 

### CloudFront Signed URL / Cookies ### 

Use case: want to distribute paid shared content to premium users all over the world 

Can use CloudFront Signed URLs / Cookies 

Attach a policy with includes URL expiration, IP ranges to access the data from, and trusted signers [which AWS accounts can created signed URLs] 

Signed URLs: access to individual files 

Signed Cookies: access to multiple files 

### CloudFront Signed URL vs S3 Presigned URL ### 

CloudFront: 
* Allows access to a path, no matter the origin 
* Account-wide key pair; only the root can manage it 
* Can filter by IP, path, date, expiration 
* Can leverage caching features 

S3: 
* Issue a request as the person who presigned the URL 
* Uses the IAM Key of the signing IAM Principal 
* Limited lifetime 

## CloudFront - Advanced Concepts ## 

### CloudFront - Pricing ### 

CloudFront edge locations are all around the world 

Cost of data out varies per edge location 

Can reduce the number of edge locations for cost reduction 

Three price classes: 
* Price Class All: all regions, best performance 
* Price Class 200: most regions, but excludes the most expensive ones 
* Price Class 100: includes only the lowest-cost regions 

### CloudFront - Multiple Origin ### 

To route to differnt kinds of origin based on the content type 

Based on path pattern 

### CloudFront - Origin Groups ### 

To increase high availability and do failovers 

Origin Group: one primary and one secondary origin 

If primary origin fails, the secondary one is used 

### CloudFront - Field Level Encryption ### 

Protect user-sensitive information through application stack 

Adds an additional layer of security in addition to HTTPS 

Sensitive information encrypted at the edge closer to user 

Uses asymmetric encryption 

## CloudFront - Real Time Logs ## 

Get real-tine requests received by CloudFront sent to Kinesis Data Streams 

Monitor, analyze, and take action based on content delivery performance 