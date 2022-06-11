# Authentication # 

## Authentication ## 

Multi-factor Authentication: Use of two or more authentication factors to prove a user's identity 

Username and password are only considered single-factor authentication 

One-Time Password 

Time-Based One Time Password [TOTP]: A password is computed from a shared secret and current time 

HMAC-Based One Time Password [HOTP]: A password is computed from a shared secret and is synchronized between the client and the server 

## Authentication Models ## 

Context-Aware Authentication: Process to check the user's or system's attributes or characteristics prior to allowing it to connect 

Restrict authentication based on the time of day or location 

Single Sign-On [SSO]: A default user profile for each user is created and linked with all of the resources needed 

Compromised SSO credentials cause a big breach in security 

Federated Identity Management [FIdM]: A single identity is created for a user and shared with all of the organizations in a federation 
* Cross-Certification: Utilizes a web of trust between organizations where each one certifies others in the federation 
* Trusted Third-Party: Organizations are able to place their trust in a single third-party [also called the bridge model] 

Trusted Third-Party model is more efficient than a cross-certification or web of trust model 

Security Assertion Markup Language [SAML]: Attestation model built upon XML used to share federated identity management information between systems 

OpenID: An open standard and decentralized protocol that is used to authenticate users in a federated identity management system 

User logs into an Identity Provider [IP] and uses their account at Relying Parties [RP] 

OpenID is easier to implement than SAML 

SAML is more efficient than OpenID 