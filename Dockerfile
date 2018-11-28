FROM centos:7
WORKDIR /root

# install development tools
RUN yum -y groupinstall "Development Tools"
RUN yum -y install cmake make gcc gcc-c++ flex bison libpcap libpcap-devel openssl-devel python-devel swig zlib-devel perl cyrus-sasl cyrus-sasl-devel cyrus-sasl-gssapi git

# install bro
RUN curl -L https://www.bro.org/downloads/bro-2.5.5.tar.gz | tar xvz
WORKDIR bro-2.5.5/
RUN ./configure
RUN make
RUN make install
ENV PATH="${PATH}:/usr/local/bro/bin"

# install pip
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install python-pip
RUN pip install --upgrade pip

# install bro-pkg
RUN pip install bro-pkg
ENV PATH="${PATH}:/usr/bin"
RUN bro-pkg autoconfig

# install librdkafka
RUN curl -L https://github.com/edenhill/librdkafka/archive/v0.9.4.tar.gz | tar xvz
WORKDIR librdkafka-0.9.4/
RUN ./configure --enable-sasl
RUN make
RUN make install

WORKDIR /root
