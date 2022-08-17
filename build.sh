for tag in latest 2022.08 #11.4.2-cudnn8-runtime-ubuntu20.04 # 11.3.1-cudnn8-runtime-ubuntu20.04 #nvidia-11.5.1-cudnn8-devel-ubuntu20.04
do
    docker build -f Dockerfile.GPU -t rnakato/ubuntu_gpu:$tag .
    docker push rnakato/ubuntu_gpu:$tag
done

for tag in latest 2022.08 #20.04 #18.04
do
    docker build -t rnakato/ubuntu:$tag .
    docker push rnakato/ubuntu:$tag
done
