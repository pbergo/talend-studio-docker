# powershell
# Captura o IP do host e roda o container
#$ip = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "vEthernet (WSL)").IPAddress

docker run -it --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix pedrobergo/talend-studio:latest

