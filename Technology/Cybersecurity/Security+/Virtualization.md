# Virtualization # 

## Virtualization ## 

Virtualization: Creation of a virtual resource 

A virtual machine is a container for an emulated computer that runs an entire operating system 

VM Types: System or Processor 

System Virtual Machine: Complete platform designed to replace an entire physical computer and includes a full desktop/server operating system 

Processor Virtual Machine: Designed to only run a single process or application like a virtualized web browser or a simple web server 

Virtualization continues to rise in order to reduce the physical requirements for data centers 

## Hypervisors ## 

Hypervisor: Manages the distribution of the physical resources of a host machine [server] to the virtual machines being run [guests] 

Type I [bare metal] hypervisors are more efficient than Type II 

Application Containerization: A single operating system kernel is shared across multiple virtual machines but each virtual machine receives its own user space for programs and data 

Containerization allows for rapid and efficient deployment of distributed applications 

## Threats to VMs ## 

VMs are separated from other VMs by default 

VM Escape: An attack that allows an attacker to break out of a normally isolated VM by interacting directly with the hypervisor 

Elasticity allows for scaling up or down to meet user demands 

Data Remnants: Contents of a virtual machine that exist as deleted files on a cloud-based server after deprovisioning of a virtual machine 

Privilege Elevation: Occurs when a user is able to grant themselves the ability to run functions as a higher-level user 

Live migration occurs when a VM is moved from one physical server to another over the network 

## Securing VMs ## 

Uses many of the same security measures as a physical server 

Limit connectivity between the virtual machine and the host 

Remove any unnecessary pieces of virtual hardware from the virtual machine 

Using proper patch management is important to keeping guest operating system secure 

Virtualization Sprawl: Occurs when virtual machines are created, used, and deployed without proper management or oversight by system admins 