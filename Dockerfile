



ENV VNC_SERVER "localhost:5800"

FROM jlesage/baseimage-gui:alpine-3.18-v4.5.2

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=

# Define software versions.
ARG FIREFOX_VERSION=119.0-r0
#ARG PROFILE_CLEANER_VERSION=2.36

# Define software download URLs.
#ARG PROFILE_CLEANER_URL=https://github.com/graysky2/profile-cleaner/raw/v${PROFILE_CLEANER_VERSION}/common/profile-cleaner.in

# Define working directory.
WORKDIR /tmp

# Install Firefox.
RUN \
#    add-pkg --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
#            --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
#            --upgrade firefox=${FIREFOX_VERSION}
     add-pkg firefox=${FIREFOX_VERSION}

# Install extra packages.
RUN \
    add-pkg \
        # WebGL support.
        mesa-dri-gallium \
        # Icons used by folder/file selection window (when saving as).
        adwaita-icon-theme \
        # A font is needed.
        font-dejavu \
        # The following package is used to send key presses to the X process.
        xdotool \
        git \
        && \
    # Remove unneeded icons.
    find /usr/share/icons/Adwaita -type d -mindepth 1 -maxdepth 1 -not -name 16x16 -not -name scalable -exec rm -rf {} ';' && \
    true

RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/noVNC /root/noVNC && \
    git clone https://github.com/novnc/websockify /root/noVNC/utils/websockify

RUN cp /root/noVNC/vnc.html /root/noVNC/index.html

RUN sed -i "/wait ${proxy_pid}/i if [ -n \"\$AUTOCONNECT\" ]; then sed -i \"s/'autoconnect', false/'autoconnect', '\$AUTOCONNECT'/\" /root/noVNC/app/ui.js; fi" /root/noVNC/utils/novnc_proxy

RUN sed -i "/wait ${proxy_pid}/i if [ -n \"\$VNC_PASSWORD\" ]; then sed -i \"s/WebUtil.getConfigVar('password')/'\$VNC_PASSWORD'/\" /root/noVNC/app/ui.js; fi" /root/noVNC/utils/novnc_proxy

RUN sed -i "/wait ${proxy_pid}/i if [ -n \"\$VIEW_ONLY\" ]; then sed -i \"s/UI.rfb.viewOnly = UI.getSetting('view_only');/UI.rfb.viewOnly = \$VIEW_ONLY;/\" /root/noVNC/app/ui.js; fi" /root/noVNC/utils/novnc_proxy

ENTRYPOINT [ "bash", "-c", "/root/noVNC/utils/novnc_proxy --vnc ${VNC_SERVER}" ]
