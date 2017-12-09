## Project Page: https://github.com/ety001/btsbots-demo-2016
FROM ubuntu:16.04
MAINTAINER ety001 <ety001@domyself.me>
ADD sources.list /etc/apt/sources.list
ADD . /code
WORKDIR /code
RUN apt-get update && apt-get install -y curl \
        && 
