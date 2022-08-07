for tag in latest 11.3.1-cudnn8-runtime-ubuntu20.04 #nvidia-11.5.1-cudnn8-devel-ubuntu20.04 latest #pytorch-1.10.0-cuda11.3-cudnn8-devel #pytorch-1.5-cuda10.1-cudnn7-devel
do
    docker build -f Dockerfile.GPU -t rnakato/ubuntu_gpu:$tag .
    docker push rnakato/ubuntu_gpu:$tag
done

for tag in 20.04 latest #18.04
do
    docker build -t rnakato/ubuntu:$tag .
    docker push rnakato/ubuntu:$tag
done
