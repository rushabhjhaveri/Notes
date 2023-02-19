# Route 53 # 

## Route 53 - TTL ## 

High TTL: less traffic on R53, but possibly outdated records 

Low TTL: more traffic on R53, but records are outdated for less time; easier to change records  

Except for Alias records, TTL is mandatory for each DNS record 

## CNAME vs Alias ## 

AWS resources [LB/CloudFront] expose an AWS hostname 

CNAME: 
* Points a hostname to any other hostname 
* Only for non-root domain 

Alias: 
* Points a hostname to an AWS resource 
* Works for root domain as well as non-root domains 