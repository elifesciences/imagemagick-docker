FROM alpine:3.12

RUN apk add imagemagick --update

ENTRYPOINT ["/usr/bin/convert"]