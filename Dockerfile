FROM resin/rpi-raspbian:latest  
ENTRYPOINT []

RUN apt-get update && \  
    apt-get -qy install curl \
                build-essential python \
                ca-certificates
WORKDIR /root/  
RUN curl -O \  
  https://nodejs.org/dist/v4.5.0/node-v4.5.0-linux-armv6l.tar.gz
RUN tar -xvf node-*.tar.gz -C /usr/local \  
  --strip-components=1

HEALTHCHECK --interval=10s --timeout=3s CMD ./health.sh

ADD ./package.json package.json

RUN npm install
ADD ./health.sh health.sh 
ADD ./app.js app.js

CMD ["node", "./app.js"]  
