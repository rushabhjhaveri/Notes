# IAM & AWS CLI # 

## IAM Introduction: Users, Groups, Policies ## 

Global service 

Root account created by default, should not be used or shared 

Users are people within the organization; can be grouped 

Groups only contain users, not other groups 

Users don't have to belong to a group, and a user can belong to multiple groups 

Users or Groups can be assigned JSON documents called policies 

These policies define the permissions of the users 

In AWS, apply the least privilege principle: don't give more permissions than a user needs 

## IAM Policies ## 

IAM Policy structure: 
* Version 
* Id 
* Statement 

Statement structure: 
* Sid 
* Effect 
* Principal 
* Action 
* Resource 
* Condition 

## IAM MFA Overview ## 

Password policy with configurable options 

MFA 

## AWS Access Keys, CLI, and SDK ## 

To access AWS, can either use the aws management console [protected by password + MFA], CLI [protected by access keys], or the aws sdk [for code; protected by access keys] 

Access keys are generated through the AWS consoles and are managed by users 

## IAM Roles for AWS Services ## 

Some AWS services will need to perform actions on one's behalf - for this purpose, assign permissions to AWS services with IAM roles 

Common roles: EC2 instance roles, lambda function roles, roles for cloudformation 

## IAM Security Tools ## 

IAM credentials report [account-level]: a report that lists all of an account's users and the status of their various credentials 

IAM Access Advisor [user-level]: shows the service permissions granted to a suer and when those services were last accessed 

## IAM Best Practices ## 

Do not use the root account except for AWS account setup 

One physical user == one AWS user 

Assign users to groups and assign permissions to groups 

Create a strong password policy 

Use and enforce the use of MFA 

Create and use roles for giving permissions to AWS services 

Use access keys for programmatic access 

Audit permissions of account with the IAM Credentials Report 