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


