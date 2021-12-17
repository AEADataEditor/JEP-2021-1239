# Docker image 

This creates a Docker image to run the code for JEP-2021-1239.

## Creating the image

```
VERSION=17
TAG=2021-11-17
MYHUBID=aeadataeditor
MYIMG=jep-2021-1239
STATALIC=$(find $HOME/Dropbox/ -name stata.lic.$VERSION | tail -1)
```

```
cp $STATALIC stata.lic.${VERSION}
mkdir output cleandata
DOCKER_BUILDKIT=1 docker build  . \
  --secret id=statalic,src=stata.lic.${VERSION} \
  -t $MYHUBID/${MYIMG}:$TAG
```
(untested: also see `build.sh`)

## Running code

You need to first download the repository from [https://doi.org/10.3886/E145161V2](https://doi.org/10.3886/E145161V2) (manually), then run the following code (this assumes that the replication package was unzipped into the `DinkelmanNgai2021Data` directory).

```
cd DinkelmanNgai2021Data
mkdir syntax 
mkdir data 
mkdir output cleandata
chmod a+rwX syntax syntax/*
chmod a+rwX data 
chmod a+rwX output
chmod a+rwX cleandata
docker run -it --rm \
  -v ${STATALIC}:/usr/local/stata/stata.lic \
  -v $(pwd)/syntax:/syntax \
  -v $(pwd)/data:/data \
  -v $(pwd)/output:/output \
  -v $(pwd)/cleandata:/cleandata \
  -w /syntax \
  $MYHUBID/${MYIMG}:${TAG} do master.do
```

The Docker image is available at [https://hub.docker.com/r/aeadataeditor/jep-2021-1239](https://hub.docker.com/r/aeadataeditor/jep-2021-1239).
