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
