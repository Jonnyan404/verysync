FROM amd64/alpine
LABEL maintainer="www.jonnyan404.top:8088"
ENV TZ=Asia/Shanghai
WORKDIR /root
COPY files/verysync-linux-amd64-latest.tar.gz /tmp

RUN apk add --no-cache tzdata bash \
    && tar -xvf /tmp/verysync-linux-amd64-latest.tar.gz -C /tmp \
    && chmod +x /tmp/verysync-linux-amd64-*/verysync \
    && mv /tmp/verysync-linux-amd64-*/verysync /usr/bin/ \
    && rm -rf /tmp

ENTRYPOINT ["/usr/bin/verysync","-no-browser","-home","/data","-gui-address"]
CMD [":8886"]
