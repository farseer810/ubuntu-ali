FROM	ubuntu:18.04
MAINTAINER farseer810 "https://github.com/farseer810/ubuntu-ali"

# set aliyun source list as default
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\n" > /etc/apt/sources.list && \
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\n" >> /etc/apt/sources.list && \
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\n" >> /etc/apt/sources.list && \
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\n" >> /etc/apt/sources.list && \
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\n" >> /etc/apt/sources.list && \
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\n" >> /etc/apt/sources.list && \
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\n" >> /etc/apt/sources.list && \
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\n" >> /etc/apt/sources.list && \
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\n" >> /etc/apt/sources.list && \
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\n" >> /etc/apt/sources.list && \
echo "deb http://archive.canonical.com/ubuntu/ bionic partner\n" >> /etc/apt/sources.list && \
apt-get update

# disable dialog frontend during installation
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LANG zh_CN.UTF-8

# install some basic software
RUN apt-get install -y apt-utils && \
apt-get install -y language-pack-zh-hans language-pack-zh-hans-base && \
apt-get install -y build-essential vim git wget software-properties-common && \
echo "export LC_ALL=zh_CN.UTF-8\n" >> /etc/profile && \
echo "export LANGUAGE=zh_CN.UTF-8\n" >> /etc/profile &&\
echo "export LANG=zh_CN.UTF-8\n" >> /etc/profile

# set tzdata
RUN apt-get install -y tzdata && \
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
dpkg-reconfigure tzdata

