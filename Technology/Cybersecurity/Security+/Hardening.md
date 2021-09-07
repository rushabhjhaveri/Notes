# Hardening # 

## Hardening ## 

Hardening: Act of configuring an operating system securely by updating it, creating rules and policies to govern it, and removing unnecessary applications and services 

We are not guaranteed security, but we can minimize the risk 

Mitigate risk by minimizing vulnerabilities to reduce exposure to threats 

## Unnecessary Applications ## 

Least Functionality: Process of configuring workstations or servers to only provide essential applications and services 

While enterprise computers are often subject to configuration management, personal computers often accumulate unnecessary programs over time 

Utilize a secure baseline image when adding new computers 

SCCM: Microsoft's System Center Configuration Management 

## Restricting Applications ## 

Application Allow/Whitelist: Only applications that are on the list are allowed to be run by the operating system while all other applications are blocked 

Application Deny/Blacklist: Any application placed on this list will be prevented from running while all others will be permitted to run 

Can be centrally managed 

## Unnecessary Services ## 

Any services that are unneeded should be disabled in the OS 

## Trusted Operating System ## 

Trusted Operating System [TOS]: An operating system that meets the requirements set forth by the government and has multilevel security 

Current Trusted Operating Systems: 
* Windows 7 [and newer] 
* Mac OSX 10.6 [and newer] 
* FreeBSD [TrustedBSD] 
* Red Hat Enterprise Server 

Need to identify the current version and build prior to updating a system 

## Updates and Patches ## 

Patches: A single problem-fixing piece of software for an operating system or application 

Hotfix: A single problem-fixing piece of software for an operating system or application 

Patches used to require reboot of system, hotfixes did not 

Patches and hotfixes are now used interchangeably by most manufacturers 

Categories of updates: 
* Security Update: software code that is issued for a product-specific security-related vulnerability 
* Critical Update: software code for a specific problem addressing a critical, non-security bug in the software 
* Service Pack: a tested, cumulative grouping of patches, hotfixes, security updates, critical updates, and possibly some feature or design changes 
* Windows Update: recommended update to fix a noncritical problem that users have found, as well as to provide additional features or capabilities 
* Driver Update: updated device driver to fix a security issue or add a feature to a supported piece of hardware 

Windows 10 uses the Windows Update program [wuapp.exe] to manage updates 

## Patch Management ## 

Patch Management: Process of planning, testing, implementing, and auditing of software patches 

Planning: verifying patch is compatible with one's systems and plan for how said patch will be tested and deployed 

Testing: always test a patch prior to automating its deployment 

Deploying/Implementing: Manually or automatically deploy patches to all clients to implement it 

Large organizations centrally manage updates through an update server 

Disable the wuauserv service to prevent Windows Update from running automatically 

Auditing: It is important to audit clients' status after patch deployment 

Linux and OSX also have built-in patch management systems 

## Group Policies ## 

Group Policy: a set of rules or policies that can be applied to a set of users or computer accounts within the operating system 

Access the Group Policy Editor on Windows by opening the Run prompt and enter gpedit 

Group policy can specify requirements for things such as: 
* Password complexity 
* Account lockout policy 
* Software restrictions 
* Application restrictions 

Active Directory domain controllers have a more advanced Group Policy Editor 

Security Template: A group of policies that can be loaded through one procedure 

Group Policy Objectives [GPOs] aid in the hardening of the operating system 

Baselining: process of measuring changes in the network, hardware, and software environment 

A baseline establishes what is normal, to be able to find deviations 

## File Systems and Hard Drives ## 

Level of security of a system is affected by its file system type 

NTFS, FAT32, ext4, HFS+, APFS 

Windows systems can utilize NTFS or FAT32 

NTFS: New Technology File System is the default file system format for Windows and is more secure because it supports logging, encryption, larger partition sizes, and larger file sizes than FAT32 

Linux systems should use ext4 and OSX should use the APFS 

All hard drives will eventually fail 

Tips to increase drive longevity: 
* Remove temporary files by using Disk Cleanup 
* Periodic system file checks 
* Defragment disk drive periodically 
* Back up all data 
* Use and practice restoration techniques 