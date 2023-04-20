for tag in 2023.04 latest
do
    docker build -t rnakato/ubuntu_gpu:$tag --target gpu . #--no-cache
    docker push     rnakato/ubuntu_gpu:$tag
    docker build -t rnakato/ubuntu:$tag     --target normal .
    docker push     rnakato/ubuntu:$tag
done
