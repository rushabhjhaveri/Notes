# Access Control # 

## Access Control ## 

Access Control: Methods used to secure data and information by verifying a user has permissions to read, write, delete, or otherwise modify it 

## Access Control Models ## 

Discretionary Access Control [DAC]: The access control policy is determined by the owner 

DAC is commonly used 

For DAC: 
* Every object in the system must have an owner 
* Each owner determines access rights and permissions for each object 

Mandatory Access Control [MAC]: An access control policy where the computer system determines the access control for an object 

Where in DAC the owner chooses the permissions, in MAC, the computer does 

MAC relies on security labels being assigned to every user [called a subject] and every file/folder/device or network connection [called an object] 

Data labels create trust levels for all subjects and objects 

To access something, one needs to meet the minimum level and have a "need-to-know" 

MAC is implemented through Rule-based and Lattice-based access control methods 

Rule-Based Access Control: Label-based access control that defines whether access should be granted or denied to objects by comparing the object label and the subject label 

Lattice-Based Access Control: Utilizes complex mathematics to create sets of objects and subjects to define how they interact 

MAC is a feature in FreeBSD and SELinux 

MAC is present only in high-security systems due to its complex configuration 

Role-Based Access Control [RBAC]: An access model that is controlled by the system [like MAC] but utilizes a set of permissions instead of a single data label to define the permission level 

Power Users is a role-based permission 

Attribute-Based Access Control [ABAC]: An access model that is dynamic and context aware using IF-THEN statements 

## Best Practices ## 

Best Practices: The access control policy is determined by the owner 

Implicit Deny: All access to a resource should be denied by default and only be allowed when explicitly stated 

Least Privilege: Users are only given the lowest level of access needed to perform their job functions 

Separation of Duties: Requires more than one person to conduct a sensitive task or operation 

Separation of duties can be implemented by a single user with a user and admin account 

Job Rotation: Occurs when users are cycled through various jobs to learn the overall operations better, reduce their boredom, enhance their skill level, and most importantly, increase our security 

Job rotation helps the employee become more well-rounded and learn new skills 

Job rotation also helps the organization identify theft, fraud, and abuse of position 

## Users and Groups ## 

Computers can have multiple users and groups 

User Rights: Permissions assigned to a given user 

Groups: Collection of users based on common attributes [generally, work roles] 

Permissions are broken down into read, write, and execute inside Linux 

Permissions are assigned to Owners [U], Groups [G], and All users [O/A] 

chmod: Program in Linux that is used to change the permissions or rights of a file or folder using a shorthand number system 
* R [Read] = 4 
* W [Write] = 2 
* X [Execute] = 1 

Privilege Creep: Occurs when a user gets additional permissions over time as they rotate through different positions or roles 

Privilege creep violates the principles of least privilege 

User Access Recertification: Process where each user's rights and permissions are revalidated to ensure they are correct 

## Permissions ## 

