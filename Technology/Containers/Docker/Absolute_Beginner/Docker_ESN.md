# Docker Engine, Storage, & Networking # 

## Docker Engine ## 

Docker Engine components: 
* Docker CLI 
* REST API: API Interface that programs can use to talk to the Daemon and provide instructions  
* Docker Daemon: Background process that manages docker objects [images/containers/volumes/networks/etc.] 

Docker uses namespaces to provide isolation between containers 

## Docker Storage ## 

File System: 
* /var/lib/docker 
    * aufs 
    * containers 
    * image 
    * volumes 

Layered Architecture 

## Docker Networking ## 

Default networks: 
* Bridge: default network a container gets attached to  
* none 
* host 

--network parameter in docker run command to specify a specific network to associate with a container 

docker network ls to list all networks 

