# FROM openjdk:16-jdk-alpine
FROM ubuntu

LABEL maintainer="superpaxxs@hotmail.com"


ENV LANG C.UTF-8
ENV TZ Asia/Shanghai

WORKDIR /mirai

# RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list
# RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apt-get update && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get install -y --no-install-recommends \
    tzdata \
    ca-certificates \
    dirmngr \
    gnupg \
    wget \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# RUN  apk add --no-cache ca-certificates && \
#      apk add --no-cache curl bash tree tzdata php7-openssl php7 php7-curl php7-json expect openjdk8 git && \
#      cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime\
#      && apk del tzdata \
#      && chmod +x /init.sh

# COPY device.json.example device.json

RUN set -eux; \
    mkdir -p plugins/MiraiAPIHTTP; \
    wget http://t.imlxy.net:64724/mirai/MiraiOK/miraiOK_linux_amd64 -O miraiOK; \
    wget https://github.wuyanzheshui.workers.dev/project-mirai/mirai-api-http/releases/download/v1.7.4/mirai-api-http-v1.7.4.jar -O plugins/mirai-api-http-v1.7.4.jar;

RUN set -eux; \
    ls -lah; \
    chmod +x /mirai/miraiOK; \
    ./miraiOK; \
    chmod +x /workdir/jre/bin/java
    # chmod +x /workdir/jre/bin/java /workdir/entry.sh

CMD [ "/mirai/miraiOK" ]