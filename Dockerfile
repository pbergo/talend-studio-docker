FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

# 1. Instala Xvfb (Virtual Framebuffer), x11vnc, noVNC, XFCE e dependências Java/GTK
RUN apt-get update && apt-get install -y \
    xvfb \
    x11vnc \
    xfce4 \
    xfce4-goodies \
    novnc \
    websockify \
    dbus-x11 \
    sudo \
    curl \
    wget \
    openjdk-17-jdk \
    libgtk-3-0 \
    libglu1-mesa \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 2. Cria usuário
RUN useradd -m -s /bin/bash talenduser && \
    echo "talenduser:talend123" | chpasswd && \
    usermod -aG sudo talenduser

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6080

ENTRYPOINT ["/entrypoint.sh"]