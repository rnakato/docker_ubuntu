# docker_ubuntu

- Ubuntu 22.04/20.04

- GPU mode (cuda:11.8.0-cudnn8-runtime)
   - CUDA 11.8
   - cudnn 8

- Perl 5.36.0 (with plenv)

- SAMtools 1.19.2
- SRAtoolkit 3.0.10

- user:password
    - ubuntu:ubuntu


## Changelog

- 2024.01
  - Updated SAMtools from 1.17 to 1.19.2
  - Updated SRAtoolkit from 3.0.2 to 3.0.10

- 2023.11
  - Removed LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/compat/:/usr/local/cuda/lib64

- 2023.10
  - Added LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/compat/:/usr/local/cuda/lib64

- 2023.06
  - Added fish

- 2023.05
  - Bug fix: failed to register layer: ApplyLayer exit status 1 stdout:  stderr: lchown /root/.cpanm/work/...: invalid argument


## Usage

Run Ubuntu 22.04:

    # normal
    docker run -it --rm rnakato/ubuntu_22.04 /bin/bash
    # with GPU
    docker run -it --rm rnakato/ubuntu_gpu_22.04 /bin/bash

RunUbuntu 20.04:

    # normal
    docker run -it --rm rnakato/ubuntu_20.04 /bin/bash
    # with GPU
    docker run -it --rm rnakato/ubuntu_gpu_20.04 /bin/bash

The default user is `ubuntu`. Add `-u root` if you want to login as root.

## Build images from Dockerfile

    version=22.04 # or 20.04

    # normal
    docker build -f Dockerfile.$version -t youracount/ubuntu_$version -target normal .
    # with GPU
    docker build -f Dockerfile.$version -t youracount/ubuntu_gpu_$version --target gpu .