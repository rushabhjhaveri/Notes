# Facilities Security # 

## Facilities Security ## 

## Fire Suppression ## 

Fire Suppression: Process of controlling and/or extinguishing fires to protect an organization's employees, data, equipment, and buildings 

Wet Pipe Sprinkler System: Pipes are filled with water all the way to the sprinkler head and are just waiting for the bulb to be melted or broken 

Dry Pipe Sprinkler System: Pipes are filled with pressurized air and only push water into the pipes when needed to combat the fire 

A pre-action sprinkler system will activate when heat or smoke is detected 

Clean Agent System: Fire suppression system that relies upon gas [HALON, FM-200, or CO2] instead of water to extinguish a fire 

## HVAC ## 

Humidity should be kept around 40% 

HVAC systems may be connected to ICS and SCADA networks 

## Shielding ## 

Shielded Twisted Pair [STP] adds a layer of shielding inside the cable 

Faraday Cage: Shielding installed around an entire room that prevents electromagnetic energy and radio frequencies from entering or leaving the room 

TEMPEST: U.S. Government standards for the level of shielding required in a building to ensure emissions and interference cannot enter or exit the facility 

TEMPEST facilities are also resistant to EMPs [electromagnetic pulses] 

## Vehicular Vulnerabilities ## 

Vehicles connect numerous subsystems over a controller area network [CAN] 

Controller Area Network [CAN]: A digital serial data communications network used within vehicles 

The primary external interface is the Onboard Diagnostics [OBD-II] module 

No concept of source addressing or message authentication in a CAN bus 

Methods of exploitation: 
* Attach the exploit to the OBD-II 
* Exploit over onboard cellular 
* Exploit over onboard Wi-Fi 

## IoT Vulnerabilities ## 

Internet of Things [IoT]: A group of objects [electronic or not] that are connected to the wider Internet by using embedded electronic components 

Most smart devices use an embedded version of linux or android as their OS 

Devices must be secured and updated when new vulnerabilities are found 

## Embedded System Vulnerabilities ## 

Embedded Systems: A computer system that is designed to perform a specific, dedicated, function 

Embedded systems are considered static environments where frequent changes are not made or allowed 

Embedded systems have very little support for identifying and correcting security issues 

Programmable Logic Controller [PLC]: A type of computer designed for deployment in an industrial or outdoor setting that can automate and monitor mechanical systems 

PLC firmware can be patched and reprogrammed to fix vulnerabilities 

System-on-Chip [SoC]: A processor that integrates the platform functionality of multiple logic controllers onto a single chip 

SoC are power efficient and used with embedded systems 

Real-Time Operating System [RTOS]: A type of OS that prioritizes deterministic execution of operations to ensure consistent response for time-critical tasks 

Embedded systems typically cannot tolerate reboots or crashes, and must have response times that are predictable to within microsecond tolerances 

Field Programmable Gate Array [FPGA]: A processor that can be programmed to perform a specific function by a customer rather than at the time of manufacture 

End customer can configure the programming logic to run a specific application instead of using an ASIC [Application-Specific Integrated Circuit] 

## ICS and SCADA Vulnerabilities ## 

Operational Technology [OT]: A communications network designed to implement an industrial control system rather than data networking  

Industrial systems prioritize availability and integrity over confidentiality 

Industrial Control Systems [ICS]: A network that manages embedded devices 

ICS is used for electrical power stations, water suppliers, health services, telecommunications, manufacturing, and defense needs 

FieldBus: Digital serial data communications used in operational technology networks to link PLCs 

Human Machine Interface [HMI]: Input and output controls on a PLC to allow a user to configure and monitor the system 

ICS manages the process automation by linking together PLCs using a fieldbus to make changes in the physical world [values, motors, etc.] 

Data Historian: Software that aggregates and catalogs data from multiple sources within an ICS 

Supervisory Control and Data Acquisition [SCADA]: A type of ICS that manages large-scale, multiple-site devices and equipment spread over a geographic region 

SCADA typically run as software on ordinary computers to gather data from and manage plant devices and equipment with embedded PLCs 

Modbus: A communications protocol used in operational technology networks 

Modbus gives control servers and SCADA hosts the ability to query and change the configuration of each PLC 

## Mitigating Vulnerabilities ## 

Four key controls for mitigating vulnerabilities in specialized systems: 
* Establish administrative control over Operational Technology networks by recruiting staff with relevant expertise 
* Implemment tthe minimum network links by disabling unnecessary links, services, and protocols 
* Develop and test a patch management program for Operational Technology networks 
* Perform regular audits of logical and physical access to systems to detect possible vulnerabilities and intrusions 

Warning: Enumeration tools and vulnerability scanners can cause problems on Operational Technology networks 

## Premise System Vulnerabilities ## 

Premise Systems: Systems used for building automation and physical access security 

Many system designs allow the monitoring to be accessible from the corporate data network or even directly from the internet 

Building Automation System [BAS]: Components and protocols that facilitate the centralized configuration and monitoring of mechanical and electrical systems within offices and data centers 

Process and memory vulnerabilities in PLC 

Plaintext credentials or keys in application code 

Code injection via web user interface 

Denial of Service conditions could be caused by affecting building automation systems like HVAC 

Physical Access Control System [PACS]: Components and protocols that facilitate the centralized configuration and monitoring of security mechanisms within offices and data centers 

PACS can either be implemented as part of a building automation system or a separate system 

Warning: PACS are often installed and maintained by an external supplier and are therefore omitted from risk and vulnerability assessments by analysts 