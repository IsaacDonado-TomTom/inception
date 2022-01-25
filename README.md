# inception, a System Administration related exercise.
` From subject pdf `: This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

# Table of Contents
1. [Docker recap](#docker_recap)
  + [Basic Docker commands](#docker_recap)
  + [Default command](#default_command)
  + [Execute commands on running container](#running_containers)
  + [Attach & detach](#attach_detach)
  + [Tags](tags)
  + [STDIN on run](#stdin_on_run)
  + [Port mapping on run](#port_mapping_on_run)
  + [volume mapping on run](#volume_mapping_on_run)
  + [Inspect command](#inspect)
  + [Environment variable on run](#env_variables_on_run)
  + [Make your own image with Dockerfile](#dockerfile)

<a name="docker_recap"></a>
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
  

<a name="default_command"></a>
If we docker run an image that doesn't have a default command or process, such as OS images, we can specify with the `docker run` command which process we want to call after said image runs by writing a command after the name of the image in a `docker run` command.

for example: `docker run ubuntu sleep 100`

The above docker command runs the ubuntu image, then executes the command sleep 100 which would make the image pause for 100 seconds,

<a name="running_containers"></a>
We can also execute commands on a running container using the `exec` command, if ubuntu is running, we can do something like this.

+ `docker exec CONTAINER-NAME [command]`

Where CONTAINER-NAME would be whatever name is assigned to the ubuntu image, and [command] is whichever command we want to execute on the running container.

<a name="attach_detach"></a>
**Attach and Detach**

Sometimes when we run an existing container, it will be launched in attached mode, which means we'll see the output of the container in our terminal.. We can bypass this by specifying in the `docker run` command that we want it to be detached, for example; 

+ `docker run -d sample/app-name`

This will output the ID of the detached running container, which we'll need if we want to attach our terminal back to the container using the following command.

+ `docker attach [ID]` 

<a name="tags"></a>
**Tags**

When running an image, multiple versions may be available and if none is specified, the `latest` version/tag is used... 

`docker run ubuntu` is actually running `docker run ubuntu:latest` by default.

To specify a version, check out the available versions on docker hub.. for example:

`docker run ubuntu:16.04`

 <a name="stdin_on_run"></a>
**STDIN on run**

If you have a containarized application that asks for some input, the parts where input is asked for, will be skipped if the container isn't running in interactive mode.. by default, containers will run in a non-interactive mode and some containerized applications that ask for input on the terminal, won't work correctly, to fix this we use the `-i` option which is short of interactive.. for example;

`docker run -i example/app-name`

Even if you run the above command, the application will be able to listen to your input but you won't be able to see what is prompted to the terminal, for this you must also use the `-t` option next to the i.

`docker run -it example/app-name`


<a name="port_mapping_on_run"></a>
**Run Port mapping**

Each container is assigned its own IP Address, so if we ran a containarized app, we could access the app by navigatin to the container's IP address, but we can also map existing available ports to specific containerized apps using the `-p` option.. and we'll be able to launch several instanced of the container image  and access them through different ports.

+ `docker run -p 5000:8080 sample/appname` Here we are running sample/appname and we're setting the hosts' 5000 port to the 8080 port within the container.

<a name="volume_mapping_on_run"></a>
**Run Volume mapping**

We can also map certain folders within our containers to point to mounted folders that exist outside the container using the `-v` option.
Let's pretend we want a mySQL database, but we don't want the table data to be affected by the service's status, we want the data to exist in our host even if we delete the mysql container and reinstall it.. We could do something like this

`docker run -v /custom/data:var/lib/mysql mysql`


<br /><br />

<a name="inspect"></a>
**inspect command**

docker ps is enough for basic information but if you want extensive information about a container such as the IP address and more, use the `docker inspect [NAME/ID]` command.

<a name="env_variables_on_run"></a>
### Environment variables

We can use variables in a file and use them accross all our docker containers when necessary, the best example to picture this is with an example.. Let's write a very simple python program that prints a string..

app.py:
```python
text = "default_text"
print(text)
```

output:
```bash
default_text
```

But what if we want to modify the text we want to output later, after the app is containerized...? We need to move the text from the code and this part will vary depending on the programming language used.. our python file should now look like this.

```python
import os
text = os.environ.get("TEXT")
print(TEXT)
```

and after containerizing our app we must launch the docker container by setting the environment variable like this:

```bash
sudo docker run -e TEXT="bla bla bla" example/app_name
```

output:
```bash
bla bla bla
```
<a name="dockerfile"></a>
### Make your own image with Dockerfile

To build our own images with a Dockerfile we should first think about and list the steps we should follow in order to set up an application manually..

+ Install an OS
+ Update repositories.. etc.
+ Install dependencies
+ Copy needed course code into container
+ Run the app.

Let's think about our previous example: 

```python
import os
text = os.environ.get("TEXT")
print(TEXT)
```

How can we containerize and ship this application? Create a file named "Dockerfile"

```Dockerfile
FROM Alpine

RUN apk update
RUN apk upgrade
RUN apk add python3
COPY ./app.py /app/app.py
```
