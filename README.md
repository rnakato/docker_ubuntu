# docker_ubuntu

- Ubuntu 26.04/24.04/22.04/20.04

- GPU mode
   - 26.04/24.04: cuda:13.3.1-cudnn-runtime (CUDA 13.3, cuDNN 9.24)
   - 22.04/20.04: cuda:11.8.0-cudnn8-runtime (CUDA 11.8, cuDNN 8)

- Perl (with plenv)
   - 5.42.3

- SAMtools 1.24
- SRAtoolkit 3.4.1

- user:password
    - `ubuntu:ubuntu`

## Changelog

- 2026.09
  - Updated Perl from 5.36.0 to 5.42.3
  - Updated SAMtools from 1.22.1 to 1.24
  - Added `libcurl4-openssl-dev` to enable libcurl (HTTPS/S3/GCS) support in SAMtools
  - Added `libdeflate-dev` to enable libdeflate in SAMtools (previously enabled only on
    22.04 and later, as an indirect dependency of `libgd-dev`)
  - `nvidia-cuda-toolkit` is no longer installed in GPU mode; it was removed from
    Ubuntu22.04_gpu, which is the only version that had it (image size: 9.6 GB to 5.6 GB).
    `nvcc` is not included; use a `-devel` CUDA base image if you need to compile CUDA code
  - Added Ubuntu 26.04 and 24.04
    - `libncurses5-dev` is no longer available; replaced with `libncurses-dev`
    - The base images ship an `ubuntu` user (UID 1000), which is recreated with UID 55555
    - GPU mode uses cuda:13.3.1-cudnn-runtime (the only tag available for 26.04)

- 2026.06
  - Added ``isnumber.sh``

- 2026.04
  - Updated SRA Toolkit from 3.2.1 to v3.4.1

- 2026.03
  - Bug fix: lost path to sratoolkit 3.2.1 in PATH

- 2025.08
  - Updated SAMtools from 1.21 to 1.22.1
  - Updated SRA Toolkit from 3.1.1 to 3.2.1

- 2024.10
  - Updated SAMtools from 1.19.2 to 1.21
  - Updated SRA Toolkit from 3.0.10 to v3.1.1

- 2024.02
  - Install MS core fonts (ttf-mscorefonts-installer)

- 2024.01
  - Updated SAMtools from 1.17 to 1.19.2
  - Updated SRAtoolkit from 3.0.2 to 3.0.10
  - Change WORKDIR from /opt to /home/ubuntu
  - Installed `sudo`

- 2023.11
  - Removed LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/compat/:/usr/local/cuda/lib64

- 2023.10
  - Added LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/compat/:/usr/local/cuda/lib64

- 2023.06
  - Added fish

- 2023.05
  - Bug fix: failed to register layer: ApplyLayer exit status 1 stdout:  stderr: lchown /root/.cpanm/work/...: invalid argument


## Usage

Run Ubuntu 26.04:

    # normal
    docker run -it --rm rnakato/ubuntu_26.04 /bin/bash
    # with GPU
    docker run -it --rm rnakato/ubuntu_gpu_26.04 /bin/bash

Run Ubuntu 24.04:

    # normal
    docker run -it --rm rnakato/ubuntu_24.04 /bin/bash
    # with GPU
    docker run -it --rm rnakato/ubuntu_gpu_24.04 /bin/bash

Run Ubuntu 22.04:

    # normal
    docker run -it --rm rnakato/ubuntu_22.04 /bin/bash
    # with GPU
    docker run -it --rm rnakato/ubuntu_gpu_22.04 /bin/bash

Run Ubuntu 20.04:

    # normal
    docker run -it --rm rnakato/ubuntu_20.04 /bin/bash
    # with GPU
    docker run -it --rm rnakato/ubuntu_gpu_20.04 /bin/bash

The default user is `ubuntu`. Add `-u root` if you want to login as root:

    docker run -it --rm -u root rnakato/ubuntu_20.04 /bin/bash

## Build images from Dockerfile

    version=26.04 # or 24.04, 22.04, 20.04

    # normal
    docker build -f Dockerfile.$version -t youracount/ubuntu_$version -target normal .
    # with GPU
    docker build -f Dockerfile.$version -t youracount/ubuntu_gpu_$version --target gpu .
