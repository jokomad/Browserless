
# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.18-v4

WORKDIR /tmp
COPY rootfs/ /

# Install xterm.
RUN add-pkg chromium-swiftshader

# Copy the start script.
#COPY Startapp.sh /startapp.sh

# Set the name of the application.
RUN set-cont-env APP_NAME "chromium-browser"
