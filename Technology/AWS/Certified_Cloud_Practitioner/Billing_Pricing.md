# AWS Billing & Pricing # 

## Billing & Pricing 101 ## 

Capex vs Opex 
* Capex stands for _Capital Expenditure_ which is where you pay upfront. 
    * Fixed, sunk cost 
* Opex stands for _Operational Expenditure_ which is where you pay for what you use. 

Five basic pricing policies: 
* Pay as you go 
* Pay less when you reserve 
* Pay even less per unit by using more 
* Pay less as AWS grows 
* Custom pricing 

Important to note that even though pricing models may vary across services, it is worthwhile to keep several key principles and best practices in mind. They are: 
* Understand the fundamentals of pricing 
    * Compute 
    * Storage 
    * Data outbound 
* Start early with cost optimization 
    * AWS mantra: _"Adopting cloud services is not just a technical evolution. It also requires changes to how organizations operate. As you move from IT being treated as a capital investmnet that happens periodically to a world where pricing is closely tied to efficient use of resources, it pays to understand what drives cloud pricing so you can build a strategy for optimizing it._ 
    * When it comes to understanding pricing and cost optimization, it is never too early to start. 
    * It is easier to put cost visibility and control mechanisms in place earlier, before the environment becomes large and complex. 
    * Managing cost effectively from the start ensures that managing cloud investments doesn't become and obstruction as one grows and scales. 
* Maximize the power of flexibility 
    * AWS services are priced independently and transperantly 
    * Choose and pay for what is needed 
    * No minimum commitments or long-term contracts required unless opting to save money through the reservation model 
    * Pay-as-you-go model ensures focus can be kept on innovation and invention, reducing procurement complexity, and enabling elasticity in business 
    * One of the key advantages of cloud-based resources is not having to pay for them when they are not running 
    * Turning off instances when not in use can reduce costs by 70% [or more] 
    * Enables cost-effectiveness as well as having the required horsepower as and when needed 
* Use the right pricing model for the job 
    * Several pricing models depending on product 
        * on-demand 
        * dedicated instances 
        * spot instances 
        * reservation 

AWS offers a free tier to help new AWS customers get started in the cloud 

Free AWS Services: 
* Amazon VPC 
* Elastic Beanstalk 
* CloudFormation 
* IAM 
* Autoscaling 
* Opsworks 
* Consolidated Billing 

EC2 Pricing 

Price determined by: 
* Clock hours of server time 
* Instance type 
* Pricing model 
* Number of instances 
* Load balancing 
* Detailed monitoring 
* Autoscaling 
* Elastic IP addresses 
* OS and software packages 

EC2 pricing models: 
* on-demand 
* reserved 
* spot 
* dedicated hosts 

Lambda Pricing 
Price determined by: 
* Request pricing 
    * Free tier: 1million requests per month 
    * $0.20 per 1 million requests thereafter 
* Duration pricing 
    * 400,000 GB-seconds per month free, up to 3.2 million seconds of compute time 
    * 0.00001667 for every GB-second used thereafter 
* Additional charges 
    * May incur additional charges if lambda function uses other AWS services or transfers data 

EBS Pricing 
Price determined by: 
* Volume [per GB] 
* Snapshots [per GB] 
* Data transfer 

S3 Pricing 
Price determined by: 
* Storage class [standard/IA/1AZIA/etc] 
* Storage [get/put/copy] 
* Data transfer 

Glacier Pricing 
Price determined by: 
* Storage 
* Data retrieval times 

Snowball Pricing 

AWS Snowball is a pb-scale data transfer solution that uses secure appliances to transfer large amounts of data into and our of the AWS cloud [think of it as a gigantic disk to move data into AWS] 

Price determined by: 
* Service fee per job 
    * Snowball 50TB: $200 
    * Snowball 80TB: $250 
* Daily charge 
    * First 10 days are free, after that it's $15/day 
* Data transfer 
    * Data transfer into S3 is free; data transfer out is not

RDS Pricing 
Pricing determined by: 
* Clock hours of server time 
* Database characteristics 
* Database purchase tupe 
* Number of database instances 
* Provisioned storage 
* Additional storage 
* Requests 
* Deployment type 
* Data transfer 

DynamoDB Pricing 
Price determined by: 
* Provisioned throughput [write] 
* Provisioned throughput [read] 
* Indexed data storage 

CloudFront Pricing 
Price determined by: 
* Traffic distribution 
* Requests 
* Data transfer out 

