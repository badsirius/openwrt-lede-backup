完全来自：SHUTUP的http://www.jianshu.com/p/23fa1d177a20

mkdir mydockerbuild
cd ./mydockerbuild
vi Dockerfilesh

FROM alpine:3.3

ENV GOLANG_VERSION 1.4.2
ENV GOLANG_SRC_URL https://github.com/gomini/go-mips32.git
ENV GOOS linux
ENV GOARCH mips32
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN apk update
RUN set -ex \
    && apk add \
        bash \
        git \
        file \
        ca-certificates \
        gcc \
        musl-dev \
        openssl \
        openssh \
    \
  && cd /usr/local/ \
    && git clone "$GOLANG_SRC_URL" go \
    && cd /usr/local/go/src \
    && ./make.bash 

RUN rm -rf "$GOROOT/test"
RUN rm -rf "$GOROOT/doc"
RUN mkdir -p "$GOPATH/src" "$GOPATH/pkg" "$GOPATH/bin" 
RUN chmod -R 777 "$GOPATH"
WORKDIR $GOPATH/src


创建镜像
docker build -t docker-go-mips32 .

docker run -t -i docker-go-mips32 /bin/sh


