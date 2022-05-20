FROM ubuntu:20.04
LABEL maintainer="Ryuichiro Nakato <rnakato@iqb.u-tokyo.ac.jp>"

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
#ENV LANG=C.UTF-8 LC_CTYPE=en_US.UTF-8

ENV PLENV_ROOT /opt/.plenv
ENV PATH $PLENV_ROOT/bin:$PLENV_ROOT/shims:$PATH

WORKDIR /opt

RUN apt-get update && apt-get install -y --no-install-recommends \
       apt-file \
       apt-utils \
       build-essential \
       cmake \
       curl \
       emacs \
       fd-find \
       git \
       htop \
       language-pack-ja-base \
       language-pack-ja \
       less \
       libgd-dev \
       libssl-dev \
       locales \
       make \
       patch \
       pkg-config \
       python \
       software-properties-common \
       vim \
       wget \
       && rm -rf /var/lib/apt/lists

# CPAN
RUN bash \
    && git clone https://github.com/tokuhirom/plenv.git /opt/.plenv \
    && git clone https://github.com/tokuhirom/Perl-Build.git /opt/.plenv/plugins/perl-build/ \
    && echo 'export PLENV_ROOT=/opt/.plenv'    >> ~/.bashrc \
    && echo 'export PATH=$PLENV_ROOT/bin:$PLENV_ROOT/shims:$PATH' >> ~/.bashrc \
    && echo 'eval "$(plenv init -)"' >> ~/.bashrc \
    && . ~/.bashrc \
    && plenv install 5.32.0 \
    && plenv global 5.32.0 \
    && plenv list-modules \
    && plenv install-cpanm \
    && cpanm Getopt::Long Math::CDF Excel::Writer::XLSX XML::Simple XSLoader \
       HTML::TreeBuilder LWP::Protocol::https Config::Std \
       Statistics::Distributions Path::Class Array::Utils Pod::Usage List::Util \
       Statistics::Swoop Spreadsheet::ParseExcel App::St CGI Statistics::Lite JSON File::Which \
       HTML::Template XML::Compile XML::Compile::SOAP11 XML::Compile::WSDL11 \
       XML::Compile::Transport::SOAPHTTP Log::Log4perl Font::TTF::Font Statistics::Basic \
       Config::General GD Clone Math::Round Params::Validate Math::Bezier List::MoreUtils IO::Socket::SSL \
       Math::VecStat Regexp::Common Set::IntSpan Readonly Text::Format SVG List::Util

#RUN echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
#RUN locale-gen
#ENV LANG ja_JP.UTF-8
#ENV LANGUAGE ja_JP.UTF-8
#ENV LC_ALL ja_JP.UTF-8

CMD ["/bin/bash"]
