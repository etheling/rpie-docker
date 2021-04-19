## Enable X: -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -h $HOSTNAME -v /home/pi/.Xauthority:/home/pi/.Xauthority
## enable wayland: --device=/dev/dri/card0:/dev/dri/card0 --device=/dev/dri/renderD128:/dev/dri/renderD128
## enable joysticks -v /dev/input:/dev/input
docker container stop retroxland
docker container rm retroxland
docker run -v /dev:/dev --privileged -v /run/user:/run/user -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR -e XDG_SESSION_TYPE=wayland -e XDG_SET=$XDG_SEAT -e XDG_CURRENT_DESKTOP=$XDG_CURRENT_DESKTOP -e XDG_SESSION_CLASS=user -e XDG_VTNR=$XDG_VTNR -e XDG_SESSION_ID=$XDG_SESSION_ID -h $HOSTNAME -v /home/pi/.Xauthority:/home/pi/.Xauthority  --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH  --network=host --name retroxland -v /home/pi/RetroPie:/home/pi/RetroPie -it retroxland:1.16 bash
