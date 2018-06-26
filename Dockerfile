FROM    farseer810/ubuntu:nginx
MAINTAINER farseer810 "https://github.com/farseer810/ubuntu-ali"

RUN apt-get update && \
apt-get install -y python python-dev python-pip && \
mkdir -p ~/.pip && \
echo "[global]\ntrusted-host=mirrors.aliyun.com\nindex-url=https://mirrors.aliyun.com/pypi/simple/" > ~/.pip/pip.conf 
