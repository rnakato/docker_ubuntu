for tag in dorowu-focal # dorowu-bionic
do
    docker build -f Dockerfile.dorowu -t rnakato/ubuntu:$tag .
    docker push rnakato/ubuntu:$tag
done
