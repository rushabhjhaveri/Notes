# Network Design # 

## Network Security ## 

## The OSI Model ## 

OSI Model: Used to explain network communications between a host and a remote device over a LAN or WAN 

Layers [bottom to top]: 
* Physical 
* Data Link 
* Network 
* Transport 
* Session 
* Presentation 
* Application 

Physical Layer: Represents the actual network cables and radio waves used to carry data over a network [data described in the form of bits] 

Data Link Layer: Describes how a connection is established, maintained, and transferred over the physical layer and uses physical addressing [MAC addresses] [data described in the form of frames] 

Network Layer: Uses logical address to route or switch information between hosts, the networks, and the internetworks [data described in the form of packets] 

Transport Layer: Manages and ensures transmission of the packets occurs from a host to a destination using either TCP or UDP [data described in the form of segments [TCP] or datagrams [UDP]] 

Session Layer: Manages the establishment, termination, and synchronization of a session over the network 

Presentation Layer: Translates the information into a format that the sender and receiver both understand 

Application Layer: Layer from which the message is created, formed, and originated [consists of high-level protocols like HTTP, SMTP, FTP, etc.] 

## Switches ## 

Switches are the combined evolution of hubs and bridges 

MAC Flooding: Attempt to overwhelm the limited switch memory set aside to store the MAC address for each port 

Switches can fail-open when flooded and begin to act like a hub 

MAC Spoofing: Occurs when an attacker masks their own MAC address to pretend they have the MAC address of another device 

MAC spoofing is often combined with an ARP [Address Resolution Protocol] spoofing attack 

Tips to prevent MAC spoofing: 
* Limit static MAC addresses accepted 
* Limit duration of time for ARP entry on hosts 
* Conduct ARP inspection 

Physical Tampering: Occurs when an attacker attempts to get physical access 

## Routers ## 

Routers operate at layer 3 

Routers: Used to connect two or more networks to form an internetwork 

Routers rely on a packet's IP addresses to determine the proper destination 

Once on the network, it conducts an ARP request to find final destination 

Access Control List [ACL]: An ordered set of rules that a router uses to decide whether to permit or deny traffic based upon given characteristics 

IP Spoofing is used to trick a router's ACL 

## Network Zones ## 

Any traffic wished to be kept confidential when crossing the internet should use a VPN 

Demilitarized Zone [DMZ]: Focused on providing controlled access to publicly available servers that are hosted within one's organizational network 

Subzones can be created to provide additional protection for some servers 

Extranet: Specialized type of DMZ that is created for partner organizations to access over a wide area network 

Intranets are used when only one company is involved 

## Jumpbox ## 

Internet-Facing Host: Any host that accepts inbound connections from the internet 

DMZ: A segment isolated from the rest of a private network by one or more firewalls that accepts connections from the Internet over designated ports 

Everything behind the DMZ is invisible to the outside network 

Bastion Hosts: Hosts or servers in the DMZ which are not configured with any services that run on the local network 

To configure devices in the DMZ, a jumpbox is utilized 

Jumpbox: A hardened server that provides access to other hosts within the DMZ 

An administrator connects to the jumpbox, and the jumpbox connects to hosts in the DMZ 

The jumpbox and the management workstation should only have the minimum required software to perform their job and be well-hardened 

## Network Access Control ## 

Network Access Control [NAC]: Security technique in which devices are scanned to determine its current state prior to being allowed access onto a given network 

If a device fails the inspection, it is placed into digital quarantine 

Persistent Agents: A piece of software that is installed on the device requesting access to the network 

Non-Persistent Agents: Uses a piece of software that scans the device remotely or is installed and subsequently removed after the scan 

NAC can be used as a hardware or software solution 

IEEE 802.1x standard is used in port-based NAC 

## VLANs ## 

VLANs are implemented to: 
* Segment the network 
* Reduce collisions 
* Organize the network 
* Boost performance 
* Increase security 

Switch Spoofing: Attacker configures their device to pretend its a switch and uses it to negotiate a trunk link to break out of the VLAN 

Double Tagging: Attacker adds an additional VLAN tag to create an outer and an inner tag 

Prevent double tagging by moving all ports out of the default VLAN group 

## Subnetting ## 

Subnetting: Act of creating subnetworks logically through the manipulation of IP addresses 

Benefits of subnetting: 
* Compartmentalized network 
* Efficient use of IP addresses 
* Reduced broadcast traffic 
* Reduced collisions 

Subnets' policies and monitoring can aid in the security of one's network 

## Network Address Translation ## 

Network Address Translation [NAT]: Process of changing an IP address while it transits across a router 

Using NAT can help hide network IPs 

Port Address Translation [PAT]: Router keeps track of requests from internal hosts by assiging them random high number ports for each request 

Private IP Addresses: 
* Class A: 10.0.0.0 - 10.255.255.255 
* Class B: 172.16.0.0 - 172.31.255.255 
* Class C: 192.168.0.0 - 192.168.255.255 

## Telephony ## 

Telephony: Term used to describe devices that provide voice communication to users 

Modem: A device that could modulate digital information into an analog signal for transmission over a standard dial-up phone line 

War Dialing: When an attacker starts dialing random phone numbers to see if a modem would pick up on the other side 

Protect dial-up resources by using the callback feature 

Public Branch Exchange [PBX]: Internal phone system used in large organizations 

Voice Over Internet Protocol [VoIP]: Digital phone service provided by software or hardware devices over a data network 

Quality of Service [QoS] 