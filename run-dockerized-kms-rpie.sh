## Enable X: -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -h $HOSTNAME -v /home/pi/.Xauthority:/home/pi/.Xauthority
## enable wayland: --device=/dev/dri/card0:/dev/dri/card0 --device=/dev/dri/renderD128:/dev/dri/renderD128 (or -v /dev:/dev)
## To enable keybpard/joysticks under KMS/DRM: -v /dev/input:/dev/input -v /run/udev:/run/udev -v /sys:/sys

## pass XDG* from suystemd_pam from host os to container: -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR -e XDG_SESSION_ID=$XDG_SESSION_ID -e XDG_SESSION_CLASS=$XDG_SESSION_CLASS -e XDG_SEAT=$XDG_SEAT -e XDG_VTNR=$XDG_VTNR -e XDG_SESSION_TYPE="tty"

## propably not needed: --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH

## NOTE: -v's / --priviledged -> no isolation security and otherwise provided by containerisation here... just move along.

docker container stop retrokms
docker container rm retrokms
docker run --privileged -v /dev:/dev -v /sys:/sys -v /run/user:/run/user -v /run/udev:/run/udev -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR -e XDG_SESSION_ID=$XDG_SESSION_ID -e XDG_SESSION_CLASS=$XDG_SESSION_CLASS -e XDG_SEAT=$XDG_SEAT -e XDG_VTNR=$XDG_VTNR -e XDG_SESSION_TYPE="tty" -h $HOSTNAME --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH --network=host --name retrokms -v /home/pi/RetroPie:/home/pi/RetroPie -it retrokms:3.1
