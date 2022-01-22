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
  

If we docker run an image that doesn't have a default command or process, such as OS images, we can specify with the `docker run` command which process we want to call after said image runs.

for example: `docker run ubuntu sleep 100`
