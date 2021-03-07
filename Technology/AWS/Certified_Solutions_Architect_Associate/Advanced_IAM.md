# Advanced IAM # 
## AWS Directory Service ## 
AWS Directory Service: 
* Family of managed services 
* Connects AWS resources with on-prem AD 
* Standalone directory in the cloud 
* Uses existing corporate credentials 
* SSO to any domain-joined EC2 instance 

Active Directory: 
* On-prem directory service 
* Hierarchical database of users, groups, computers - trees and forests 
* Group policies 
* LDAP and DNS 
* Kerberos, LDAP, and NTLM authentication 
* Highly available - results in large overhead in management

AWS Managed Microsoft AD: 
* AD domain controllers [DCs] running Windows Server 
* Reachable by applications in the VPC 
* Add DCs for HA and performance 
* Exclusive access to DCs 
* Extend existing AD to on-prem using AD Trust 
* AWS manages: 
    * Multi-AZ deployment 
    * Patch, monitor, recover 
    * Instance rotation 
    * Snapshot and restore 
* Customer manages: 
    * Users, groups, GPOs 
    * Standard AD tools 
    * Scale out DCs 
    * Trusts [resource forest] 
    * Certificate authorities [LDAPS] 
    * Federation 

Simple AD: 
* Standalone managed directory 
* Basic AD features 
* Two variants: 
    * Small: <=500 users 
    * Large: <=500 users 
* Easier to manage EC2 
* Linux workloads that need LDAP 
* Does not support trusts [can't join on-prem AD] 

AD Connector: 
* Directory gateway [proxy] for on-prem AD 
* Avoid caching information in the cloud 
* Allow on-prem users to log into AWS using AD 
* Join EC2 instances to existing AD domain 
* Scale across multiple AD connectors 

Cloud Directory: 
* Directory-based store for developers 
* Multiple hierarchies with hundreds of millions of objects 
* Use cases: org charts, course catalogs, device registries 
* Fully managed service 

Amazon Cognito User Pools: 
* Managed user directory for Saas applications 
* Sign-up and sign-in for web or mobile 
* Works with social media entities 

## IAM Policies ## 
### Amazon Resource Name [ARN] ### 
ARNs all begin with: arn:partition:service:region:account_id: 
* Partition usually aws, but also can be aws-cn if working out of AWS China 
* Service: s3/ec2/rds etc. 
* Region: us-east-1, etc. 
* Account ID: 12-digit AWS account ID 

and end with: 
* resource 
* resource_type/resource 
* resource_type/resource/qualifier 
* resource_type/resource:qualifier 
* resource_type:resource 
* resource_type:resource:qualifier 

### IAM Policies ### 
JSON document that defines permissions 

Two types: 
* Identity policy 
* Resource policy 

No effect until attached 

List of statements 

Not explicitly allows == implicitly denied 

Explicit deny > everything else 

Only attached policies have effect 

AWS joins all applicable policies 

AWS-managed vs Customer-managed 

Permission boundaries: 
* Used to delegate administration to other users 
* Prevent privilege escalation or unnecessarily broad permissions 
* Control maximum permissions an IAM policy can grant 
* Use-cases: 
    * Developers creating roles for lambda functions 
    * Application owners creating roles for EC2 instances 
    * Admins creating ad-hoc users 

## AWS Resource Access Manager [RAM] ## 
Allows resource sharing between accounts 

AWS resources that can be shared via RAM: 
* App Mesh 
* Aurora 
* CodeBuild 
* EC2 
* EC2 Image Builder 
* License Manager 
* Resource Groups 
* Route 53 

## AWS Single Sign-On [SSO] ## 
Helps centrally manage access to AWS accounts and business applications 

Use existing corporate entities 

Granular account-level permissions 

AD and SAML [Security Assertion Markup Language] integration 