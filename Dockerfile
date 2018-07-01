FROM    farseer810/ubuntu:nginx
MAINTAINER farseer810 "https://github.com/farseer810/ubuntu-ali"

ENV GOLANG_VERSION 1.10.3
# install golang
RUN dpkgArch="$(dpkg --print-architecture)"; \
case "${dpkgArch##*-}" in \
amd64) goRelArch='linux-amd64';; \
armhf) goRelArch='linux-armv6l';; \
arm64) goRelArch='linux-arm64';; \
i386) goRelArch='linux-386';; \
ppc64el) goRelArch='linux-ppc64le';; \
s390x) goRelArch='linux-s390x';; \
esac; \
url="https://dl.google.com/go/go${GOLANG_VERSION}.${goRelArch}.tar.gz"; \
wget -O go.tar.gz "$url"; \
tar -C /usr/local -xzf go.tar.gz; \
rm go.tar.gz; \
export PATH="/usr/local/go/bin:$PATH"; \
go version;

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" && \
echo "export GOPATH=/go" >> /etc/profile && \
echo "export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH" >> /etc/profile
WORKDIR $GOPATH
