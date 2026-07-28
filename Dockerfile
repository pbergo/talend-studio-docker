FROM eclipse-temurin:11-jdk

ENV TALEND_ZIP="./Talend-Studio-20260708_1430-V8.0.1.zip"

RUN apt-get update && \
    apt-get install -y --no-install-recommends libwebkit2gtk-4.1-0 libswt-gtk-4-java libswt-cairo-gtk-4-jni unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD "${TALEND_ZIP}" /tmp/talend.zip
RUN unzip /tmp/talend.zip -d /opt && \
    rm /tmp/talend.zip

ENV PATH="/opt/Talend-Studio-20260708_1430-V8.0.1:${PATH}"

CMD ["/opt/Talend-Studio-20260708_1430-V8.0.1/Talend-Studio-linux-gtk-x86_64"]
