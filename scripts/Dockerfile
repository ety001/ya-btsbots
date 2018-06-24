FROM alpine:3.7
WORKDIR /app
RUN apk --no-cache add python3 python3-dev gcc make musl-dev openssl openssl-dev ca-certificates && \
        pip3 install bts pymongo
