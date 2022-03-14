# Docker Images # 

## Docker Images ## 

Images are created using a dockerfile, which have an INTRUCTION ARGUMENT format 

Every docker image must be based off another image [an OS or another image based on an OS] 

All dockerfiles must start with a FROM instruction 

Docker builds images in a layered architecture, with each new line creating a new layer with just the changes from the previous layer 

Docker caches build layers, so if an intermediate step fails, the previous successfully executed steps are cached, and once the intermediate step is fixed, docker will rebuild using the cached layers, and then proceed to build subsequent layers 

This enables faster rebuilding of images 

## Environment Variables ## 

-e flag in docker run command enables the passing of desired/specific environment variable values when running a container image 

To see the environment variable values being used for a currently running container, run the docker inspect $CONTAINER_NAME command, and the set environment variables will appear under [{"Config": {"Env"}}] 

## Command vs Entrypoint ## 

Unlike VMs, containers are not meant to host an OS, but to run a specific task or process [host an app/db/task to do some analysis/etc.] 

Once the task is complete, the container exits 

If the process running within the container crashes/stops, the container exits 

COMMAND [CMD]: The default command that is executed when a container image is run 

ENTRYPOINT: Customizable CMD [parameterizable] 