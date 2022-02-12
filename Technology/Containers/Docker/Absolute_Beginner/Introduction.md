# Introduction # 

## Docker Overview ## 

Why docker: 
* Resolves the compatibility/dependency matrix when using multiple products/services as part of a tech stack for a given project  
* Shortens the otherwise long setup time 
* Streamlines the maintenance of different dev/test/prod environments 

What docker can do: 
* Containerize applications/services 
* Run each service with its own dependencies in separate containers 

Containers: Completely isolated environments with their own processes/network interfaces/services/mounts/etc. just like VMs, except that they all share the same OS kernel 

Docker utilizes LXC containers 

Containers vs. VMs: 
* Containers focus on application containerization, where the application plus its libraries and dependencies form a container, and containers deployed via docker share the OS kernel and underlying hardware infrastructure 
* VMs package the application, its libraries and dependencies, as well as the OS, with VMs deployed via the hypervisor sharing just the underlying hardware infrastructure 
* VMs allow for more complete isolation vs containers as containers share more of the underlying stack 
* VMs have higher utilization, disk usage, and boot up time as compared to containers, mainly due to the fact that each VM has to first load up the [underlying] OS 

It is the combination of containers and VMs used in conjunction that power deployments in large environments 

Public Docker registry: dockerhub [contains containerized images of public applications] 

Container vs. Image: 
* Images are packages/templates used to create one or more containers 
* Containers are running instances of images that are isolated, and have their own environments and running processes 

## Getting Started With Docker ## 

Docker Editions: 
* Community Edition 
* Enterprise Edition 