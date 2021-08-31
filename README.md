# Docker image for Borcard et al's *Numerical Ecology for R*

This builds a docker file with RStudio and all of the required packages needed for the code supplement to *Numerical Ecology for R, Second Edition*, by Daniel Borcard, François Gillet, and Pierre Legendre.  The repository contains the dockerfile, while the image is hosted on Docker Hub as `crpeters/r-numerical-ecology:4.1.1`. 

The image also contains the tidyverse, a variety of geospatial packages, the Intel MKL library, and a few other useful R packages.

## Installation

1. **Install Docker.** Instructions for [Windows](https://docs.docker.com/desktop/windows/), [Mac](https://docs.docker.com/desktop/mac/), and [Ubuntu](https://docs.docker.com/engine/install/ubuntu/). More information [here](https://containers-at-tacc.readthedocs.io/en/latest/containers/02.dockerbasics.html).

2. **Pull the Numerical Ecology Docker image.** In the terminal, run `sudo docker pull crpeters/r-numerical-ecology:4.1.1`
3. **Download the [code supplement](http://adn.biol.umontreal.ca/~numericalecology/numecolR/NEwR-2ed_code_data.zip) from the book.** Unzip it and put the folders into a new directory.  
4. **Initialize the image:** Run the following code, adjusting `LOCAL_DIR` and `PASSWORD` if so desired
```bash
# Change LOCAL_DIR to the folder you unzipped the code into
LOCAL_DIR=~/Documents/Files/Grad_School/Numerical_Ecology
# Change password if you want this to be more secure
PASSWORD=1234
  
IMAGE=crpeters/r-numerical-ecology:4.1.1
NAME=numerical_ecology
PORT=8787
# Run the container
sudo docker run -d -p $PORT:$PORT \
  -v $LOCAL_DIR:/home/rstudio/Numerical_Ecology \
  -e PASSWORD=$PASSWORD -e USERID=$UID --name $NAME $IMAGE
```

## Use

1. In the console, run `sudo docker container start numerical_ecology` (You can skip this if you just initialized the container for the first time).
2. In a web browser, go to `localhost:8787`
3. Sign in with the username `rstudio` and the password you used above
4. Welcome to RStudio

When you're done, run `sudo docker container stop numerical_ecology` to shut it down.

## Building the docker image

If you'd like to build the image yourself, you'll need to make a docker account ([info here](https://containers-at-tacc.readthedocs.io/en/latest/containers/02.dockerbasics.html)).  Download `r-numerical-ecology.dockerfile`, then run

```bash

IMAGE_NAME=r-numerical-ecology
IMAGE_TAG=4.1.1
DOCKER_FILE=r-numerical-ecology.dockerfile
# Change this to your docker username
DOCKER_USERNAME=crpeters

sudo docker build -t $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG -f $DOCKER_FILE .
sudo docker push  $DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG
```

