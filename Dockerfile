FROM eclipse-temurin:11-jdk

#ENV TALEND_URL="https://download-mirror2.talend.com/tos/release/V8.0.1/TOS_DI-20211109_1610-V8.0.1.zip?mkt_tok=MzQ3LUlBVC02NzcAAAGLWQGRumrG8klT4RRQiQOs01DSPFe-4ZMR4Qini4mBLZGKWc5jAUXnaxhlGWoHlhyuB2qipVV4s5daD5skjHwNx4KqtC01IQHHDC8Odpv"
ENV TALEND_URL="https://storage.eu.cloud.talend.com/tmc-downloads-prod-eu-central-1/downloads/StudioInstallers/Talend-Studio-20260708_1430-V8.0.1.zip?response-content-disposition=Attachment%3B%20filename%3D%22Talend-Studio-20260708_1430-V8.0.1.zip%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260728T005810Z&X-Amz-SignedHeaders=host&X-Amz-Credential=tmc%2F20260728%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Expires=1800&X-Amz-Signature=105327abc1d8582ba8a0bcb26c130fcc3f1ce4891e04955194e21fe576366668"

#RUN apt-get update && \
#    apt-get install -y --no-install-recommends libwebkit2gtk-4.0-37 libswt-gtk-4-java libswt-cairo-gtk-4-jni libswt-webkit-gtk-4-jni && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libwebkit2gtk-4.1-0 libswt-gtk-4-java libswt-cairo-gtk-4-jni && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget "${TALEND_URL}" -O /tmp/talend.zip && \
    unzip /tmp/talend.zip -d /opt && \
    rm /tmp/talend.zip

#ENV PATH="/opt/TOS_DI-20211109_1610-V8.0.1:${PATH}"
ENV PATH="/opt/Talend-Studio-20260708_1430-V8.0.1:${PATH}"

#CMD ["/opt/TOS_DI-20211109_1610-V8.0.1/TOS_DI-linux-gtk-x86_64"]
CMD ["/opt/Talend-Studio-20260708_1430-V8.0.1/Talend-Studio-linux-gtk-x86_64"]

