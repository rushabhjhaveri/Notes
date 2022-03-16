# Container Orchestration - Docker Swarm & Kubernetes # 

## Container Orchestration ## 

Container Orchestration: Set of tools/scripts that can assist with the hosting, management and maintenance of containers in a production environment 

The typical container orchestration solution consists of multiple docker hosts that can host containers 

Examples of container orchestration solutions: Docker Swarm, Kubernetes, Mesos 

## Docker Swarm ## 

Enables combining multiple docker machines together into a single docker cluster 

Docker will take care of distributing services or application instances into separate hosts for high availability and for load balancing across different systems and hardware 

To setup docker swarm, must have hosts/multiple hosts with docker installed on them 

One host becomes the swarm manager, rest become workers 

docker swarm init to create a swarm 

docker swarm join to enable workers to attach to manager 

Docker service: one or more instances of a single application/service that runs across the site across nodes in the cluster 

## Kubernetes Introduction ## 

A more advanced container orchestration service 