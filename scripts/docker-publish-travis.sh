DOCKER_ENV=''
DOCKER_TAG=''

case "$TRAVIS_BRANCH" in
  "master")
    DOCKER_ENV=production
    DOCKER_TAG=latest
    ;;
  "develop")
    DOCKER_ENV=development
    DOCKER_TAG=dev
    ;;    
esac

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

docker build -f ./src/asp.net-core-mvc/Dockerfile.$DOCKER_ENV -t asp.net-core-mvc:$DOCKER_TAG ./src/asp.net-core-mvc --no-cache

docker tag asp.net-core-mvc:$DOCKER_TAG $DOCKER_USERNAME/asp.net-core-mvc:$DOCKER_TAG

docker push $DOCKER_USERNAME/asp.net-core-mvc:$DOCKER_TAG