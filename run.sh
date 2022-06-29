# check whether image exist or not
# if not docker will start build the Dockerfile
if [[ "$(docker images -q rust:latest 2> /dev/null)" == "" ]]; then
  docker build -t rust .
fi

# cleanup the container
if [[ "$(docker ps -a | grep rust)" ]]; then
  echo "stop working container named rust..."
  docker stop rust
  docker rm rust
fi

# run the container
echo "run container in background..."
docker run -it -d --name rust -v ${PWD}/src:/usr/src/myapp rust

# open the container shell
echo "starting..."
docker exec -it rust bash
