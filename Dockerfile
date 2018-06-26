FROM    farseer810/ubuntu:nginx
MAINTAINER farseer810 "https://github.com/farseer810/ubuntu-ali"

# install sshd and export port 22 by default
RUN apt-get install -y openssh-server && \
mkdir /var/run/sshd && \
echo 'root:root' | chpasswd && \
sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
mkdir /root/.ssh && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
