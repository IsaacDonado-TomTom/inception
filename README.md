# inception, a System Administration related exercise.
` From subject pdf `: This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.


### Docker recap
+ `docker run CONTAINER-NAME`
  Fetches if not available and runs the specified container.
Docker run first searches for an available container image in the host, if it's not found it tries to fetch the specified image in docker-hub and then runs it

+ `docker ps`
  Lists all actively running containers.
+ `docker ps -a`
  Lists all actively running containers as well as stopped containers.
+ `docker stop CONTAINER-NAME`
  Stops/halts the specified container.
+ `docker rm CONTAINER-NAME`
  Removes the specified container.
+ `docker images`
  Lists all images stored on the host for easy fetching.
+ `docker rmi IMAGE-NAME`
  Removes the specified image from host.
+ `docker pull IMAGE-NAME`
  Pulls image from docker hub and stores it in the host for future usage.
  

If we docker run an image that doesn't have a default command or process, such as OS images, we can specify with the `docker run` command which process we want to call after said image runs by writing a command after the name of the image in a `docker run` command.

for example: `docker run ubuntu sleep 100`

The above docker command runs the ubuntu image, then executes the command sleep 100 which would make the image pause for 100 seconds,

We can also execute commands on a running container using the `exec` command, if ubuntu is running, we can do something like this.

+ `docker exec CONTAINER-NAME [command]`

Where CONTAINER-NAME would be whatever name is assigned to the ubuntu image, and [command] is whichever command we want to execute on the running container.

** attach and detach **

Sometimes when we run an existing container, it will be launched in attached mode, which means we'll see the output of the container in our terminal.. We can bypass this by specifying in the `docker run` command that we want it to be detached, for example; 

+ `docker run -d sample/app-name`

This will output the ID of the detached running container, which we'll need if we want to attach our terminal back to the container using the following command.

+ `docker attach [ID]` 

