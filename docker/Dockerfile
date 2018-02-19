FROM debian:jessie
MAINTAINER Edgar Garriga <docker@edgargarriga.com>

## 
## Docker image for mBed distances
##

RUN echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list.d/unstable.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
                ed \
                less \
                vim-tiny \
                wget \
                git \
                python \
                build-essential \
                cmake \
                curl \
                libargtable2-0 \
                ca-certificates \
                libpng12-0 \
                python-biopython \
                python-numpy \
                ruby \
                python-setuptools \
                default-jdk \
                libpng-dev \
                vim
                
## download hacked mBed
RUN wget https://github.com/edgano/mBed mBed_hack
