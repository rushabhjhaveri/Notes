# Getting Started With AWS # 

## AWS Cloud Overview - Regions & AZ ## 

AWS has regions around the world 

A region is a cluster of data centers 

Most AWS services are region-scoped 

Factors affecting choice of AWS region(s): 
* Compliance with data governance and legal requirements: data never leaves a region without explicit permission 
* Proximity to customers: reduced latency 
* Available services within a region: new services and features aren't always available in every region at the same time 
* Pricing: pricing varies by region and is transperantly outlined on the service pricing page 

Each region as multiple availability zones [usually 3, min 2, max 6] 

Each AZ is one or more discrete data centers with redundant power, networking, and connectivity 

AZs are separate from each other so that they can be isolated from disasters 

AZs are connected with high-bandwidth, ultra-low latency networking 

Amazon has 216 Points of Presence [POPs] in the form of 205 Edge Locations and 11 Regional Caches in 84 cities across 42 countries 

POPs enable the delivery of content to end-users with lower latency 