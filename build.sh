for tag in 2023.03 latest
do
    docker build -t rnakato/ubuntu_gpu:$tag --target gpu .
    docker push     rnakato/ubuntu_gpu:$tag
    docker build -t rnakato/ubuntu:$tag     --target normal .
    docker push     rnakato/ubuntu:$tag
done