## AWS Budgets vs AWS Cost Explorer ## 
AWS Budgets gives the ability to set custom budgets that trigger alerts when cost or usage have exceeded a set amount 

Use AWS Budgets to budget costs prior to being incurred 

AWS Cost Explorer is an interface to manage, understand, and visualize AWS costs and usage over time 

Use AWS Cost Explorer to budget costs after they have been incurred 

## AWS Support Plans ## 
### Support Plans ###
* Basic 
    * Free 
    * No tech support 
    * No TAM 
    * None can open cases 
* Developer 
    * $29/month 
    * Tech support during business hours or access via email 
    * No TAM 
    * One person can open cases / unlimited cases 
* Business 
    * $100/month 
    * 24x7 tech support via email, chat, and phone 
    * No TAM 
    * Unlimited contacts can open cases / unlimited cases 
* Enterprise 
    * $15000/month 
    * 24x7 tech support via email, chat, and phone 
    * TAM 
    * Unlimited contacts can open cases / unlimited cases 

### Case Severity Response Times ### 
* Basic 
    * None 
* Developer 
    * General guidance < 24 business hours 
    * If system impared < 12 business hours 
* Business 
    * General guidance < 24 hours 
    * If system impared < 12 hours 
    * If production system impaired < 4 hours 
    * If production system down < 1 hour 
* Enterprise 
    * General guidance < 24 hours 
    * If system impared < 12 hours 
    * If production system impaired < 4 hours 
    * If production system down < 1 hour 
    * If business-critical system down  < 15 mins 

## Resource Groups & Tagging ## 
Tags: key-value pairs attached to AWS resources 

They are metadata [data about data] 

Tags can sometimes be inherited 

Resource groups make it easy to group resources using the tags that are assigned to them 

Resources can be grouped via one or more shared tags 

Resource groups contain information such as: 
* region 
* name 
* employee ID 
* department 

Tags often contain specific information: 
* For EC2: public/private IP addresses 
* For ELB: port configs 
* For RDS: database engine info, etc 

Tag Editor is a global service that allows for the discovery of resources and to add additional tags to said resources as well 

Newer regions may take some time to be updated and to be compatible with Tag Editor 

Using Resource Groups, can apply automation to resources tagged with specific tags 

Resource Groups in combination with AWS Systems Manager allows for the control of and the ability to execute automation against entire fleets of EC2 instances, all at the push of a button 

## AWS Organizations & Consolidated Billing ## 

### AWS Organizations ### 

AWS Organizations: account management service that enables the consolidation of multiple AWS accounts into an organization that can be centrally managed 

AWS Organizations is available in the form of two _feature sets_: 
* Consolidated billing 
* All features 

Advantages of Consolidated Billing: 
* One bill per AWS account 
* Very easy to track changes and allocate costs 
* Volume pricing discount 

Linked accounts: can only have up to 20 linked accounts per org [this is a soft limit; visit AWS site for expansion form] 

AWS Organizations Best Practices: 
* Always enable MFA on root account 
* Always use a strong and complex password on root account 
* Paying account should b eused for billing purposes only; do not deploy resources into the paying account 

### CloudTrail ### 
CloudTrail vs CloudWatch: CloudWatch monitors performance, CloudTrail monitors API calls in the AWS platform 

Using CloudTrail with AWS Organizations 
CloudTrail is a per-AWS-account feature and is enabled per region, so this would have to be enabled for each account in the organization 

Once done, can consolidate logs using an S3 bucket: 
* Turn on CloudTrail in paying account 
* Create bucket policy that allows cross-account access 
* Turn on CloudTrail in the other accounts and use the bucket in the paying account 

Note: The best practice is to use a separate account for logging 

## AWS QuickStart & Landing Zone ## 
AWS QuickStart is a way of deploying environments quickly, using CloudFormation templates built by AWS Solutions Architects who are experts in the particular technology 

AWS Landing Zone is a solution that helps customers quickly set up a secure, multi-account AWS environment based on AWS best practices 

## AWS Calculators ## 

AWS helps compute costs through the use of different calculators 

Available in two feature sets: 
* AWS Simple Monthly Calculator 
    * used to calculate running costs on AWS on a per-month basis 
    * not a comparison tool 
* AWS Total Cost of Ownership Calculator 
    * used to compare costs of running infrastructure on premise versus in the AWS Cloud 
    * generates reports to present to C-level execs to make a business case to move to the cloud 

Note: Go through calculators significantly, they are heavily asked in the exam 