allow_local_connections:
	@echo "Allowing local connections"
	- xhost +local:root

run:
	@echo "Setting DISPLAY"
	- docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix pedrobergo/talend-studio:latest

