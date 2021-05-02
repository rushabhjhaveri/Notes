# Applications # 

## SQS ## 
Web service that gives access to a message queue that can be used to store messages while waiting for a computer to process them 

Distributed queue system that enables web service applications to quickly and reliably queue messages that one component in the application generates to be consumed by another component 

A queue is a temporary repository for messages that are awaiting processing 

Using SQS, can decouple the components of an application so they run independently, easing message management between components 

Any component of a distributed application can store messages in a fail-safe queue 

Messages can contain up to 256 KB of text in any format - any component can later retrieve the messages programmatically using the SQS API 

The queue acts as a buffer between the component producing and saving data, and the component receiving the data for processing 

This means that the queue resolves issues that arise if the producer is producing work faster than the customer can process it, or if the producer or consumer are only intermittently connected to the network 

Pull-based, not push-based 

Messages can be kept in the queue from one minute to 14 days; the default retention period is four days 

Visibility timeout: the amount of time that the message is invisible in the SQS queue after a reader picks up the message 
* Provided the job is processed before the visibility timeout expires, the message will then be deleted from the queue 
* If the job is not processed within that time, the message will become visible again and another reader will process it 
* This could result in the same message being delivered twice 
* Visibility timeout maximum is 12 hours 

Two types of queues: 
* Standard queues [default] 
    * SQS offers standard as the default queue type 
    * A standard queue lets one have a nearly-unlimited number of transactions per second 
    * Standard queues guarantee that a message is delivered at least once 
    * Occasionally, because of the highly-distributed architecture that allows high throughput, more than one copy of a message might be delivered out of order 
    * However, standard queues provide best-effort ordering which ensures that messages are generally delivered in the same order as they are sent 
* FIFO queues 
    * The FIFO queue complements the standard queue 
    * The most important feature of this queue type are FIFO delivery and exactly-once processing the order in which messaages are sent and received is strictly preserved and a message is delivered once and remains available until a consumer processes and deletes it; duplicates are not allowed into the queue 
    * Support message groups that allow multiple ordered message groups within a single queue 
    * Limited to 300 transactions per second, but have all the capabilities of standard queues 

SQS guarantees messages will be processed at least once 

SQS long polling is a way to retrieve messages from SQS queues; while the regular short polling returns immediately [even if the message queue being polled is empty], long polling doesn't return a response until a message arrives in the message queue, or the long poll times out 

## Simple Work Flow Service ## 
SWF is a web service that makes it easy to coordinate work across distributed application components 

SWF enables applications for a range of use-cases, including media processing, web application backends, business process workflows, and analytics pipelines, to be designed as a coordination of tasks 

Tasks represent invocations of various processing steps in an application which can be performed by executable code, web service calls, human actions, and scripts 

SWF vs SQS: 
* SQS has a retention period of up to 14 days; SWF workflow executions can last up to one year 
* SWF presents a task-oriented API, whereas SQS offers a message-oriented API 
* SWF ensures that a task is assigned only once and is never duplicated; with SQS, need to handle duplicated messages and may also need to ensure that a message is processed only once 
* SWF keeps track of all the tasks and events in an application; with SQS, need to implement application-level tracking, especially if the application uses multiple queues 

SWF Actors: 
* Workflow Starters: an application that can initiate [start] a workflow - could be e-commerce website following the placement of an order, or a mobile app searching for bus times 
* Deciders: control the flow of activity tasks in a workflow execution; if something has finished [or failed] in a workflow, a decider decides what to do next 
* Activity Workers: carry out the activity tasks 

## Simple Notification Service ## 
SNS is a web service that makes it easy to set up, operate, and send notifications from the cloud 

It provides developers with a highly scalable, flexible, and cost-effective capability to publish messages from an application and immediately deliver them to subscribers or other applications 

Besides pushing cloud notifications directly to mobile devices, SNS can also deliver notifications by SMS text message, or email to SQS queues, or to any HTTP endpoint 

SNS allows to group multiple recipients using topics 

A topic is an "access point" for allowing recipients to dynamically subscribe for identical copies of the same notification 

One topic can support deliveries to multiple endpoint types - e.g., can group together iOS, Android, and SMS recipients 

When publish once to a topic, SNS delivers appropriately formatted copies of the message to each subscriber 

To prevent messages from being lost, all messages published to SNS are stored redundantly across multiple AZs 

SNS Benefits: 
* Instantaneous, push-based delivery [no polling] 
* Simple APIs and easy integration with applications 
* Flexible message delivery over multiple transport protocols 
* Inexpensive, pay-as-you-go model with no upfront costs 
* Web-based AWS Management Console offers the simplicity of a point-and-click interface 

SNS vs SQS: 
* Both messages services in AWS 
* SNS - push 
* SQS - pulls [polls] 

## Elastic Transcoder ## 
Media transcoder in the cloud 

Convert media files from their original source format into different formats that will play on smartphones, tablets, PCs, etc. 

Provides transcoding presets for popular output formats, which means that one does not need to guess about which settings work on particular devices 

## API Gateway ## 
API Gateway is a fully managed service that makes it easy for developers to publish, maintain, monitor, and secure API's at any scale 

