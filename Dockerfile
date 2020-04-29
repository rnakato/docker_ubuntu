# Ubuntu Japanese edition
FROM ubuntu:20.04
LABEL maintainer="Ryuichiro Nakato <rnakato@iam.u-tokyo.ac.jp>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
       bat \
       cmake \
       curl \
       emacs \
       fd-find \
       git \
       htop \
       language-pack-ja-base \
       language-pack-ja \
       locales \
       make \
       software-properties-common \
       vim \
       wget \
       && rm -rf /var/lib/apt/lists

RUN echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

CMD ["/bin/bash"]
