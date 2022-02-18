# Docker Commands # 

## Basic Docker Commands ## 

docker run command: Used to run a container from an image 

docker ps command: Lists all running containers 
* docker ps -a lists all running as well as previously run/exited containers 

docker stop: Stops a container 
* Requires either container name or container ID to be passed along with the command to specify which container is desired to be stopped 

docker rm command: Remove a exited/stopped container permanently 

docker images command: List available images 

docker rmi command: Remove images 
* Must stop/remove all dependent containers before being able to remove the image 

docker pull command: Download an image, but don't run the container 

Important note: A container only lives as long as the process inside it is alive 
* This is why docker run $CONTAINER_NAME always exits immediately and only shows up in exited state [and requires docker ps -a to view] 
* Some containers/images may not run any service by default and hence will exit immediately 
* In such instances, can instruct docker to run a process within said container [e.g., docker run ubuntu sleep 5] 

docker exec command: execute a command 

Notes about attached/detached mode for docker run: 
* docker run $CONTAINER_NAME by default runs in attached mode; the container is spun up/run in the foreground, attached to the console/stdout of the docker container and will see the output of the container run on screen 
* Will not be able to do anything else on this console except view the output until the container stops 
* Will not respond to inputs; ctrl+C exits the application/process and container and returns to the prompt 
* docker -d $CONTAINER_NAME runs the container in the detached mode 
* This runs the container in the background and returns to prompt immediately while container runs in the background 
* Run docker ps to view the running container 
* To attach back to the running container: docker attach $RUNNING_CONTAINER_ID 