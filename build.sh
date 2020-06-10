for tag in latest pytorch-1.5-cuda10.1-cudnn7-devel #latest 10.1-cudnn7-devel-ubuntu18.04
do
    docker build -f Dockerfile.GPU -t rnakato/ubuntu_gpu:$tag .
    docker push rnakato/ubuntu_gpu:$tag
done
exit

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
