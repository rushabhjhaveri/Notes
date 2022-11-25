# AWS Fundamentals: ELB + ASG # 

## High Availability and Scalability ## 

Scalability means that an application / system can handle greater loads by adapting 

Two kinds of scalability: vertical, and horizontal [elasticity] 

Vertical scalability means increasing the size of the instance 

Vertical scalability is very common for non-distributed systems, such as a database 

There's usually a limit to how much one can vertically scale [hardware limit] 

Horizontal scalability means increasing the number of instances / systems for the application 

Horizontal scaling implies distributed systems 

High availability usually goes hand-in-hand with horizontal scaling 

High availability means running applications/systems in at least two data centers [AZs] 

The goal of high availability is to survive a data center loss 

High availability can be active [horizontal scaling] or passive [e.g., multi-az] 

## Elastic Load Balancing Overview ## 

Load balancers are servers that forward traffic to multiple servers [e.g., EC2 instances] downstream 

Why use a load balancer: 
* Spread load across multiple downstream instances 
* Expose only a single point of access [DNS] to the application 
* Seamlessly handle failures of downstream instances 
* Do regular health checks to instances 
* Provide SSL termination [HTTPS] for websites 
* Enforce stickiness with cookies 
* High availability across zones 
* Separate public traffic from private traffic 

Elastic Load Balancer is a managed load balancer 
* AWS guarantees that it will be working 
* AWS takes care of upgrades, maintenance, high availability 
* AWS provides only a few configuration knobs 

It costs less to set up one's own load balancer, but it will be a lot more effort to maintain 

ELB is integrated with many AWS offerings / services 

Health checks are crucial for load balancers 

They enable the load balancer to know if the instances it forwards traffic to are available to reply to requests 

The health check is done on a port and a route 

If the response is not 200 OK, then the instance is unhealthy 

Types of load balancers on AWS: 
* Classic Load Balancer 
* Application Load Balancer 
* Network Load Balancer 
* Gateway Load Balancer 

Overall, it is recommended to use the newer generation load balancers as they provide more features 

Some load balancers can be set up as internal [private] or external [public] ELBs 

## Classic Load Balancer ## 

Supports TCP [Layer 4], HTTP & HTTPS [Layer 7] 

Health checks are TCP or HTTP-based 

Fixed hostname [x.region.elb.amazonaws.com] 

## Application Load Balancer ## 

ALBs operate on Layer 7 [HTTP] 

Load balancing to multiple HTTP applications across machines [target groups] 

Load balancing to multiple applications on the same machine [e.g., containers] 

Support for HTTP/2 and websockets 

Supports redirects [from HTTP to HTTPS, for example] 

Routing tables to different target groups 
* Routing based on path in URL [e.g., example.com/users & example.com/posts] 
* Routing based on hostname in URL [e.g., one.example.com & other.example.com] 
* Routing based on query string, headers [e.g., example.com/users?id=123&order=false] 

ALBs are a great fit for microservies and container-based applications [e.g., docker/ECS] 

Has a port mapping feature to redirect to a dynamic port in ECS 

In comparison, would need multiple CLBs per application 

ALB Target Groups can be: 
* EC2 instances [can be managed by an ASG] - HTTP 
* ECS tasks [managed by ECS itself] - HTTP 
* Lambda functions - HTTP request is translated into a JSON event 
* IP addresses - must be private IPs 

ALBs can route to multiple target groups 

Health checks are at the target group level 

Fixed hostname [x.region.elb.amazonaws.com] 

The application servers don't see the IP of the client directly 

The true IP of the client is inserted in the X-Forwarded-For header 

Can also get the port [X-Forwarded-Port] and proto [X-Forwarded-Proto] 

## Network Load Balancer ## 

Operate at Layer 4 

Allow to: 
* Forward TCP and UDP traffic to instances 
* Handle millions of requests per second 
* Less latency [~100ms vs 400ms for ALB] 

NLB has one static IP per AZ and supports assigning Elastic IP [helpful for allowlisting specific IPs] 

NLB are used for extreme performance, TCP or UDP traffic 

Target Groups can be EC2 Instances / Private IPs / ALBs 

Health Checks support the TCP, HTTP, and HTTPS protocols 

## Gateway Load Balancer ## 

Deploy, scale, and manage a fleet of third party network virtual appliances in AWS 

Examples: Firewalls, IDS/IPS, Deep Packet Inspection Systems, payload manipulation, etc. 

Operates at Layer 3 [Network Layer] - IP Packets 

Combines the following functions: 
* Transparent Network Gateway: single entry/exit for all traffic 
* Load Balancer: distributes traffic to virtual appliances 

Uses the GENEVE protocol on port 6081 

Target groups: EC2 instances / Private IPs 

## Sticky Sessions [Session Affinity] ## 

It is possible to implement stickiness so that the same client is always redirected to the same instance behind a load balancer 

This works for CLBs and ALBs 

The "cookie" used for stickiness has an expiration date that can be controlled 

