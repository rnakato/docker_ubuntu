for tag in 20.04 latest #18.04
do
    docker build -t rnakato/ubuntu:$tag .
    docker push rnakato/ubuntu:$tag
done

for tag in dorowu-bionic
do
    docker build -f Dockerfile.dorowu -t rnakato/ubuntu:$tag .
    docker push rnakato/ubuntu:$tag
done
