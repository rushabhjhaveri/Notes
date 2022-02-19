# Docker Run # 

## docker run ## 

### run - tag ### 

By default, docker run will run the latest version of the requested image 

To run a specific verion, docker run image:version 

The part after the colon is known as the tag 

Default tag is :latest, which is the latest version of the specified software 

### run - stdin ### 

By default, docker containers do not listen to standard input 

This is because the container, even though it runs on the console [stdout], runs in a non-interactive mode, and is thus unable to listen to any inputs 

docker run -i $CONTAINER_NAME runs the container in interactive mode, allowing for input via stdin 

docker run -it $CONTAINER_NAME runs the container in the interactive mode, in a pseudo terminal within the container [aka, attached to the terminal in interactive mode in the container] 

### run - port mapping ### 

The underlying host where docker is installed is known as docker host or docker engine 

Web applications, etc. run in a container will listen on a specific port 

Said container is assigned an internal IP 

Said web applications can be accessed via the docker container's IP:Port only from the docker host [users outside the docker host will not be able to access it this way as it is an internal IP] 

External users can access the web application by using the IP of the docker host itself 

However, to achieve this, must map the port on the container to an open port on the docker host 

e.g., docker run -p 80:5000 $CONTAINER_NAME, where Port 80 is the open port on the docker host from which external users can access, and Port 5000 is the port on which the containerized web application is listening on 

This way, can run multiple instances of the same [containerized] web application on different ports of the docker host, or run multiple applications on different ports 

### run - volume mapping ### 

Any data stored/manipulated in a running container instance will be lost when the container is stopped/deleted 

To enable data persistance, would need to map a directory on the docker host to a directory in the container - e.g., docker run -v /opt/datadir:/var/lib/mysql mysql 
* Where /opt/datadir is the external directory on the docker host 
* /var/lib/mysql is the directory within the docker container 
* mysql is the container being run 

### Inspect Container ### 

An enhanced/more detailed counterpart of docker ps 

docker inspect $CONTAINER_NAME_OR_ID 

Returns all details of a container in JSON format 


### Container Logs ### 

docker logs $CONTAINER_NAME_OR_ID 

To view logs of a container while it is running in detached mode 

## Advanced docker run Features ## 

