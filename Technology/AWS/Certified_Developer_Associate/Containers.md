# ECS, ECR, & Fargate - Docker in AWS # 

## Docker Introduction ## 

### What is Docker ### 

Docker is a software development platform to deploy apps 

Apps are packaged in containers that can be ran on any OS 

Apps run the same, regardless of where they are run 
* Any machine 
* No compatibility issues 
* Predictable behavior 
* Less work 
* Easier to maintain and deploy 
* Works with any language, any OS, any technology 

Use cases: microservices architecture, lift-and-shift apps from on-prem to the AWS cloud 

### Docker Image Storage ### 

Docker images are stored in Docker Repositories 

Docker Hub: Public repository; find base images for many technologies or OS 

Amazon Elastic Container Registry [ECR]: Private repository; also a public repository [Amazon ECR Public Gallery] 

### Docker vs VMs ### 

Docker is "sort-of" a virtualization technology, but not precisely 

Resources are shared with the host => many containers on one server 

### Docker Container Management on AWS ### 

Amazon Elastic Container Service [ECS]: Amazon's own container platform 

Amazon Elastic Kubernetes Service [EKS]: Amazon's managed Kubernetes service [open-source] 

Amazon Fargate: Amazon's serverless container platform; compatible with both ECS and EKS 

Amazon Elastic Container Registry [ECR]: Store container images 

## Amazon ECS ## 

### Amazon ECS - EC2 Launch Type ### 

Launch Docker Containers on AWS = Launch ECS Tasks on ECS clusters 

EC2 Launch Type: Must provision and maintain the infrastructure [the EC2 instances] 

Each EC2 instance must run the ECS agent to register in the ECS cluster 

AWS takes care of starting / stopping the containers 

### Amazon ECS - Fargate Launch Type ### 

Launch Docker Containers on AWS 

Do not provision the infrastructure [no instances to manage] 

Serverless 

Just create the task definitions 

AWS just runs the ECS Tasks based on the CPU / RAM needed 

To scale, just increase the number of tasks - no instances needed 

### Amazon ECS - IAM Roles for ECS ### 

EC2 Instance Profile [for EC2 Launch Type only]: 
* Used by the ECS agent 
* Make API calls to the ECS service 
* Send container logs to CloudWatch 
* Pull Docker images from ECR 
* Reference sensitive data in Secrets Manager or SSM Parameter Store 

ECS Task Role: 
* Allows each task to have a specific role 
* Use different roles for different ECS services ran 

### Amazon ECS - Load Balancer Integrations ### 

ALB supported and works for most use cases 

NLB recommended only for high throughput / high performance use cases, or to pair with AWS Private Link 

CLB supported but not recommended - no advanced features & no Fargate 

### Amazon ECS - Data Volumes [EFS] ### 

Mount EFS file systems on ECS Tasks 

Works for both EC2 and Fargate Launch Types 

Task running in any AZ will share the same data in the EFS file system 

Fargate + EFS = Serverless 

Use-cases: persistent, multi-AZ shared storage for containers 

Note: Amazon S3 cannot be mounted as a file system 

## Amazon ECS - Auto Scaling ## 

Automatically increase / decrease the desired number of ECS tasks 

Amazon ECS Auto Scaling uses AWS Application Autoscaling 
* ECS Service Average CPU Utilization 
* ECS Service Average Memory Utilization - Scale on RAM 
* ALB Request Count Per Target - Metric coming from the ALB 

Target Tracking - scale based on target value for specific CloudWatch metric 

Step Scaling - scale based on specified CloudWatch alarm 

Scheduled Scaling - scale based on specified date/time [predictive scaling] 

ECS Service Autoscaling [task level] != EC2 Instance Autoscaling [instance level] 

## ECS Rolling Updates ## 

When updating from v1 to v2, can control how many tasks can be started and stopped, and in which order 

## ECS Task Definitions - Deep Dive ## 

### Task Definitions ### 

Task Definitions are metadata in JSON form to tell ECS how to run a docker container 

Contains crucial information, such as: 
* Image Name 
* Port Binding for Container and Host 
* Memory and CPU Required 
* Environment Variables 
* Networking Information 
* IAM Role 
* Logging Configuration 

Can define up to ten containers in a Task Definition 

### ECS - Load Balancing [EC2 Launch Type] ### 

