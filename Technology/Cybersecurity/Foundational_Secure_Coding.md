OWASP - Open Web Application Security Project 

## The OWASP Top 10 ##  
* List of common web application security vulnerability categories 
* Provides education and awareness to software developers
* First version created 2003 
* Most recent version -- 2017 

### Injection ### 
* Code == Data == Commands 
* Code is very powerful, but can be used for unwanted purposes 
* How injection works: 
    * On a high level, in general, code is fed to an interpreter, which interprets the code and runs the program 
    * Up to interpreter to figure out which pieces of code are commands, and which are data 
    * Injection essentially is using code that is used to specify data to instead specify commands 
    * Code intended as data is instead specified as commands, resulting in the application acting in unintended ways
    * The security principle/concept of access control is being violated here
* Injection attacks can lead to data exposure, loss of data integrity, or even data deletion 

### Broken Authentication ### 
* Covers two categories of attacks: those concerning authentication, and also those concerning session management 
* One of the easiest way to hack an account - social engineering 
* Automated attacks 
    * Credential stuffing 
    * Brute-force attacks
* Prevention techniques for such attacks: 
    * Limit the number of login attempts / enforce a cool-down period / lock user out for specified amount of time, have them call in
    * MFA 
* Broken Application Logic 

### Sensitive Data Exposure ### 
* Data classification according to type to be better protected 
* Only collect data you absolutely need 

### XML External Entries [XXE] ### 
* Subcategory of injection 
* How it works: 
    * XML: document format used to communicate information between computer systems
        * Pro: XML is both human readable and machine readable 
        * Frequently used between applications so they can communicate with each other
    * When XML is sent to an application, an _XML Processor_ reads and interprets the data
    * When an application accepts XML data from an _untrusted source_, an XXE attack can occur 
        * Similar to injection, when this happens, it can cause the application interpreting the malicious code to act in unintended ways
* One such example of the type of impact an XXE attack can have on an application: Denial of Service [DoS]
    * Result of a DoS attack: application no longer functions
    * DoS floods application with so much input that it ultimately just cannot handle it and fails over
* Example attacks: billion laughs, XML bombs 

### Broken Access Control ### 
* Insecure Direct Object References
    * Direct reference to a given resource, but the system does not check to make sure that the user has the requisite permissions/privileges to access said resource 
* Missing Function Level Access Control 
    * Applications should ensure access rights are correct and confirmed prior to granting access to specific restricted functions 

### Security Misconfiguration ### 
* Application components have specific configurations and settings; insecure configurations can be exploited by hackers to attack the application 
* Least Privilege
    * Fundamental security principle 
    * Access to any particular data, function, or resource should be limited to those who only need access
    * Allow additional access as needed on a case-by-case basis 
* Software Development Life Cycle
    * When ready for release, debugging and testing features should be turned off or configured securely
    * Example: Error handling
* Default Passwords 

### Cross-Site Scripting [XSS] ### 
* Execution of malicious commands coming from untrusted data 
* Usually affects users' browsers 
* Improper user input validation can potentially result in bad code being executed and result in the application being compromised 

### Insecure Deserialization ### 
* Serialization and Deserialization
    * Serialization: taking a digital object and transforming it into a data/format that is easy to store and transfer 
    * Deserialization: the opposite; taking that transformed data and rebuilding the digital object
* There is potential for data to be stolen/replaced with malicious content either during transit or while in storage
* This causes the application to behave unintendedly, as the replaced malicious data affects the application

### Using Components with Known Vulnerabilities ### 
* Software has bugs 
* Some is patchable/patched, some are not patchable/patched
* Hackers can take advantage of software not being patched quickly enough, if ever
* Software also depends on other software, which results in a whole host of other potential issues 

### Insufficient Logging and Monitoring ### 
* Not a matter of _if_ application will be attacked, but _when_ 
* Logging
    * Recording what happened 
    * Keeps track of important things like logins and other transactions
    * More importantly, application logs should keep track of failures, such as access control failures and input validation failures 
    * Quicker detection of suspicious/malicious activity, and can ensure prevention measures are taken expediently 
* Monitoring
    * Logs should be actively monitored 
    * Robust incident response 
* These two actions help in being proactive, rather than reactive  

### Conclusion ### 
* Regular penetration testing should be done to actively identify vulnerabilities 