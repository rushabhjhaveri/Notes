# Serverless # 

## Lambda ## 
Lambda is the ultimate abstraction layer 
* Data centers 
* Hardware 
* Assembly Code/Protocols 
* High Level Languages 
* Operating Systems 
* Application Layer/AWS APIs 
* AWS Lambda 

Lambda is a compute service where one can upload code and create a lambda function; AWS Lambda takes care of provisioning and managing the servers used to run the code 

Do not have to worry about operating systems, patching, scaling, etc. 

Can use lambda in the following ways: 
* As an event-driven compute service where AWS Lambda runs the code in response to events - these events could be changes to data in an S3 bucket or a DynamoDB table 
* As a compute service to run code in response to HTTP[S] requests using API Gateway or API calls made using AWS SDKs 

Traditional vs Serverless Architecture 

Languages supported by Lambda: 
* Node.js 
* Java 
* Python 
* C# 
* Go 
* PowerShell 

Lambda Pricing: 
* Number of requests: first 1 million requests are free, $0.20 per 1 million requests thereafter 
* Duration: duration is calculated from the time code begins executing until it returns or otherwise terminates, rounded up to the nearest 100ms - the price depends on the amount of memory allocated to the function, and are charged $0.00001667 for every GB-second used 

Why is lambda cool: 
* No servers! 
* Continuous scaling 
* Super cheap 

Lambda scales out [not up] automatically 

Lambda functions are independent, 1 event = 1 function 

Lambda functions can trigger other lambda functions 

Architectures can get extremely complicated, AWS X-ray allows to debug what is happening 

Lambda can do things globally, can use it to back up S3 buckets to other S3 buckets 

Know triggers 

## Serverless Application Model ## 

CloudFormation extension optimized for serverless applications 

New types: functions, APIs, tables 

Supports anything that CloudFormation supports 

Run serverless applications locally 

Package and deploy using CodeDeploy 

## Elastic Container Service ## 

Containers and Docker: 
* A container is a package that contains an application, libraries, runtime, and tools required to run it 
* Run on a container engine like Docker 
* Provides the isolation benefits of virtualization with less overhead and faster starts than VMs 
* Containerized applications are portable and offer a consistent environment 

ECS: 
* Managed container orchestration service 
* Create clusters to manage fleets of container deployments 
* ECS manages EC2 or Fargate instances 
* Schedules containers for optimal placement 
* Defines rules for CPU and memory requirements 
* Monitors resource utilization 
* Deploy, update, roll back 
* Free! 
* VPC, SG, EBS Volumes 
* ELB 
* CloudTrail and CloudWatch integration 

ECS Components: 
* Cluster: logical collection of ECS resources - either ECS EC2 instances or Fargate instances 
* Task Definition: defines the application 
    * Similar to a Dockerfile but for running containers in ECS 
    * Can contain multiple containers 
* Container Definition: inside a task definition, it defines the individual containers a task uses 
    * Controls CPU and memory allocation and port mappings 
* Task: single running copy of any containers defined by a task definition 
    * One working copy of an application [e.g., DB and web containers] 
* Service: allows task definition to be scaled by adding tasks 
    * Defines minimum and maximum values 
* Registry: storage for container images [e.g., Elastic Container Registry [ECR] or Docker Hub] 
    * Used to download images to create containers 

Fargate: 
* Serverless container engine '
* Eliminates the need to provision and manage servers 
* Specify and pay for resources per application 
* Works with both ECS and EKS 
* Each workload runs in its own kernel 
* Isolation and security 
* Choose EC2 instead if: 
    * Compliance requirements 
    * Require broader customization 

EKS: 
* Elastic Kubernetes Service 
* K8s is an open-source software that lets one deploy and manage containerized applications at scale 
* Same toolset on-prem and in-cloud 
* Containers are grouped in pods 
* Like ECS, supports both EC2 and Fargate 
* Why use EKS? 
    * Already using K8s 
    * Want to migrate to AWS 

ECR: 
* Managed Docker container registry 
* Store, manage, and deploy images 
* Integrated with ECS and EKS 
* Works with on-premises deployments 
* Highly available 
* Integrated with IAM 
* Pay for storage and data transfer 

ECS + ELB: 
* Distribute traffic evenly across tasks in service 
* Supports ALB, NLB, CLB 
* Use ALB to route HTTP/HTTPS [layer 7] traffic 
* Use NLB or CLB to route TCP [layer 4] traffic 
* Supported by both EC2 and Fargate launch types 
* ALB allows: 
    * Dynamic host port mapping 
    * Path-based routing 
    * Priority rules 
* ALB is recommended over NLB or CLB 