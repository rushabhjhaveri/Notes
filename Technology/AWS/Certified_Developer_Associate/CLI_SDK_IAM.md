# AWS CLI, SDK, IAM Roles & Policies # 

## AWS CLI STS Decode ## 

When running API calls and they fail, can get a long error message 

The error message can be decoded using the STS command line: sts decode-authorization-message 

## AWS EC2 Instance Metadata ## 

AWS EC2 instance metadata is powerful but one of the least known features to developers 

Allows EC2 instances to "learn about themselves" without using an IAM role for that purpose 

URL is https://169.254.169.254/latest/meta-data 

Can retrieve the IAM Role name from the metadata, but CANNOT retrieve the IAM policy 

Metadata = info about the EC2 instance 

Userdata = launch script of the EC2 instance 

## AWS CLI with MFA ## 

To use MFA with the CLI, must create a temporary session 

To do so, must run the STS GetSessionToken API call 

aws sts get-session-token --serial-number <arn of the mfa device> --token-code <code from token> --duration-seconds 3600 

## AWS SDK Overivew ## 

Useful when it is desired to perform actions on aws directly from an application's code without using the CLI 

Official SDKs for Java, .NET, Node.js, PHP, Python [named boto3/botocore], Go, Ruby, C++ 

If a default region is not configured or a region specified, then the SDK will use us-east-1 by default 

## Exponential Backoff & Service Limit Increase ## 

API Rate Limits: 
* Different AWS services have different API rate limits 
* For intermittent errors: implement exponential backoff 
* For consistent errors: request an API throttling limit increase 

Service Quotas [Service Limits]: 
* Running on-demand standard instances: 1152 vCPU 
* Can request a service limit increase by opening a ticket 
* Can request a service quota increase by using the Service Quotas API 

If getting ThrottlingException intermittently, use exponential backoff 

Retry mechanism already included in AWS SDK API calls 

Must self-implement if using the AWS API as-is or in specific cases 
* Must only implement the retries on 5XX server errors and throttling 
* Do not implement on the 4XX client errors 

## AWS CLI Credentials Provider Chain ## 

CLI will look for credentials in this order: 
* Command line options: --region, --output, --profile 
* Environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN 
* CLI credentials file: aws configure [~/.aws/credentials on Linux / Mac & C:\Users\user\.aws\credentials on Windows] 
* CLI configuration file: aws configure [~/.aws/config on Linux / Mac & C:\Users\USERNAME\.aws\config on Windows] 
* Container credentials: for ECS tasks 
* Instance profile credentials: for EC2 Instance Profiles 

## AWS Signature v4 Signing ## 

When calling the AWS HTTP API, can sign the request so AWS can identify the requestor via their AWS credentials [access key and secret key] 

Note: some requests to Amazon S3 don't need to be signed 

If using the SDK or CLI, the HTTP requests are signed for you 

Should sign an AWS HTTP request using signature v4 [SigV4] 