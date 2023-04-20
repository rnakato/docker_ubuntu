FROM ubuntu:22.04 as common

WORKDIR /opt
SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PLENV_ROOT /opt/.plenv
ENV PATH $PLENV_ROOT/bin:$PLENV_ROOT/shims:$PATH

RUN useradd ubuntu -m -u 55555 \
  && echo "ubuntu:ubuntu" | chpasswd

RUN apt-get update && apt-get install -y --no-install-recommends \
       apt-file \
       apt-utils \
       build-essential \
       cmake \
       curl \
       fd-find \
       git \
       htop \
       language-pack-ja-base \
       language-pack-ja \
       less \
       libbz2-dev \
       libgd-dev \
       libncurses5-dev \
       libssl-dev \
       locales \
       make \
       nkf \
       openjdk-19-jdk-headless \
       openjdk-19-jre \
       patch \
       pkg-config \
       software-properties-common \
       tree \
       vim \
       wget \
       && rm -rf /var/lib/apt/lists

# SAMtools 1.17
COPY samtools-1.17.tar.bz2 samtools-1.17.tar.bz2
RUN tar xvfj samtools-1.17.tar.bz2 \
    && cd samtools-1.17 \
    && ./configure \
    && make && make install \
    && rm /opt/samtools-1.17.tar.bz2

# SRAtoolkit 3.0.2
COPY sratoolkit.3.0.2-ubuntu64.tar.gz sratoolkit.3.0.2-ubuntu64.tar.gz
RUN tar zxvf sratoolkit.3.0.2-ubuntu64.tar.gz \
    && mv sratoolkit.3.0.2-ubuntu64/ /opt/sratoolkit.3.0.2 \
    && rm sratoolkit.3.0.2-ubuntu64.tar.gz

# plenv
RUN set -e \
    && git clone https://github.com/tokuhirom/plenv.git /opt/.plenv \
    && git clone https://github.com/tokuhirom/Perl-Build.git /opt/.plenv/plugins/perl-build/ \
    && echo 'eval "$(plenv init -)"' >> ~/.bashrc \
    && . ~/.bashrc \
    && plenv install 5.36.0 \
    && plenv global 5.36.0 \
    && plenv list-modules \
    && plenv install-cpanm \
    && cpanm Getopt::Long Math::CDF Excel::Writer::XLSX XML::Simple XSLoader \
       HTML::TreeBuilder LWP::Protocol::https Config::Std \
       Statistics::Distributions Path::Class Array::Utils Pod::Usage List::Util \
       Statistics::Swoop Spreadsheet::ParseExcel App::St CGI Statistics::Lite JSON File::Which \
       HTML::Template XML::Compile XML::Compile::SOAP11 XML::Compile::WSDL11 \
       XML::Compile::Transport::SOAPHTTP Log::Log4perl Font::TTF::Font Statistics::Basic \
       Config::General GD Clone Math::Round Params::Validate Math::Bezier List::MoreUtils IO::Socket::SSL \
       Math::VecStat Regexp::Common Set::IntSpan Readonly Text::Format SVG List::Util GD::Graph::lines

FROM ubuntu:22.04 as normal
LABEL maintainer="Ryuichiro Nakato <rnakato@iqb.u-tokyo.ac.jp>"
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PLENV_ROOT /opt/.plenv
ENV PATH $PLENV_ROOT/bin:$PLENV_ROOT/shims:$PATH:/opt/sratoolkit.3.0.2/bin/
ENV JAVA_HOME /usr/lib/jvm/java-19-openjdk-amd64/

COPY --from=common / /
USER ubuntu
CMD ["/bin/bash"]

FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04 as gpu
LABEL maintainer="Ryuichiro Nakato <rnakato@iqb.u-tokyo.ac.jp>"
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PLENV_ROOT /opt/.plenv
ENV PATH $PLENV_ROOT/bin:$PLENV_ROOT/shims:$PATH:/opt/bin:/opt/sratoolkit.3.0.2/bin/
ENV JAVA_HOME /usr/lib/jvm/java-19-openjdk-amd64/

COPY --from=common / /
USER ubuntu
CMD ["/bin/bash"]
