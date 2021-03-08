# Route 53 # 

## DNS 101 ## 
Using the internet implies the use of DNS 

DNS is used to convert human-friendly domain names [e.g., https://amazon.com] into an Internet Protocol [IP] address [e.g., https://82.124.53.1] 

IP addresses are used by computers to identify each other on the network 

IP addresses commonly come in two different forms: IPv4 and IPv6 

IPv4 addresses are running out - 
* The IPv4 space is a 32-bit field and has over four billion different addresses [4,294,967,296 to be precise] 
* IPv6 was created to solve this depletion issue and has an address space of 128 bits which in theory, is 30,282,366,920,938,463,463,374,607,431,768,211,456 addresses, or 340 undecillion addresses 

Top Level Domains: The last word in a domain name represents the "top level domain" [.com, .edu, .gov]

The second word in a domain name is known as a second level domain [optional, and depends on the domain name] [.co.uk, .rutgers.edu] 

These top level domain names are controlled by the Internet Assigned Numbers Authority [IANA] in a root zone database [essentially, a database of all available top level domains] 

Can view the database by visiting https://www.iana.org/domains/root/db 

Domain registrars: because all of the names in a given domain name have to be unique, there needs to be a way to organize this all so domains aren't duplicated - enter domain registrars 
* A registrar is an authority that can assign domain names directly under one or more top level domains 
* These domains are registered with InterNIC, a service of ICANN, which enforces uniqueness of domain names across the internet 
* Each domain name becomes registered in a central database known as the WhoIS database 
* Popular domain registrars include Amazon, GoDaddy, etc. 

Start of Authority Record [SOA]: stores information about: 
* The name of the server that supplied the data for the zone 
* The administrator of the zone 
* The current version of the data file 
* The default number of seconds for the TTL file on resource records 

NS Records [stands for Name Server Records]: They are used by top level domain servers to direct traffic to the content DNS server which contains the authoritative DNS records 

A Record: the fundamental type of DNS record 
* The "A" in A record stands for "Address" 
* The A record is used by a computer to translate the name of the domain to an IP address 

TTL: the length that a DNS record is cached on either the Resolving Server or the users own local PC is equal to the value of the TTL in seconds - the lower the TTL, the faster changes to DNS records take to propagate throughout the internet 

CName: A Canonical Name [CName] can be used to resolve one domain name to another 
* For example, for a mobile website with the domain name https://m.websitename.com that is used for when users browse to the application's domain name on their mobile devices, it may be desired that https://mobile.website.com also resolves to the same address 

Alias Records: used to map resource record sets in a hosted zone to Elastic Load Balancers, CloudFront distributions, or S3 buckets that are configured as websites 
* Alias records work like a CName record in that one can map one DNS name [www.websitename.com] to another target DNS name [elbname.elb.amazonaws.com] 
* Key difference: A CName cannot be used for naked domain names [zone apex record] - can't have a CName for https://acloud.guru; it must be either an A record or an alias 

ELBs do not have a pre-defined IPv4 address - must resolve to them using a DNS name 

Given the choice, choose Alias record over CName 

Common DNS types: 
* SOA records 
* NS records 
* A records 
* CNames 
* MX records 
* PTR records 

Can buy domain names directly with AWS 

Can take up to three days to register depending on the circumstances 

Routhing policies available on AWS: 
* Simple routing 
    * Can only have one record with multiple IP addresses 
    * If multiple values are specified in a record, R53 returns all values to the user in a random order 
* Weighted routing 
    * Allows to split traffic based on different weights assigned 
    * E.g., can set 10% of traffic to go to us-east-1 and 90% to go to us-west-1 
* Latency-based routing 
    * Allows to route traffic based on the lowest network latency for the end user [i.e., which region will give them the fastest response time] 
    * To use latency-based routing, create a latency resource record set for the EC or ELB resource in each region that hosts the application 
    * When R53 receives a query for the site/application, it selects the latency resource record set for the region that gives the user the lowest latency 
    * R53 then responds with the value associated with that resource record set 
* Failover routing 
    * Used when want to create an active/passive setup 
    * E.g., may want primary site to be eu-west-2 and secondary DR site in ap-southeast-2 
    * R53 will monitor the health of primary site using a health check 
    * A health check monitors the health of endpoints 
* Geolocation routing 
    * Lets one choose where the traffic will be sent based on the geographic location of users [i.e., the location from which DNS queries originate] 
    * E.g., may want all queries from Europe to be routed to a fleet of EC2 instances that are specifically configured for European customers 
        * These servers may have the local language of European customers and all prices displayed in Euros
* Geoproximity routing [traffic flow only] 
    * Lets R53 route traffic to resources based on the geographic location of users and resources 
    * Can optionally choose to route more traffic or less to a given resource by specifying a value, known as a bias 
    * A bias expands or shrinks the size of a geographic region from which traffic is routed to a resource 
    * To use geoproximity routing, must use R53 traffic flow 
* Multivalue Answer routing 
    * Lets one configure R53 to return multiple values, such as IP addresses for web servers, in reponse to DNS queries 
    * Can specify multiple values for almost any record, but multivalue answer routing also lets one check the health of each resource, so R53 returns only values for healthy resources 
    * Is similar to simple routing, however, it allows one to put health checks on each record set 