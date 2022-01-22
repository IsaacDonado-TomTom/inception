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

**Attach and Detach**

Sometimes when we run an existing container, it will be launched in attached mode, which means we'll see the output of the container in our terminal.. We can bypass this by specifying in the `docker run` command that we want it to be detached, for example; 

+ `docker run -d sample/app-name`

This will output the ID of the detached running container, which we'll need if we want to attach our terminal back to the container using the following command.

+ `docker attach [ID]` 

**Tags**

When running an image, multiple versions may be available and if none is specified, the `latest` version/tag is used... 

`docker run ubuntu` is actually running `docker run ubuntu:latest` by default.

To specify a version, check out the available versions on docker hub.. for example:

`docker run ubuntu:16.04`

**STDIN on run**

If you have a containarized application that asks for some input, the parts where input is asked for, will be skipped if the container isn't running in interactive mode.. by default, containers will run in a non-interactive mode and some containerized applications that ask for input on the terminal, won't work correctly, to fix this we use the `-i` option which is short of interactive.. for example;

`docker run -i example/app-name`

Even if you run the above command, the application will be able to listen to your input but you won't be able to see what is prompted to the terminal, for this you must also use the `-t` option next to the i.

`docker run -it example/app-name`

**Run Port mapping**

Each container is assigned its own IP Address, so if we ran a containarized app, we could access the app by navigatin to the container's IP address, but we can also map existing available ports to specific containerized apps using the `-p` option.. and we'll be able to launch several instanced of the container image  and access them through different ports.

+ `docker run -p 5000:8080 sample/appname` Here we are running sample/appname and we're setting the hosts' 5000 port to the 8080 port within the container.

**Run Volume mapping**

We can also map certain folders within our containers to point to mounted folders that exist outside the container using the `-v` option.
Let's pretend we want a mySQL database, but we don't want the table data to be affected by the service's status, we want the data to exist in our host even if we delete the mysql container and reinstall it.. We could do something like this

`docker run -v /custom/data:var/lib/mysql mysql`
