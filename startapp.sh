#!/bin/sh
#exec mkdir -p /tmp/1;
#exec tar -xf /1.tar.gz -C /tmp/1
#exec chromium --renderer-process-limit=2  --origin-trial-disabled-features=WebGPU --disable-partial-raster --disable-mipmap-generation --render-process-limit=1 --disable-zero-copy --media-router=0 --disable-pings --no-default-browser-check --debug-devtools-frontend=0 --render-process-limit=1 --disable-zero-copy --disable-partial-raster --disable-mipmap-generation --memory-model=low --disable-features=GlobalMediaControls --disable-browser-side-navigation --disable-dev-shm-usage --disable-gpu --disable-software-rasterizer --no-sandbox --user-data-dir=/home/j/1 --disable-site-isolation-trials --enable-low-end-device-mode --renderer-process-limit=1
exec chromium freebitco.in/?op=home --user-data-dir=/config/1 --disable-gpu --disable-software-rasterizer --no-sandbox --allow-running-insecure-content --disable-add-to-shelf --disable-background-networking --disable-background-timer-throttling --disable-backgrounding-occluded-windows --disable-breakpad --disable-checker-imaging --disable-client-side-phishing-detection --disable-component-extensions-with-background-pages --disable-datasaver-prompt --disable-desktop-notifications --disable-dev-shm-usage --disable-domain-reliability --disable-hang-monitor --disable-infobars --disable-ipc-flooding-protection --disable-notifications --disable-popup-blocking --disable-prompt-on-repost --disable-renderer-backgrounding --disable-setuid-sandbox --disable-site-isolation-trials --disable-sync --disable-web-security --enable-automation --ignore-certificate-errors --disable-logging --metrics-recording-only --mute-audio --no-default-browser-check --no-first-run --test-type --use-mock-keychain &
sleep 240
kill "$!"
#exec file-roller 
#
#
