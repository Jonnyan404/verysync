FROM amd64/alpine
LABEL maintainer="www.jonnyan404.top:8088"
ENV TZ=Asia/Shanghai
WORKDIR /root

RUN apk add --no-cache tzdata curl bash \
    &&curl http://www.verysync.com/shell/verysync-linux-installer/go-installer.sh > go-installer.sh \
    && chmod +x go-installer.sh \
    && ./go-installer.sh

ENTRYPOINT ["/usr/bin/verysync/verysync","-no-browser","-home","/data","-gui-address"]
CMD [":8886"]
