# Security # 

## Reducing Security Threats ## 
Bad actors: 
* Typically automated processes 
* Content scrapers 
* Bad bots 
* Fake user agent 
* Denial of Service [DOS] 

Benefits of preventing bad actors: 
* Reduce security threats 
* Lower overall costs 

Can use NACLs, WAFs to block/reduce malicious actors 

## Key Management Service [KMS] ## 
KMS is a regional secure key management, and encryption and decryption, service 

Manages customer master keys [CMKs] 

KMS is ideal for S3 objects, database passwords, and API keys stored in Systems Manager Parameter Store 

Can encrypt and decrypt data up to 4KB in size 

Integrated with most AWS services 

Pay per API call 

Audit capability using CloudTrail - logs delivered to S3 

FIPS140-2 Level2 service 

Level 3 is CloudHSM 

Types of CMKs: 
* AWS-Managed CMK 
    * Free 
    * Used by default in most AWS services if encryption is picked 
    * Only that service can use them directly 
* Customer-Managed CMK 
    * Allows key rotation 
    * Controlled via key policies and can be enabled/disabled 
* AWS-Owned CMK 
    * Used by AWS on a shared basis across many accounts 
    * Will not typically see these 

Types of CMK Encryption: 
* Symmetric 
    * Same key used for encryption and decryption 
    * AES-256 
    * Key never leaves AWS unencrypted 
    * Must call the KMS APIs to use 
    * AWS services integrated with KMS use symmetric CMKs 
    * Encrypt, decrypt, and re-encrypt data 
    * Generate data keys, data key pairs, and random byte strings 
    * Import own key material 
* Asymmetric 
    * Mathematically related public/private key pair 
    * RSA and elliptic-curve cryptography [ECC] 
    * Private key never leaves AWS unencrypted 
    * Must call the KMS APIs to use private key 
    * Download the public key and use outside AWS 
    * Used outside AWS by users who can't call KMS APIs 
    * AWS services integrated with KMS do not support asymmetric CMKs 
    * Sign messages and verify signatures 

Key Policies: 
* Default key policy: grant AWS account [root user] full access to the CMK 

## CloudHSM ## 

Dedicated hardware security module [HSM] 

FIPS140-2 Level 3 

Level 2 is KMS 

Manage own keys with CloudHSM 

No-access to the AWS-managed component 

Runs within a VPC in account 

Single-tenant, dedicated hardware, multi-AZ cluster 

Industry-standard APIs - no AWS APIs 

Compliant with PKCS#11, Java Cryptography Extensions [JCEs], Microsoft CryptoNG [CNG] 

Must keep keys safe - irretrievable if lost 

## Systems Manager Parameter Store ## 

Component of AWS Systems Manager [SSM] 

Secure, serverless storage for configuration and secrets: 
* Passwords 
* Database connection strings 
* License codes 
* API keys  

Values can be stored encrypted [KMS] or in plaintext 

Separate data from source control 

Store parameters in hierarchies 

Track version 

Set TTL to expire values such as passwords 

## Secrets Manager ##

Similar to Systems Manager Parameter Store 

Charge per secret stored and per 10,000 API calls 

Automatically rotate secrets 

Apply the new key/password in RDS for you 

Generate random secrets 

## AWS Shield ## 

Protects agains DDoS attacks 

AWS Shield Standard: 
* Automatically enabled for all customers at no cost 
* Protects against common layer 3, 4 attacks 
    * SYN/UDP floods 
    * Reflection attacks 
* Stopped a 2.3Tbps DDoS attack for three days in February 2020 

AWS Shield Advanced: 
* $3,000 per month per org 
* Enhanced protection for EC2, ELB, CloudFront, Global Accelerator, Route 53 
* Business and Enterprise support customers get 24x7 access to the DDoS Response Team [DRT] 
* DDoS cost protection 

## Web Application Firewall [WAF] ## 
A WAF lets one monitor HTTP[S] requests to CloudFront, ALB, or API Gateway 

Control access to content 

Configure filtering rules to allow/deny traffic 
* IP addresses 
* Query string parameters 
* SQL query injection 
* Blocked traffic returns HTTP 403 Forbidden 

WAF allows three different behaviors: 
* Allow all requests, except the ones specified 
* Block all requests, except the ones specified 
* Count the requests that match the properties specified 
* Request properties: 
    * Originating IP address 
    * Originating country 
    * Request size 
    * Values in request headers 
    * Strings in request matching regex patterns 
    * SQL code [injection] 
    * Cross-site scripting [XSS] 

AWS Firewall Manager: 
* Centrally configure and manage firewall rules across an AWS Organization 
* WAF rules: 
    * ALB 
    * API Gateway 
    * CloudFront distributions 
* AWS Shield Advanced protections: 
    * ALB 
    * ELB Classic 
    * EIP 
    * CloudFront distributions 
* ENable security groups for EC2 and ENIs 
