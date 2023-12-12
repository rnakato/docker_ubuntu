# docker_ubuntu

- Ubuntu 22.04/20.04

- Perl 5.36.0 (with plenv)

- SAMtools 1.17
- SRAtoolkit 3.0.2

- user:password
    - ubuntu:ubuntu


## Changelog

- 2023.11
  - Removed LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/compat/:/usr/local/cuda/lib64

- 2023.10
  - Add LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/compat/:/usr/local/cuda/lib64

- 2023.06
  - Add fish

- 2023.05
  - Bug fix: failed to register layer: ApplyLayer exit status 1 stdout:  stderr: lchown /root/.cpanm/work/...: invalid argument