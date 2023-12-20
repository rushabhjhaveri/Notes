# Amazon Elastic Beanstalk # 

## Elastic Beanstalk Overview ## 

### Developer Problems in AWS ### 

* Managing infrastructure 
* Deploying code 
* Configuring a myriad of components such as databases, load balancers, etc. 
* Scaling concerns 

Most web applications have the same architecture [ALB + ASG] 

All developers want is for their code to run 

Possibly, consistently across different applications and environments 

### Elastic Beanstalk Overview ### 

Elastic Beanstalk is a developer-centric view of deploying an application on AWS 

It uses commonly-used components such as EC2/ASG/ELB/RDS/etc. 

Managed service: 
* automatically handles capacity provisioning, load-balancing, scaling, application health monitoring, instance configuration, etc. 
* Just the application code is the responsibility of the developer 

Developers still retain full control over the configuration 

Beanstalk is free, but one pays for the underlying instances 

### Elastic Beanstalk Components ### 

Application: collection of Elastic Beanstalk components [environments, versions, configurations, ...] 

Application Version: iteration of application code 

Environment: 
* Collection of AWS resources running an application version [only one application version at a time] 
* Tiers: Server Environment Tier and Worker Environment Tier 
* Can create multiple environments [ dev, test, prod, ...] 

### Elastic Beanstalk - Supported Platforms ### 

Go, Java SE, Java with Tomcat, .NET Core on Linux / Windows Server, Node.js, PHP, Python, Ruby, Package Builder, Single/Multi-Container/Preconfigured Docker 

If not supported, can also write one's custom platform 

### Elastic Beanstalk Deployment Modes ### 

Single instance great for dev 

High availability with load balancer great for prod 

### Beanstalk Deployment Modes For Updates ### 

All At Once [deploy all in one go]: fastest, but instances aren't able to serve traffic for a bit [downtime] 
* Fastest deployment 
* Application has downtime 
* Great for quick iterations in development environment 
* No additional cost 

Rolling: update a few instances at a time [bucket]; move to next bucket once first is healthy 
* Application runs below capacity 
* Can set the bucket size 
* Application runs both versions simultaneously 
* No additional cost 
* Long deployment 

Rolling With Additional Batches: like rolling, but spins up new instances to move to the next batch [so that the old application is still available] 
* Application runs at capacity 
* Can set the bucket size 
* Application runs both version simultaneously 
* Small additional cost 
* Additional batch is removed at the end of the deployment 
* Longer deployment 
* Good for prod 

Immutable: spins up new instances in a new ASG, deploys version to these instances, then swaps all the instances when everything is healthy 
* Zero downtime 
* New code is deployed to new instances on a temporary ASG 
* High cost, double capacity 
* Longest deployment 
* Quick rollback in case of failure [just terminate new ASG] 
* Great for prod 

Blue-Green: create a new environment and switch over when everything is ready 
* Not a direct feature of Elastic Beanstalk 
* Zero downtime and release facility 
* Create a new "stage" environment and deploy v2 there 
* The new environment [green] can be validated independently and rolled back should any issues arise 
* Route53 can be set up using weighted policies to redirect a little bit of traffic to the stage environment 
* Using Beanstalk, "swap URLs" when done with the environment test 

Traffic-Splitting: canary testing; send a small percentage of traffic to new deployment 
* Canary testing 
* New application version is deployed to a temporary ASG with the same capacity 
* A small percentage of traffic is sent to the temporary ASG for a configurable amount of time 
* Deployment health is monitored 
* If there is a deployment failure, an automated rollback is triggered [very quick] 
* No application downtime 
* New instances are migrated from the temporary to the original ASG 
* Old application version is then terminated 

## Elastic Beanstalk CLI ## 

Additional CLI that can be installed which makes working with Beanstalk from the CLI easier 

Helpful for automated deployment pipelines 

### Elastic Beanstalk Deployment Process ### 

Describe dependencies [requirements.txt for python; package.json for nodejs] 

Package code as zip, describe dependencies 

Console: upload zip file [creates new app version], then deploy 

CLI: create new app version via CLI [uploads zip], then deploy 

Beanstalk will deploy the zip on each EC2 instance, resolve dependencies, and start the application 

### Beanstalk Lifecycle Policy ### 

Beanstalk can store at most 1000 application versions 

If old versions are not removed, won't be able to deploy anymore 

To phase out old application versions, use a lifecycle policy 
* Based on time [old versions are removed] 
* Based on space [when there are too many versions] 

Versions that are currently used won't be deleted 

Option to not delete the source bundle in S3 to prevent data loss 

## Elastic Beanstalk Extensions ## 

A zip file containing application code must be deployed to Beanstalk 

All the parameters on the UI can be configured with code using files 

Requirements: 
* in the .ebextensions/ directory in the root of the source code 
* YAML / JSON format 
* .config extensions [e.g., logging.config] 
* Able to modify some default settings using option_settings 
* Ability to add resources such as RDS/ElastiCache/DynamoDB/etc. 

Resources managed by .ebextensions get deleted if the environment goes away 

## Beanstalk and CloudFormation ## 

Under the hood, Beanstalk relies on CloudFormation 

CloudFormation is used to provision other AWS services 

Use-case: Can define CloudFormation resources in .ebextensions/ to provision ElastiCache, S3, etc. 

## Beanstalk Cloning ## 

Clone an environment with the exact same configuration 

Useful for deploying "test" versions of an application 

All resources and configuration are preserved 
* LB type and configuration 
* RDS database type [but not the data] 
* Environment variables 

After cloning an environment, can change settings 

## Beanstalk Migrations ## 

### Load Balancer ### 

After creating a Beanstalk environment, cannot change the ELB type [only the configuration] 

To migrate: 
* Create a new env with same config except LB 
* Deploy application into new env 
* Perform a CNAME swap or Route53 update 

### RDS ### 

RDS can be provisioned with Beanstalk, which is great for dev / test 

Not great for prod as the database lifecycle is tied to the Beanstalk environment lifecycle 

For prod, best to separately create an RDS DB and provide the Beanstalk application with the connection string 

To decouple RDS: 
* Create snapshot of RDS DB as a safeguard 
* Go to RDS console and enable deletion protection 
* Create a new Beanstalk environment without RDS and point application to existing RDS 
* Perform a CNAME swap or Route53 update and confirm working 
* Terminate the old environment; RDS won't be deleted 
* Delete CloudFormation stack [in DELETE_FAILED] state 