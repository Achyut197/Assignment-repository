
# Dockerfile Creation with ubuntu 16.04

write a Dockerfile with Ubuntu 16.04 as a base image. The image should have following packages present:

telnet
curl
ffmpeg

Finally, when running a container from the docker image, it should launch with bash.




## Tech Stack:

Docker


## Instructions to build and Run the container:

to Build a container with bash,following command was used:
```
  docker build -t my-ubuntu-image .
```
This command will build an image named myubuntu16.04-image based on the Dockerfile.

to run a container with bash, you can use the following command:

```
  docker run -it my-ubuntu-image:latest
```
This command will start a new container from the image and launch an interactive bash session within the container.
