FROM ubuntu:22.04
LABEL maintainer="Ryuichiro Nakato <rnakato@iqb.u-tokyo.ac.jp>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PLENV_ROOT /opt/.plenv
ENV PATH $PLENV_ROOT/bin:$PLENV_ROOT/shims:$PATH

WORKDIR /opt
SHELL ["/bin/bash", "-c"]

RUN useradd ubuntu -m -u 55555 \
  && echo "ubuntu:ubuntu" | chpasswd

RUN apt-get update && apt-get install -y --no-install-recommends \
       apt-file \
       apt-utils \
       build-essential \
       cmake \
       curl \
       emacs \
       fd-find \
       fish \
       git \
       htop \
       language-pack-ja-base \
       language-pack-ja \
       less \
       libgd-dev \
       libssl-dev \
       locales \
       make \
       nkf \
       patch \
       pkg-config \
       software-properties-common \
       tree \
       vim \
       wget \
       && rm -rf /var/lib/apt/lists

# plenv
RUN git clone https://github.com/tokuhirom/plenv.git /opt/.plenv \
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

#RUN cpanm GD::Graph::lines --force

USER ubuntu
CMD ["/bin/bash"]
