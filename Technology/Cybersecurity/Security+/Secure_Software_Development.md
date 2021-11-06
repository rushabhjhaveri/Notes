# Secure Software Development # 

## Software Development ## 

Software Development Lifecycle [SDLC]: SDLC is an organized process of developing a secure application throughout the life of the project 

SDLC Phases: 
* Analysis & Planning 
* Software/Systems Design 
* Implementation 
* Testing 
* Integration 
* Deployment 
* Maintenance 

Agile: Software development is performed in time-boxed or small increments to allow more adaptively to change 

DevOps: Software development and information technology operations 

## SDLC Principles ## 

Developers should always remember confidentiality, integrity, and availability 

Confidentiality: Ensures that only authorized users can access the data 

Integrity: Ensures that the data is not modified or altered without permission 

Availability: Ensuring that data is available to authorized users when it is needed 

Threat Modeling helps prioritize vulnerability identification and patching 

Least Privilege: Users and processes should be run using the least amount of access necessary to perform a given function 

Defense-in-Depth: Layering of security controls is more effective and secure than relying on a single control 

Never Trust User Input: Any input that is received from a user should undergo input validation prior to allowing it to be utilized by an application 

Minimize Attack Surface: Reduce the amount of code used by a program, eliminate unneeded functionality, and require authentication prior to running additional plugins 

Create Secure Defaults: Default installations should include secure configurations instead of requiring an administrator or user to add in additional security 

Authenticity & Integrity: Applications should be deployed using code signing to ensure the program is not changed inadvertantly or maliciously prior to delivery to an end-user 

Fail Securely: Applications should be coded to properly conduct error handling for exceptions in order to fail securely instead of crashing 

Fix Security Issues: If a vulnerability is identified, then it should be quickly and correctly patched to remove the vulnerability 

Rely on Trusted SDKs: SDKs must come from trusted sources to ensure no malicious code is being added 

## Testing Methods ## 

System Testing 
* Black-Box Testing: Occurs when a tester is not provided with any information about the system or program prior to conducting the test 
* White-Box Testing: Occurs when a tester is provided full details of a system, including the source code, diagrams, and user credentials in order to conduct the test 
* Gray-Box Testing: Mix of the prior two 

Structured Exception Handling [SEH]: Provides control over what the application should do when faced with a runtime or syntax error 

Programs should use input validation when taking data from users 

Input Validation: Applications verify that information received from a user matches a specific format or range of values 

Static Analysis: Source code of an application is reviewed manually or with automatic tools without running the code 

Dynamic Analysis: Analysis and testing of a program occurs while it is being executed or run 

Fuzzing: Injection of randomized data into a software program in an attempt to find system failures, memory leaks, error handling issues, and improper input validation 

## Software Vulnerabilities and Exploits ## 

Backdoors: Code placed in computer programs to bypass normal authentication and other security mechanisms 

Backdoors are a poor coding practice and should not be utilized 

Directory Traversal: Method of accessing unauthorized directories by moving through the directory structure on a remote server 

Arbitrary Code Execution: Occurs when an attacker is able to execute or run commands on a victim computer 

Remote Code Execution [RCE]: Occurs when an attacker is able to execute or run commands on a remote computer  

Zero Day: Attack against a vulnerability that is unknown to the original developer or manufacturer 

## Buffer Overflows ## 

Buffer Overflow: Occurs when a process stores data outside the memory range allocated by the developer 

Buffer: A temporary storage area that a program uses to store data 

Over 85% of data breaches were caused by a buffer overflow 

Stack: Reserved area of memory where the program saves the return address when a function call instruction is received 

"Smash the Stack": Occurs when an attacker fills up the buffer with NOP so that the return address may hit a NOP and continue on until it finds the attacker's code to run 

Address Space Layout Randomization: Method used by programmers to randomly arrange the different address spaces used by a program or process to prevent buffer overflow exploits 

TLDR: Buffer overflows attempt to put more data into memory than it is designed to hold 

## XSS and XSRF ## 

Cross-Site Scripting [XSS]: Occurs when an attacker embeds malicious scripting commands on a trusted website 

There are three types of XSS attacks: 
* Stored/Persistent: Attempts to get data provided by the attacker to be saved on the web server by the victim  
* Reflected: Attempts to have a non-persistent effect activated by a victim clicking on a link on the site  
* DOM-based: Attempt to exploit the victim's web browser  

Prevent XSS with output encoding and proper input validation 

Cross Site Request Forgery [XSRF/CSRF]: Occurs when an attacker forces a user to execute actions on a web server for which they are already authenticated 

Prevent XSRF with tokens, encryption, XML file scanning, and cookie verification 

## SQL Injection ## 

SQL Injection: Attack consisting of the insertion or injection of an SQL query via input data from the client to a web application 

Injection Attack: Insertion of additional information or code through data input from a client to an application 

SQL injection is the most common type of code injection attack 

SQL injection is prevented through input validation and using least privilege when accessing a database 

## XML Vulnerabilities ## 

XML data submitted without encryption or input validation is vulnerable to spoofing, request forgery, and injection of arbitrary code 

XML Bomb ["Billion Laughs Attack"]: XML encodes entities that expand to exponential sizes, consuming memory on the host and potentially crashing it 

XML External Entity [XXE]: An attack that embeds a request for a local resource 

To prevent XML vulnerabilities from being exploited, use proper input validation 

## Race Conditions ## 

A software vulnerability when the resulting outcome from execution processes is directly dependent on the order and timing of certain events, and those events fail to execute in the order and timing intended by the developer 

A race condition vulnerability is found where multiple threads are attempting to write a variable or object at the same memory location 

Dereferencing: A software vulnerability that occurs when the code attempts to remove the relationship between a pointer and the thing it points to 

Race conditions are difficult to detect and mitigate 

Race conditions can also be used against databases and file systems 

Time of Check to Time of Use [TOCTTOU]: The potential vulnerability that occurs when there is a change between when an app checked a resource and when the app used the resource 

Develop applications to not process things sequentially, if possible 

Implement a locking mechanism to provide app with exclusive access 

## Design Vulnerabilities ## 

Insecure components: Any code that is used or invoked outside the main program development process 
* Code reuse 
* Third-party library 
* Software Development Kit [SDK] 

Insufficient logging and monitoring: Any program that does not properly record or log detailed enough information for an analyst to perform their job 
* Logging and monitoring must support use case and answaer who, what, when, where, and how 

Weak or default configuration: Any program that uses ineffective credentials or configurations, or one in which the defaults have not been changed for security 
* Many applications choose to simply run as root or as a local admin 
* Permissions may be too permissive on files or directories due to weak configurations 

Best practice: utilize scripted installations and baseline configuration templates to secure applications during installation 