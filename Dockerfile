#FROM --platform=linux/386 jlesage/baseimage-gui:debian-11-v4.5
#FROM --platform=linux/amd64 jlesage/baseimage-gui:debian-11-v4.5
FROM jlesage/baseimage-gui:alpine-3.18-v4.5.2





RUN add-pkg chromium
#RUN add-pkg file-roller

#RUN apt-get update
#RUN apt-get install chromium -y

COPY startapp.sh /startapp.sh
RUN chmod +x /startapp.sh


COPY 1.tar.gz.parttaa /config/1.tar.gz.parttaa
COPY 1.tar.gz.parttab /config/1.tar.gz.parttab

RUN cat /config/1.tar.gz.partta* >/config/1.tar.gz
#RUN mkdir /config/1
RUN cd /config && tar -xf /config/1.tar.gz 




ENV DISPLAY_WIDTH=1024
ENV DISPLAY_HEIGHT=768

