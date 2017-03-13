# Docker container with openvas
FROM kalilinux/kali-linux-docker
MAINTAINER Cem Basoglu "cem.basoglu@web.de"

ENV DEBIAN_FRONTEND noninteractive
ENV OPENVAS_PASSWORD admin

# Install openvas
RUN apt-get -y update ; apt-get -y install openvas
RUN /usr/bin/openvas-setup
RUN /usr/sbin/openvasmd --user=admin --new-password=$OPENVAS_PASSWORD

# copy start script
ADD ./start.sh /start.sh

EXPOSE 9390 9391 9392

CMD /start.sh
