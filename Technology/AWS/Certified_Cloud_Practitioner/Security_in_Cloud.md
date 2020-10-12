# Security in the Cloud # 

## Compliance on AWS Artifact ## 

AWS Artifact is a repository of many compliance licenses [HIPAA, ISO, etc.] that an application may require 

## AWS Shared Responsibility Model ## 
While AWS manages security of the cloud, _security in th cloud is the responsibility of the customer_ 

Customers retain control of what security they choose to implement to protect their own content, platform, applications, systems, and networks; no different than they would in an on-site datacenter 

Note: Read the Shared Responsibility Model webpage!!!! 

## AWS WAF and AWS Shield ## 
AWS WAF is a web application firewall that helps protect web applications from common web exploits that could affect application availability, compromise security, or consume excessive resources 

AWS Shield is managed distributed denial protection service that safeguards web applications running on AWS 

AWS Shield provides always-on detection and automatic in-line mitigations that minimize application downtime and latency, so there is no need to engage AWS Support to benefit from DDoS protection 

Two AWS Shield tiers: 
* standard 
* advanced 

AWS WAF is designed to stop hackers, AWS Shield is a DDoS mitigation service designed to stop DDoS attacks 

## AWS Inspector vs AWS Trusted Advisor vs CloudTrail ## 
AWS Inspector is an automated security assessment service that helps improve the security and compliance of applications deployed on AWS 
* Amazon Inspector automatically assesses applications for vulnerabilities and/or deviations from best practices 
* After performing an assessment, AWS Inspector produces a detailed list of security findings prioritized by level of security 
* These findings can then be reviewed directly, or as part of detailed assessment reports which are available via the AWS Inspector console or API 

AWS Trusted Advisor is an online resource to help reduce costs, increase performance, and improve security by optimizing one's AWS environment 
* Trusted Advisor provides real-time guidance to help provision resources following AWS best practices 
* Advisor will advise on cost optimization, performance, security, fault tolerance 
* Two types: 
    * core checks & recommendations 
    * full trusted advisor - business & enterprise companies only 

AWS CloudTrail increases visibility into user and resource activity by recording AWS Management Console actions and API calls 
* Can identify which users and accounts were called AWS, the source IP address from which the calls were made, and when the calls occurred 

## CloudWatch vs AWS Config ## 
CloudWatch used to monitor performance 

Host-level metrics consist of: 
* CPU 
* Network 
* Disk 
* Status Check 

AWS Config provides a detailed view of the configuration of AWS resources in one's AWS account 

Includes how the resources are related to one another and how they were configured in the past so one can see how the configurations and relationships change over time 

## Athena vs Macie ## 
Athena is an interactive query service which enables you to analyze and query data located in S3 using standard SQL 
* Serverless, nothing to provision, pay per query/per TB scanned 
* No need to set up complex Extract/Transform/Load [ETL] processes 
* Works directly with data stored in S3 

Athena can be used for: 
* Query log files stored in S3, e.g., ELB logs, S3 access logs, etc 
* Generate business reports on data stored in S3 
* Analyze AWS cost and usage reports 
* Run queries on clickstream data 

PII - Personally Identifiable Information 
* Personal data used to establish an individual's identity 
* This data can be exploited by criminals; used in identity theft or fraud 
* Includes: 
    * Home address, email address, SSN 
    * Passport/driver's license number 
    * DOB, phone number, bank account number, credit card number 

Macie is a security service that uses machine learning and natural language processing [NLP] to discover, classify, and protect sensitive data stored in AWS 
* Uses AI to recognize if S3 objects contain sensitive data such as PII 
* Dasboards, reporting and alerts 
* Works directly with data stored in S3 
* Can also analyze CloudTrail logs 
* Great for PCI-DSS and preventing identity theft 

