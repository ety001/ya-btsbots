FROM mhart/alpine-node:4.8.3
ENV BUILD_PACKAGES="python make gcc g++ git libuv bash curl tar bzip2" \
	MONGO_URL="mongodb://192.168.31.10:27017/meteor" \
	ROOT_URL="http://tai.to0l.cn:3000" \
	PORT="3000"
RUN apk --no-cache add ${BUILD_PACKAGES} \
	&& mkdir -p /root \
	&& mkdir -p /app \
	&& npm install -g npm@4 \
	&& npm install -g node-gyp \
	&& node-gyp install
ADD bundle /app
RUN cd /app/programs/server && npm install
RUN apk --no-cache add openntpd tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && ntpd -n
EXPOSE 3000
CMD ["/app/run.sh"]
