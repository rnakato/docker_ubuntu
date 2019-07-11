# Ubuntu Japanese edition

FROM ubuntu:18.04
LABEL maintainer="Ryuichiro Nakato <rnakato@iam.u-tokyo.ac.jp>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
       emacs \
       git \
       language-pack-ja-base \
       language-pack-ja \
       locales \
       make \
       vim \
       wget \
       && rm -rf /var/lib/apt/lists

RUN echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

CMD ["/bin/bash"]
