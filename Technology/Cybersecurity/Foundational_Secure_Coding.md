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

## OWASP Top 10 - Changes from 2013 to 2017 ## 
* XML External Entries [XXE] is new to the OWASP Top 10. The injection type has become a significant enough risk to be identified individually 
* Broken Access Control was created by merging Insecure Direct Object Regerence and Missing Function Level Access Control -- both bery prevalent and major risks even today 
* Insecure Deserialization is a new addition to the list; it too is another type of injection that has risen in popularity and risk posed recently 
* Insufficient Logging and Monitoring is another new addition to the list; it is not a vulnerability in itself, rather, the lack of logging and monitoring presents a serious risk. Detecting breaches, responding to incidents, and digital forensics become exceedingly challenging without proper logging and monitoring. 
* Cross-Site Request Forgery [CSRF] has been dropped from the top ten list because these kinds of vulnerabilities are not as prevalent as they used to be due to protections built into modern web application frameworks. It's still an important topic to know though, and the risk must still be addressed within applications. 
* Unvalidated Redirects and Forwards has also been dropped from the list as modern applications use the redirect pattern far less frequently than their past counterparts, resulting in less prevalence of this vulnerability. However, it is still critical to understand this vulnerability, as it helps understand the risk posed by using redirects, and what to do if your application must include them.  

## Deep Dive into the OWASP Top 10 ## 

### Injection ### 

* Common defences againt injection attacks
    * Whitelist untrusted data 
        * Think about what input is trusted
        * Does input adhere to expected patterns
    * Parameterize SQL statements
        * Separate query from input data
        * Type cast each parameter
    * Finetune DB permissions
        * Segment accounts for admin and public 
        * Apply principle of least privilege
* IRL Injection Example: Sony Hack

### Broken Authentication and Session Management ### 
* Average exploitability, widespread prevalance, average detectability, severe technical impact
* Various ways a session can be hijacked/broken auth/session can be exploited: 
    * Auth Cookie Theft
        * Exploit an XSS risk
        * Retrieve it from victim's PC
        * Sniff it over an insecure connection 
    * Session ID Theft 
        * Copy and paste a URL with it
        * Retrieve it from an [insecure] log
        * Send it via an insecure email 
    * Account Management Hack
        * Brute force the login
        * Exploit password reset
        * Discover weak credentials 
* Common defences against broken authentication attacks
    * Protect the cookies
        * Use the HttpOnly flag
        * Make sure cookies are flagged as "secure" 
    * Decrease the window of risk 
        * Expire sessions quickly 
        * Re-challenge user on key actions
    * Harden account management
        * Allow [and encourage] strong passwords 
        * Implement login rate limiting and lockouts
* IRL Broken Auth Example: Apple Hack 

### Cross-Site Scripting [XSS] ### 
* Average exploitability, very widespread prevalence, easily detected, moderate technical impact  
* Common defences against XSS attacks: 
    * Whitelist untrusted data
        * What input is trusted
        *  Does input adhere to expected patterns 
    * Always encode output 
        * Never simply reflect untrusted data
        * This applies to data in DB too 
    * Encode for context 
        * HTML/attributes/JS/CSS
        * Wrong encoding in wrong context is useless 
* IRL XSS Example: Samy's MySpace Hack 

### Insecure Direct Object References ### 
* Easy exploitability, common prevalence, easily detectable, moderate technical impact 
* Common defences against direct reference attacks: 
    * Implement access controls
        * Be explicit about who can access resources 
        * Expect rules to be tested by malicious actors
    * Use indirect maps
        * Don't expose internal keys externally 
        * Map them to temporary ones
    * Avoid predictable keys
        * Incrementing integers are enumerable 
        * Natural keys are discoverable 
* IRL Indirect Object Reference Example: Citigroup Hack 

### Security Misconfiguration ### 
* Easy exploitability, common prevalence, easily detectable, moderate technical impact 
* Common defences against security misconfiguration attacks:
    * Always harden the install 
        * Turn off features that aren't needed 
        * Apply principle of least privilege 
    * Tune the app security config 
        * Ensure its production-ready
        * Defaults are often not right 
    * Ensure packages are up to date 
        * Be conscious of 3rd-party tool risks 
        * Have a strategy to monitor and update 
* IRL Security Misconfiguration Example: ELMAH 

### Sensitive Data Exposure ### 
* Difficult exploitability, uncommon prevalence, average detectability, severe technical impact 
* Various forms of sensitive data exposure: 
    * Insufficient use of SSL
        * Login not loaded over HTTPS 
        * Mixed mode 
        * Cookies not sent securely 
    * Bad crytography 
        * Incorrect password storage 
        * Weak algorithms chosen 
        * Poor protection of keys 
    * Other exposure risks 
        * Browser autocomplete 
        * Leaked via logs 
        * Disclosure via URL 
* Common defences against senstive data exposure: 
    * Minimize sensitive data collection 
        * You can't lose what you don't have 
        * Reduce window of storage 
    * Apply HTTPS everywhere 
        * It's too easy to "insufficiently" implement 
        * Start with it everywhere - it's easy 
    * Use strong cryptographic storage 
        * Hashing algorithms designed for passwords 
        * Be very careful with key management 
* IRL Sensitive Data Exposure Example: Tunisia Logins Theft 

### Missing Function Level Access Control ### 
* Easy exploitability, common prevalence, average detectability, moderate technical impact 
* Common defences against missing function level access control: 
    * Define a clear authorization model 
        * Define centrally and consistently 
        * Use roles and apply membership  
    * Check for forced browsing 
        * Check for default framework resources 
        * Automated scanners are excellent for this 
    * Always test unprivileged roles 
        * Capture and replay privileged requests 
        * Include POST requests and async calls 
* IRL Missing Function Level Access Control Example: Westfield iPhone App Fiasco 

### Cross-Site Request Forgery [CSRF] ### 
* Average exploitability, common prevalence, easily detectable, moderate technical impact 
* Common defences against CSRF attacks: 
    * Employ anti-forgery tokens 
        * CSRF is exploited by predictable patterns 
        * Tokens add randomness to the request 
    * Validate the referrer 
        * Valid requests don't originate externally 
        * The referrer is in each request header 
    * Other defences 
        * Native browser defences 
        * Fraud detection patterns 
* IRL CSRF Example: Brazilian Modems 

### Using Components With Known Vulnerabilities ### 
* Average exploitability, widespread prevalence, difficult to detect, moderate technical impact 
* Common defences for this attack: 
    * Identify components and versions 
        * Components are often used haphazardly 
        * Keep track of components and versions  
    * Components should be monitored 
        * Keep abreast of project updates 
        * Monitor common vulnerabilities and exploitabilities [CVE's] impacting the components 
    * Keep components updated 
        * Use the framework's package management 
        * Regularly monitor new releases 
* IRL Example: WordPress Brute Force 

### Unvalidated Redirects and Forwards ### 
* Average exploitability, uncommon prevalence, easily detectable, moderate technical impact 
* Common defences for this kind of attack: 
    * Use a URL whitelist 
        * What URL's are allowed to be redirected to 
        * Abort if the URL is not allowed  
    * Use indirect references 
        * Pass an ID to the redirect, not a URL 
        * Resolve the URL from a reference map 
    * Check the referrer 
        * Did the redirect originate from the site 
        * May need to whitelist multiple sites 
* IRL Example: Government Websites 