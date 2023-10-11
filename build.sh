for version in 22.04 20.04
do
    for tag in 2023.10 latest
    do
        docker build -f Dockerfile.$version -t rnakato/ubuntu_gpu_$version:$tag --target gpu . #--no-cache
        docker push     rnakato/ubuntu_gpu_$version:$tag
        docker build -f Dockerfile.$version -t rnakato/ubuntu_$version:$tag     --target normal .
        docker push     rnakato/ubuntu_$version:$tag
    done
done

docker build -f Dockerfile.20.04 -t rnakato/ubuntu_gpu_20.04:cuda11.0.3-cudnn8 --target gpu_juicer .
docker push rnakato/ubuntu_gpu_20.04:cuda11.0.3-cudnn8
