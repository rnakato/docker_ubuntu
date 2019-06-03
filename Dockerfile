# Ubuntu Japanese edition

FROM ubuntu:18.04
MAINTAINER Ryuichiro Nakato <rnakato@iam.u-tokyo.ac.jp>

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt update \
    && apt install -y --no-install-recommends \
       emacs locales git vim language-pack-ja-base language-pack-ja \
    && apt clean 

RUN echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

CMD ["/bin/bash"]
