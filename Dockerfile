FROM node:14-alpine

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        make \
        automake \
        autoconf \
        libtool \
        libpng \
        zlib-dev \
        pkgconfig \
        libpng-dev \
        nasm \
        g++ \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

WORKDIR /app
COPY . .

RUN yarn setup
RUN yarn build

EXPOSE 3000

CMD [ "yarn", "dev" ]