Get a Dynamic Host Port Mapping if only the container port is defined in the Task Definition 

ALB finds the right port on the EC2 instances 

Must allow on the EC2 instance's security group ANY PORT from the ALB's security group 

### ECS - Load Balancing [Fargate] ### 

Each task has a unique private IP 

Only define the container port [host port is not applicable] 

### ECS - Environment Variables ### 

Environment Variable: 
* Hardcoded - e.g., URLs 
* SSM Parameter Store - sensitive variables [e.g., API keys, shared configs] 
* Secrets Manager - sensitive variables [e.g., DB passwords] 

Environment Files [bulk]: Amazon S3 

### ECS - Data Volumes [Bind Mounts] ### 

Share data between multiple containers in the same task definition 

Works for both EC2 and Fargate Tasks 

EC2 Tasks - using EC2 instance storage 
* Data tied to the lifecycle of the EC2 instance 

Fargate Tasks - using ephemeral storage 
* Data tied to the containers using them 
* 20 GB - 200 GB [default: 20 GB] 

Use cases: share ephemeral data between containers; "sidecar" container pattern, where "sidecar" container is used to send metrics/logs to other destinations [separation of concerns] 

## ECS Tasks Placement ## 

When a task of type EC2 is launched, ECS must determine where to place it with the constraints of CPU, memory, and available port 

Similarly, when a service scales in, ECS needs to determine which task to terminate 

To assist with this, a task placement strategy and task placement constraints can be defined 

Note: this is only for ECS with EC2; not Fargate 

### ECS Task Placement Process ### 

Task placement strategies are best-effort 

When ECS places tasks, it uses the following process to select container instances: 
* Identify instances that satisfy the CPU, memory, and port requirements in task definition 
* Identify instances that satisfy task placement constraints 
* Identify instances that satisfy task placement strategies 

### ECS Task Placement Strategies ### 

Binpack: 
* Place tasks based on least-available amount of CPU or memory 
* This minimizes number of instances in use [cost savings] 

Random: place the task randomly 

Spread: 
* Place tasks evenly based on specified value 
* E.g.: instanceId; attribute:ecs.availability-zone 

Can mix task placement strategies together 

### ECS Task Placement Constraints ### 

distinctInstance: place each task on a different container instance 

memberOf: places tasks on instances that satisfy an expression [uses the Cluster Query Language] 

## Amazon ECR ## 

ECR = Elastic Container Registry 

Store and manage Docker images on AWS 

Private and Public repository 

Fully integrated with ECS; backed by S3 

Access is controlled through IAM 

## AWS CoPilot ## 

CLI tool to build, release, and operate production-ready, containerized, applications 

Run apps on AppRunner, ECS, and Fargate 

Helps focus on building apps rather than setting up infrastructure 

Provisions all required infrastructure for containerized apps [ECS, VPC, ELB, ECR, etc.] 

Automated deployments with one command using CodePipeline 

Deploy to multiple environments 

Troubleshooting, logs, health status, etc. 

## Amazon EKS ## 

EKS = Elastic Kubernetes Service 

Way to launch managed Kubernetes clusters on AWS 

Kubernetes is an open-source system for automatic deployment, scaling, and management of containerized [usually Docker] applications 

It is an alternative to ECS; similar but different API 

EKS supports EC2 if desired to deploy worker nodes, or Fargate if a serverless solution is preferred 

Use-case: if the company is already using Kubernetes on-prem or in another cloud, and wants to migrate to AWS 

Kubernetes is cloud-agnostic [can be used in any cloud: AWS, Azure, GCP, etc.] 

### EKS Node Types ### 

Managed Node Groups: 
* Creates and manages nodes [EC2 instances] for you 
* Nodes are part of an ASG managed by EKS 
* Supports on-demand or spot instances 

Self-Managed Nodes: 
* Nodes that are created by application owners, registered to an EKS cluster, and managed by an ASG 
* Can use prebuilt AMI - Amazon EKS Optimized AMI 
* Supports on-demand or spot instances 

AWS Fargate: 
* No maintenance required, no nodes managed 

### EKS Data Volumes ### 

Need to specify StorageClass manifest on EKS cluster 

Leverages a Container Storage Interface [CSI] compliant driver 

Support for EBS, EFS [works with Fargate], FSx for Lustre, FSx for NetApp ONTAP