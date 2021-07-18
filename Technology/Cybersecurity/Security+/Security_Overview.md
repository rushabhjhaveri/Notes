# Overview of Security # 

Information Security: Act of protecting data and information from unauthorized access, unlawful modification and disruption, disclosure, corruption, and destruction 

Information Systems Security: Act of protecting the systems that hold and process critical data 

## CIA Triad ## 

Confidentiality: Information has not been disclosed to unauthorized people 

Integrity: Information has not been modified or altered without proper authorization 

Availability: Information is able to be stored, accessed, or protected at all times 

## AAA of Security ## 

Authentication: When a person's identity is established with proof and confirmed by a system 

Authorization: Occurs when a user is given access to a certain piece of data or certain areas of a building 

Accounting: Tracking of data, computer usage, and network resources 

Non-repudiation occurs when one has proof that someone has taken an action 

## Security Threats ## 

Malware: Short-hand for malicious software 

Unauthorized Access: Occurs when access to computer resources and data happens without the consent of the owner 

System Failure: Occurs when a computer crashes or an individual application fails 

Social Engineering: Act of manipulating users into revealing confidential information or performing other detrimental actions 

## Mitigating Threats ## 

Physical Controls: Alarm systems, locks, surveillance cameras, identification cards, security guards, etc. 

Technical Controls: Smart cards, encryption, access control lists [ACLs], intrusion detection systems, and network authentication 

Administrative Controls: Policies, procedures, security awareness training, contingency planning, and disaster recovery plans -- further broken down into Legal Controls and Procedural Controls 

## Hackers ## 

White Hats: Non-malicious hackers who attempt to break into a company's systems at their request 

Black Hats: Malicious hackers who break into computer systems and networks without authorization or permission 

Gray Hats: Hackers without any affiliation to a company that attempts to break into a company's network but risks the law by doing so 

Blue Hats: Hackers who attempt to hack into a network with permission of the company but are not employed by the company 

Elite: Hackers who find and exploit vulnerabilities before anyone else does 

## Threat Actors ## 

Script Kiddies: Hackers with little to no skill who only use the tools and exploits written by others 

Hacktivists: Hackers who are driven by a cause like social change, political agendas, or terrorism 

Organized Crime: Hackers who are part of a crime group that is well-funded and highly sophisticated 

Advanced Persistent Threats: Highly trained and funded group of hackers [often by nation states] with covert and open-source intelligence at their disposal 

## Threat Intelligence & Sources ## 

Must consider the sources of one's intelligence 

Timeliness: Property of an intelligence source that ensures it is up-to-date 

Relevancy: Property of an intelligence source that ensures it matches the use cases intended for it 

Accuracy: Property of an intelligence source that ensures it produces effective results 

Confidence Levels: Property of an intelligence source that ensures it produces qualified statements about reliability 

The MISP Project codifies the use of the admiralty scale for grading data and estimative language 

Proprietary: Threat intelligence is very widely provided as a commercial service offering, where access to updates and research is subject to a subscription fee 

Closed-Source: Data that is derived from the provider's own research and analysis efforts, such as data from honeynets that they operate, plus information mined from its customers' systems, suitably anonymized 

Open-Source: Data that is available to use without subscription, which may include threat feeds similar to the commercial providers, and may contain reputation lists and malware signature databases 
* US-CERT 
* UK's NCSC 
* AT&T Security [OTX] 
* MISP 
* VirusTotal 
* Spamhaus 
* SANS ISC Suspicious Domains 

Threat feeds are a form of explicit knowledge, but implicit knowledge from experienced practitioners is also useful 

Open-Source Intelligence [OSINT]: Methods of obtaining information about a person or organization through public records, websites, and social media 

## Threat Hunting ## 

Threat Hunting: A cybersecurity technique designed to detect presence of threats that have not been discovered by normal security monitoring 

Threat hunting is potentially less disruptive than penetration testing 

Establishing a Hypothesis: A hypothesis is derived from the threat modeling and is based on potential events with higher likelihood and higher impact 

Profiling Threat Actors & Activities: Involves the creation of scenarios that show how a prospective attacker might attemtpt an intrusion and what their objectives might be 

Threat hunting relies on the use of tools developed for regular security monitoring and incident response 

Need to assume that these existing rules have failed when threat hunting 

Threat hunting consumes a lot of resources and time to conduct, but can yield a lot of benefits 
* Improve detection capabilities 
* Integrate intelligence 
* Reduce attack surface 
* Block attack vectors 
* Identify critical assets 

## Attack Frameworks ## 

Kill Chain: A model developed for Lockheed Martin that describes the stages by which a threat actor progresses a network intrusion 
* Reconnaissance: The attacker determines what methods to use to complete the phases of the attack 
* Weaponization: The attacker couples payload code that will enable access with exploit code that will use a vulnerability to execute on the target system 
* Delivery: The attacker identifies a vector by which to transmit the weaponized code to the target environment 
* Exploitation: The weaponized code is executed on the target by this mechanism 
* Installation: This mechanism enables the weaponized code to run a remote access tool and achieve persistence on the target system 
* Command & Control [C2]: The weaponized code establishes an outbound channel to a remote server that can then be used to control the remote access tool and possibly download additional tools to progress the attack 
* Actions on Objectives: The attacker typically uses the access they have achived to covertly collect information from target systems and transfer it to a remote system [data exfiltration] or achieve other goals and motives 

Kill chain analysis can be used to identify a defensive course-of-action matrix to counter the progress of an attack at each stage 

MITRE ATT&CK Framework: A knowledgebase maintained by the MITRE Corporation for listing and explaining specific adversary tactics, techniques, and common knowledge or procedures 

The pre-ATT&CK tactics matrix aligns to the reconnaissance and weaponization phases of the kill chain 

Diamond Model of Intrusion Analysis: A framework for analyzing cybersecurity incidents and intrusions by exploring the relationships between four core features: adversary, capability, infrastructure, and victim 

These models can be used individually or combined 