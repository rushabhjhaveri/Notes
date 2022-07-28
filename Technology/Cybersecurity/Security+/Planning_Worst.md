# Planning For The Worst # 

## Planning For The Worst ## 

Redundancy usually refers to when one has something extra or unnecessary 

Redundancy helps ensure fault-tolerance to continue operations 

Single Point of Failure: The individual elements, objects, or parts of a system that would cause the whole system to fail if they were to fail 

## Redundant Power ## 

Redundant Power Supply: An enclosure that provides two or more complete power supplies 

A redundant power supply mitigates a single point of failure 

Surge: An unexpected increase in the amount of voltage provided 

Spike: A short transient voltage that can be due to a short circuit, tripped circuit breaker, power outage, or lightning strike 

Sag: An unexpected decrease in the amount of voltage provided 

Brownout: Occurs when the voltage drops low enough that it typically causes the lights to dim and can cause a computer to shut off 

Blackout: Occurs when there is a total loss of power for a prolonged period 

## Backup Power ## 

Uninterruptible Power Supply [UPS]: Combines the functionality of a surge protector with that of a battery backup 

Backup Generator: An emergency power system used when there is an outage of the regular electric grid power 

## Data Redundancy ## 

Redundant Array of Independent Disks [RAID]: Allows the combination of multiple physical hard disks into a single logical hard disk drive that is recognized by the operating system 

RAID 0:? Provide data striping across multiple disks to increase performance 

RAID 1: Provides redundancy by mirroring the data identically on two hard disks 

RAID 5: Provides redundancy by striping data and parity data across the disk drives 

RAID 6: Provides redundancy by striping and double parity data across the disk drives 

RAID 10: Creates a striped RAID of two mirrored RAIDs [combines RAID 1 and RAID 0] 

Fault-Resistant RAID: Protects against the loss of the array's data if a single disk fails [RAID 1 or RAID 5] 

Fault-Tolerant RAID: Protects against the loss of the array's data if a single component fails [RAID 1, RAID 5, RAID 6] 

Disaster-Tolerant RAID: Provides two independent zones with full access to the data [RAID 10] 

RAIDs provide redundancy and high-availability 

## Network Redundancy ## 

Focused on ensuring that the network remains up 

## Server Redundancy ## 

Cluster: Two or more servers working together to perform a particular job function 

Failover Cluster: A secondary server can take over the function when the primary one fails 

Load-Balancing Cluster: Servers are clustered in order to share resources such as CPU, RAM, and hard disks 

## Redundant Sites ## 

Hot Site: A near duplicate of the original site of the organization that can be up and running within minutes 

Warm Site: A site that has computers, phones, and servers, but they might require some configuration before users can start working 

Cold Site: A site that has tables, chairs, bathrooms, and possibly some technical items like phones and network cabling 

## Data Backup ## 

Maintaining a good backup is critical to disaster recovery 

Full Backup: All the contents of the drive are backed up 

Incremental Backup: Only conducts a backups of the contents of a drive that have changed since the last full or incremental backup 

Differential backups take more time to create but less time to restore 

## Tape Rotation ## 

10 Tape Rotation: Each tape is used once per day for two weeks and then the entire set is reused 

Grandfather-Father-Son: Three sets of backup tapes, defined as the son [daily], father [weekly], and grandfather [monthly] 

Towers of Hanoi: Three sets of backup tapes [like the Grandfather-Father-Son], rotated in a more complex system 

Snapshot Backup: Type of backup primarily used to capture the entire operating system image, including all applications and data 

Snapshots are also commonly used with virtualized systems 

## Disaster Recovery Plan ## 

Disaster Recovery Planning: The development of an organized and in-depth plan for problems that could affect the access of data or the organization's building 

Disaster Recovery Plan [DRP] should be written down 

## Business Impact Analysis ## 

Business Impact Analysis [BIA]: A systematic activity that identifies organizational risks and determines their effect on ongoing, mission-critical operations 

Business impact analysis is governed by metrics that express system availability 

Maximum Tolerable Downtime [MTD]: The longest period of time a business can be inoperable without causing irrevocable business failure 

Each business process can have its own MTD, such as a range of minutes to hours for critical functions, 24 hours for urgent functions, or up to seven days for normal functions 

MTD sets the upper limit on the recovery time that the system and asset owners need to resume operations 

Recovery Time Objective [RTO]: The length of time it takes after an event for normal business operations and activities to resume 

Work Recovery Time [WRT]: The length of time in addition to the RTO of individual systems to perform reintegration and testing of a restored or upgraded system following an event 

Recovery Point Objective [RPO]: The longest period of time that an organization can tolerate lost data being unrecoverable 

Recovery Point Objective [RPO] is focused on how long one can be without their data 

MTD and RPO help to determine which business functions are critical and to specify appropriate risk countermeasures 

Designing disaster recovery and continuity of operations plans requires an understanding of availability and reliability levels 

Disasters can be caused by internal or external forces 

Mean Time to Repair [MTTR]: Measures the average time it takes to repair a network device when it breaks 