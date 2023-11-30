# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.18-v4

# Install xterm.
RUN add-pkg chromium-swiftshader

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
RUN set-cont-env APP_NAME "chromium-swiftshader"

CMD exec /usr/bin/chromium-browser --user-data-dir=/config --no-sandbox --disable-setuid-sandbox --disable-gpu --disable-dev-shm-usage
