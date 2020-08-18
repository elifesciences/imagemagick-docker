FROM alpine:3.7

RUN apk add imagemagick --update

ENTRYPOINT ["/usr/bin/convert"]