Use case: make sure the user doesn't lose their session data 

Enabling stickiness may bring imbalance to the load over the backend EC2 instances 

Application-based Cookies: 
* Custom Cookie 
    * Generated by the target 
    * Can include any custom attributes required by the application 
    * Cookie name must be specified individually for each target group 
    * Don't use AWSALB, AWSALBAPP, or AWSALBTG [reserved for use by the ELB] 
* Application Cookie: 
    * Generated by the load balancer 
    * Cookie name is AWSALBAPP 

Duration-based Cookies: 
* Cookie generated by the load balancer 
* Cookie name is AWSALB for ALB, AWSELB for CLB 

## ELB - Cross Zone Load Balancing ## 

Each LB instance distributes load evenly across all registered instances in an AZ 

On ALB, always on, cannot be disabled, no charges for inter-AZ data 

On NLB, disabled by default, customer pays for inter-AZ data, if enabled 

On CLB, disabled by default, no charges for inter-AZ data, if enabled  

## ELB - SSL Certificates ## 

### SSL/TLS Basics ### 

An SSL certificate allows traffic between clients and a load balancer to be encrypted in transit [in-flight encryption] 

SSL refers to Secure Sockets Layer, used to encrypt connections 

TLS refers to Transport Layer Security, which is a newer version of SSL 

Nowadays, TLS certificates are mainly used, but may still be referred to as SSL certificates 

Public SSL certificates are issued by Certificate Authorities [CA] 

SSL certificates have an expiration date and must be renewed 

### ELB - SSL ### 

The load balancer uses an X.509 certificate [SSL/TLS server certificate] 

Can manage certificates using ACM [AWS Certificate Manager] 

Alternatively, one can create/upload one's own certificates 

HTTPS listener must have a default certificate specified, and can add an optional list of certs to support multiple domains 

Clients can use Server Name Indication [SNI] to specify the hostname they reach 

Can also specify a security policy on the HTTP listener to support older versions of SSL/TLS for legacy clients  

### SNI ### 

SNI solves the problem of loading multiple SSL certs onto one web server [to serve multiple websites] 

It's a "newer" protocol, and requires the client to indicate the hostname of the target server in the initial SSL handshake 

The server will then find the correct certificate, or return the default one 

SNI only works for ALB and newer generation NLBs, and on CloudFront 

SNI does not work for older-gen CLBs 

### ELBs - Supported SSL Certs ### 

CLB [v1]: 
* Supports only one SSL cert 
* Must use multiple CLBs for multiple hostnames with multiple SSL certs 

ALB [v2]: 
* Supports multiple listeners with multiple SSL certs 
* Uses SNI to make it work 

NLB [v2]: 
* Supports multiple listeners with multiple SSL certs 
* Uses SNI to make it work 

## ELB - Connection Draining ## 

Feature naming: Connection Draining for CLBs, Deregistration Delay for ALBs/NLBs 

Time to complete in-flight requests while the instance is deregistering/unhealthy 

Stops sending new requests to the EC2 instance which is deregistering 

Between 1 and 3600 seconds [default: 300 seconds] 

Can be disabled [set value to 0] 

Set to low value if requests are short 

## ASG Overview ## 

The goal of an ASG is to: 
* Scale out [add EC2 instances] to match an increase in load 
* Scale in [remove EC2 instances] to match a decrease in load 
* Ensure there are a minimum and maximum number of EC2 instances running at any given time 
* Automatically register new instances to a load balancer 
* Re-create an EC2 instance in case a previous one is terminated/unhealthy 

ASGs are free [pay for the underlying EC2 instances] 

Create ASGs via launch templates 

### ASG Scaling via CloudWatch ### 

Also possible to scale ASGs based on CloudWatch alarms 

An alarm monitors a metric, such as average CPU [or custom metrics] 

Metrics such as average cpu are computed for the overall ASG instances 

Create scaling policies based on alarms 

## ASGs - Scaling Policies ## 

Dynamic Scaling Policies: 
* Target Tracking Scaling 
    * Most simple and easy to set up 
    * Example: want average ASG CPU to stay at around 40% 
* Simple/Step Scaling 
    * When a CloudWatch alarm is triggered, scale in/out accordingly 
* Scheduled Actions 
    * Anticipate a scaling based on known usage patterns 

Predictive Scaling: continuously forecast load, and schedule scaling ahead of time 

Good metrics to scale on: 
* CPUUtilization: average CPU utilization across instances 
* RequestCountPerTarget: to make sure the number of requests per EC2 instance is stable 
* Average Network In/Out: if application is network-bound 
* Any custom metric pushed to CloudWatch 

### Scaling cooldown ###  

After a scaling activity happens, enter a cooldown period [default: 300 seconds] 

During the cooldown period, the ASG will not launch or terminate additional instances [to allow for metrics to stabilize] 

Use a ready-to-use AMI to reduce configuration time, in order to serve requests faster, and reduce the cooldown period 