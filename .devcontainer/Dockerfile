FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# install dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata curl ca-certificates fontconfig locales python-is-python3 libxml2-utils netcat-traditional unzip wget \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_VERSION=jdk-21.0.5+11
ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"

# install Temurin OpenJDK 21
# RUN set -eux; \
#     ARCH="$(dpkg --print-architecture)"; \
#     case "${ARCH}" in \
#        amd64) \
#          ESUM='3c654d98404c073b8a7e66bffb27f4ae3e7ede47d13284c132d40a83144bfd8c'; \
#          BINARY_URL='https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.5%2B11/OpenJDK21U-jdk_x64_linux_hotspot_21.0.5_11.tar.gz'; \
#          ;; \
#        arm64) \
#          ESUM='6482639ed9fd22aa2e704cc366848b1b3e1586d2bf1213869c43e80bca58fe5c'; \
#          BINARY_URL='https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.5%2B11/OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.5_11.tar.gz'; \
#          ;; \
#        ppc64el) \
#          ESUM='3c6f4c358facfb6c19d90faf02bfe0fc7512d6b0e80ac18146bbd7e0d01deeef'; \
#          BINARY_URL='https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.5%2B11/OpenJDK21U-jdk_ppc64le_linux_hotspot_21.0.5_11.tar.gz'; \
#          ;; \
#        s390x) \
#          ESUM='51a7ca42cc2e8cb5f3e7a326c28912ee84ff0791a1ca66650a8c53af07510a7c'; \
#          BINARY_URL='https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.5%2B11/OpenJDK21U-jdk_s390x_linux_hotspot_21.0.5_11.tar.gz'; \
#          ;; \
#        *) \
#          echo "Unsupported arch: ${ARCH}"; \
#          exit 1; \
#          ;; \
#     esac; \
#     curl -LfsSo /tmp/openjdk.tar.gz ${BINARY_URL}; \
#     echo "${ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -; \
#     mkdir -p /opt/java/openjdk; \
#     cd /opt/java/openjdk; \
#     tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
#     rm -rf /tmp/openjdk.tar.gz; \
#     java -Xshare:dump;

LABEL maintainer="WSO2 Docker Maintainers <dev@wso2.org>" \
      com.wso2.docker.source="https://github.com/wso2/docker-apim/releases/tag/v4.5.0.1"

# Set working directory
WORKDIR /workspace

# Install MySQL client (optional, for debugging)
RUN sudo apt update && sudo apt install default-mysql-client -y

# # Set JVM options to suppress SVE warnings
# ENV JAVA_TOOL_OPTIONS="-XX:UseSVE=0"

# Default command (keeps the container running)
CMD ["sleep", "infinity"]
