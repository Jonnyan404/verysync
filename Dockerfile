FROM alpine
LABEL maintainer="www.mrdoc.fun"
ENV TZ=Asia/Shanghai \
    PORT=8886 \
    VUID=0
WORKDIR /app

# 设置构建参数
ARG TARGETPLATFORM
ARG VERSION

# 复制通用文件
COPY docker-entrypoint.sh /app/

# 根据平台复制对应的 verysync 文件
COPY files/verysync-linux-amd64-v${VERSION}.tar.gz /tmp/verysync-amd64.tar.gz
COPY files/verysync-linux-arm64-v${VERSION}.tar.gz /tmp/verysync-arm64.tar.gz
COPY files/verysync-linux-arm-${VERSION}.tar.gz /tmp/verysync-arm.tar.gz

# 安装依赖并根据平台解压相应的文件
RUN apk add --no-cache tzdata bash \
    && mkdir -p /data \
    && chmod 777 /data \
    && addgroup -S nonverysync && adduser -S nonverysync -G nonverysync \
    && chmod +x /app/docker-entrypoint.sh \
    && if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
        tar -xzvf /tmp/verysync-amd64.tar.gz -C /tmp && \
        chmod +x /tmp/verysync-linux-amd64-*/verysync && \
        mv /tmp/verysync-linux-amd64-*/verysync /usr/bin/; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
        tar -xzvf /tmp/verysync-arm64.tar.gz -C /tmp && \
        chmod +x /tmp/verysync-linux-arm64-*/verysync && \
        mv /tmp/verysync-linux-arm64-*/verysync /usr/bin/; \
    elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then \
        tar -xzvf /tmp/verysync-arm.tar.gz -C /tmp && \
        chmod +x /tmp/verysync-linux-arm-*/verysync && \
        mv /tmp/verysync-linux-arm-*/verysync /usr/bin/; \
    fi \
    && rm -rf /tmp/*

# 安装 gosu (根据平台选择不同版本)
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
        wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.17/gosu-amd64"; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
        wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.17/gosu-arm64"; \
    elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then \
        wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.17/gosu-armhf"; \
    fi \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true

HEALTHCHECK --interval=1m --timeout=10s \
  CMD nc -z 127.0.0.1 ${PORT}  || exit 1

ENTRYPOINT ["/app/docker-entrypoint.sh"]