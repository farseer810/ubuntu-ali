FROM    farseer810/ubuntu:golang
MAINTAINER farseer810 "https://github.com/farseer810/ubuntu-ali"

RUN apt-get update && \
apt-get install -y python3 python3-dev python3-pip && \
ln -s /usr/bin/python3 /usr/bin/python && \
ln -s /usr/bin/pip3 /usr/bin/pip && \
mkdir -p ~/.pip && \
echo "[global]\ntrusted-host=mirrors.aliyun.com\nindex-url=https://mirrors.aliyun.com/pypi/simple/" > ~/.pip/pip.conf
