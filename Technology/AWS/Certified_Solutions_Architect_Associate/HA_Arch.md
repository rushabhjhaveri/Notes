# HA Architecture ## 
## Elastic Load Balancers ## 
Physical/virtual device designed to balance network load across multiple web servers 

AWS has three load balancer types: 
* Application Load Balancer 
    * Best suited for balancing of HTTP and HTTPS traffic 
    * Operate at Layer 7 and are application-aware 
    * Intelligent, and can create advanced request routing, sending specified requests to specific web servers 
* Network Load Balancer 
    * Best suited for load balancing of TCP traffic where extreme performance is required 
    * Operates at the connection level [Layer 4] 
    * Capable of handling millions of requests per second, while maintaining ultra-low latencies 
    * Use for extreme performance 
* Classic Load Balancer 
    * Legacy ELBs 
    * Can load balance HTTP/HTTPS applications and use Layer 7-specific features, such as X-Forwarded, and sticky sessions 
    * Can also use strict Layer 4 load balancing for applications that rely purely on the TCP protocol   

Errors in load balancing: 
* Class Load Balancers: if an application stops responding, the ELB/Classic LB responds with a 504 error - this means that the application is having issues; this could be either at the web server layer, or at the database layer - identify where the application is failing, and scale it up/out where possible 

X-Forwarded-For Header: if need the IPv4 address of the end-user, using XFF enables that ability 

## Advanced Load Balancer Theory ## 
Sticky sessions: 
* Classic LB routes each request independently to the registered EC2 instance with the smallest load 
* Sticky sessions allow to bind a user's session to a specific EC2 instance - this ensures that all requests from the user during that session are sent to the same instance 
* Can enable sticky sessions for ALBs as well, but the traffic will be sent at the Target Group level 
* Can be helpful if storing information locally to that instance 

Cross-Zone Load Balancing: enables load balancing across multiple AZs 

Path Patterns: 
* Can create a listener with rules to forward requests based on the URL path 
* This is known as a path-based routing 
* If running microservices, can route traffic to multiple backend services using path-based routing 
* E.g., can route general requests to one target group, and requests to render images to another target group 

## Auto Scaling ## 
Autoscaling has three components: 
* Groups 
    * Logical component 
    * Webserver groups or application group or database group, etc. 
* Configuration Templates 
    * Groups uses a launch template or a launch configuration as a configuration template for its EC2 instances 
    * Can specify information such as the AMI ID, instance type, key-pair, security groups, and block device mapping for instances 
* Scaling Options 
    * Provides several ways to scale ASGs 
    * For example, can configure a group to scale based on the occurrence of specified conditions [dynamic scaling], or on a schedule 

Scaling options: 
* Maintain current instance levels at all times 
    * Can configure ASG to maintain a specified number of running instances at all times 
    * To maintain the current instance levels, EC2 Autoscaling performs a periodic health check on running instances within an ASG 
    * When EC2 Autoscaling finds an unhealthy instance, it terminates that instance and launches a new one 
* Scale manually 
    * Most basic way to scale resources, where one specifies only the change in the maximum, minimum, or desired capacity of the ASG 
    * EC2 Autoscaling manages the process of creating or terminating instances to maintain the updated capacity 
* Scale based on a schedule 
    * Scale by schedule means that scaling actions are performed as a function of time and date 
    * This is useful when it is known exactly when to increase and decrease the number of instances in the group, simply because the need arises on a predictable schedule 
* Scale based on demand 
    * A more advanced way to scale resources - using scaling policies - enables the definition of parameters that control the autoscaling process 
    * E.g., scaling based on instance CPU utilization levels 
    * This method is useful for scaling in response to changing conditions, when it is not known when said conditions will change 
* Use predictive scaling 
    * Can use EC2 Autoscaling in combination with AWS Autoscaling to scale resources across multiple services 
    * AWS Autoscaling can help maintain optimal availability and performance by combining predictive scaling and dynamic scaling [proactive and reactive approaches respectively] to scale AWS EC2 capacity faster 

## HA Architecture ## 
Everything fails - should always plan for failure 

Use multiple AZs and multiple regions whereever possible 

Know the difference between multi-AZ and read replicas for RDS 

Know the difference between scaling out and scaling up 

Always consider cost element 

Know the different S3 storage classes 

## CloudFormation ## 
Way of completely scripting cloud environment 

Quick Start is a bunch of CloudFormation templates already built by AWS Solutions Architects allowing to create complex environments very quickly 

## Elastic Beanstalk ## 
Quickly deploy and manage applications in the AWS Cloud without worrying about the infrastructure that runs those applications 

Simply upload application/code, and Elastic Beanstalk automatically handles the details of capacity provisioning, load balancing, scaling, and application health monitoring 

## High Availability With Bastion Hosts ## 
Scenario 1: Two hosts in two separate AZs; use a network load balancer with static IP addresses and health checks to fail over from one host to the other 
* Important note: cannot use an ALB as it is a layer 7 and need a layer 4 load balancer for a layer 4 connection 

Scenario 2: One host in one AZ behind an ASG with health checks and a fixed Elastic IP address; if the health check fails, the ASG will provision a new EC2 instance in a separate AZ, can use a userdata script to provision the same EIP to the new host - this is the cheapest option, but not 100% fault tolerant 

## On-Prem Strategies With AWS ## 
Need to be aware of what high-level AWS services can be used on-prem: 
* Database Migration Service [DMS] 
    * Allows to move databases to and from AWS 
    * Might have DR environment in AWS and on-prem as primary 
    * Works with most popular database technologies, such as Oracle, MySQL, DynamoDB, etc. 
    * Supports both homogenous and heterogeneous migrations 
* Server Migration Service [SMS] 
    * Supports incremental replication of on-prem servers in AWS 
    * Can be used as a backup tool, multi-site strategy [on-prem, off-prem], and a DR tool 
* AWS Application Discovery Service 
    * AWS Application Discovery Service helps enterprise customers plan migration projects by gathering information about their on-prem data centers 
    * Can install the AWS Application Discovery Agentless Connector as a virtual applicance on VMWare vCenter 
    * It will then build a server utilization map and dependency map of on-prem environment 
    * The collected data is retained in encrypted format in an AWS Application Discovery Service data store - can export this data as a CSV file and use it to estimate the total cost of ownership of running on AWS and to plan migration to AWS 
    * This data is also available in AWS Migration Hub, where can migrate the discovered servers and track their progress as they get migrated to AWS 
* VM Import/Export 
    * Migrate existing applications into EC2 
    * Can be used to create a DR strategy on AWS or use AWS as a second site 
    * Can also use it to export AWS VMs to on-prem data center 
* Download Amazon Linux 2 as an ISO 
    * Works with all major virtualization providers, such as VMWare, Hyper-V, KVM, VirtualBox [Oracle], etc. 