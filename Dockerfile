FROM node:latest
LABEL version=1.1.0

EXPOSE 19000
EXPOSE 19001

ENV ADB_IP="172.20.3.48"
ENV REACT_NATIVE_PACKAGE_HOSTNAME="172.20.10.129"

RUN apt-get update && \
    apt-get install android-tools-adb -y
WORKDIR /app

COPY package.json yarn.lock app.json ./
RUN yarn --network-timeout 100000
CMD adb connect $ADB_IP && \
    yarn run android