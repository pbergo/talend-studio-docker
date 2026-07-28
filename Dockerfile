# 1. Atualizado para Java 17 para resolver o erro UnsupportedClassVersionError (versão 61.0)
FROM eclipse-temurin:17-jdk

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libwebkit2gtk-4.1-0 \
        libswt-gtk-4-java \
        libswt-cairo-gtk-4-jni \
        unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 2. Copia o arquivo .zip local que está na mesma pasta do Dockerfile
COPY Talend-Studio-20260708_1430-V8.0.1.zip /tmp/talend.zip

# 3. Descompacta e remove o zip
RUN unzip /tmp/talend.zip -d /opt && \
    rm /tmp/talend.zip

# 4. Configuração das variáveis de ambiente e comando de execução
ENV PATH="/opt/Talend-Studio-20260708_1430-V8.0.1:${PATH}"

CMD ["/opt/Talend-Studio-20260708_1430-V8.0.1/Talend-Studio-linux-gtk-x86_64"]