With a few clicks in the AWS Management Console, can create an API that acts as a "front door" for applications to access data, business logic, or functionality from backend services, such as applications running on EC2, code running on Lambda, or any web application 

What API Gateway can do: 
* Expose HTTPS endpoints to define a RESTful API 
* Serverlessly connect to services like Lambda and DynamoDB 
* Send each API endpoint to a different target 
* Run efficiently with low cost 
* Scale effortlessly 
* Track and control usage by API key 
* Throttle requests to prevent attacks 
* Connect to CloudWatch to log all requests for monitoring 
* Maintain multiple versions of API 

Configuring API Gateway: 
* Define an API [container] 
* Define resources and nested resources [URL paths] 
* For each resource: 
    * Select support HTTP methods 
    * Set security 
    * Choose target [such as EC2, Lambda, DynamoDB, etc.] 
    * Set request and response transformations 

Deploying API Gateway: 
* Deploy API to a stage: 
    * Uses API Gateway domain by default 
    * Can use custom domain 
    * Now supports AWS Certificate Manager: free SSL/TLS certs 

API Gateway Caching: 
* Can enable API caching in API Gateway to cache endpoint's response 
* With caching, can reduce the number of calls made to the endpoint, and also improve the latency of the requests to the API 
* When enabling caching for a stage, API Gateway caches responses from the endpoint for a specified TTL period [in seconds] 
* API Gateway then responds to the request by looking up the endpoint response from the cache instead of making a request to the endpoint itself 

Same Origin Policy: 
* In computing, the same-origin policy is an important concept in the web application security model 
* Under the policy, a web browser permits scripts contained in a first web page to access data in a second web page only if both web pages have the same origin 
* This is done to prevent cross-site-scripting [XSS] attacks 
    * Enforced by web browsers 
    * Ignored by tools such as Postman and curl 

CORS: 
* CORS is one way the server at the other end [not the client code in the browser] can relax the same-origin policy 
* Cross-origin resource sharing [CORS] is a mechanism that allows restricted resources [e.g., fonts] on a webpage to be requested from another domain outside the domain from which the first resource was served 
* CORS in action: 
    * Browser makes an HTTPS OPTIONS call for a URL 
    * Server returns a response that says "These other domains are approved to GET this URL" 
    * Error - "Origin policy cannot be read at the remote resource?" -- need to enable CORS on API Gateway 
* CORS is enforced by the client 

## Kinesis 101 ## 
Streaming Data: data that is generated continuously by thousands of data sources, which typically send in the data records simultaneously and in small sizes [order of kilobytes] 

Examples of streaming data: 
* Purchases from online stores 
* Stock prices 
* Game data [as the gamer plays] 
* Social network data 
* Geospatial data [think of Uber maps/location] 
* IOT sensor data 

Kinesis is a platform on AWS to send streaming data to 

Kinesis makes it easy to load and analyze streaming data, and also provides the ability to build custom applications for business needs 

Three different types of Kinesis: 
* Kinesis Streams 
    * Kinesis Streams consist of shards 
        * Five transactions per second for reads, up to a maximum total data read rate of 2MB per second and up to 1000 records per second for writes, up to a maximum total data write rate of 1MB per second [including partition keys] 
        * The data capacity of the stream is a function of the number of shards specified for the stream 
        * The total capacity of the stream is the sum of the capacities of its shards 
    * Data retained in Streams for 24 hours to up to 7 days 
* Kinesis Firehose 
    * No data retention - must be used as data comes in 
    * Data fed into Lambda and used immediately 
* Kinesis Analytics 
    * Analyze data within Kinesis 

## Web Identity Federation & Cognito ## 
Web Identity Federation enables the ability to give users access to AWS resources after they have successfully authenticated with a web-based identity provider like Amazon, Facebook, or Google 

Following successful authentication, the user receives an authentication code from the web ID provider, which they can trade for temporary AWS security credentials 

Amazon Cognito provides Web Identity Federation with the following features: 
* Sign-up/sign-in into apps 
* Access for guest users 
* Acts as an Identity Broker between applications and Web ID providers, so don't need to write any additional code 
* Synchronizes user data for multiple devices 
* Recommended for all mobile applications AWS services 

The recommended approach for Web Identity Federation using social media accounts like Facebook: 
* Cognito brokers the app and Facebook or Google to provide temporary credentials which map to the IAM role allowing access to the required resources 
* No need for the application to embed or store AWS credentials locally on the device and it gives users a seamless experience across all mobile devices 

Cognito User Pools: 
* User pools are user directories used to manage sign-up and sign-in functionality for mobile and web applications 
* Users can sign-in directly to the user pool, or using Facebook, Amazon, or Google 
* Cognito acts as an Identity Broker between the identity provider and AWS 
* Successful authentication generates a JSON Web Toke [JWTs] 

Cognito Identity Pools: Identity Pools enable temporary AWS credentials to access AWS services like S3 or DynamoDB 

Cognito Synchronization: 
* Cognito tracks the association between user identity and the various different devices they sign in from 
* In order to provide a seamless user experience for applications, Cognito uses Push Synchronization to push updates and synchronize user data across multiple devices 
* Cognito uses SNS to send a notification to all the devices associated with a given user identity whenever data stored in the cloud changes 