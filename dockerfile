
# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.18-v4

# Install xterm.
RUN add-pkg chromium-swiftshader

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
RUN set-cont-env APP_NAME "chromium-swiftshader"
