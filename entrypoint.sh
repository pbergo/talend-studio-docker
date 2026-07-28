#!/bin/bash

# Limpa travas antigas do VNC/X11 caso o container tenha sido reiniciado
rm -f /tmp/.X1-lock
rm -f /tmp/.X11-unix/X1

# Inicia o servidor D-Bus do sistema
service dbus start

# Inicia o TigerVNC como o usuário 'talenduser' na porta 5901 (Display :1)
su - talenduser -c "vncserver :1 -geometry 1280x800 -depth 24"

# Inicia a ponte noVNC (para acesso via navegador na porta 6080)
websockify --web /usr/share/novnc/ 6080 localhost:5901