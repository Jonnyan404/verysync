FROM amd64/alpine
LABEL maintainer="www.jonnyan404.top:8088"
ENV TZ=Asia/Shanghai
WORKDIR /root
COPY files/verysync-linux-amd64-*.tar.gz /tmp

RUN apk add --no-cache tzdata bash \
    && tar -xzvf /tmp/verysync-linux-amd64-*.tar.gz -C /tmp \
    && chmod +x /tmp/verysync-linux-amd64-*/verysync \
    && mv /tmp/verysync-linux-amd64-*/verysync /usr/bin/ \
    && rm -rf /tmp

HEALTHCHECK --interval=1m --timeout=10s \
  CMD nc -z 127.0.0.1 8886  || exit 1
ENTRYPOINT ["/usr/bin/verysync","-no-browser","-home","/data","-gui-address"]
CMD [":8886"]
