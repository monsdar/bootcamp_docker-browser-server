FROM docker:1.8

RUN apk update \
    && apk add --no-cache curl make gcc g++ python linux-headers paxctl libgcc libstdc++ gnupg python \
    && apk add nodejs \
    && apk add git \
    && npm install --global docker-browser-server

RUN cd /usr/local/ \
    && git config --system http.sslverify false \
    && git clone https://github.com/Blahah/command_line_bootcamp.git \
    && sed -i "s#location\.host\+'/'#location.host + location.pathname.replace(/\\\/$/,'') + '/' #" /usr/lib/node_modules/docker-browser-server/web/bundle.js \
    && sed -i "s#/bundle#bundle#" /usr/lib/node_modules/docker-browser-server/web/index.html

# Expose port 8080 (docker-browser-server)
EXPOSE :8080
