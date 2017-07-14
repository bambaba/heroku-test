FROM node:alpine
ENV NODE_ENV production
ADD package.json ./

RUN apk add --update curl && \
    rm -rf /var/cache/apk/* && \
    curl -o- -L https://yarnpkg.com/install.sh | /bin/sh && \
    yarn --production

ADD . .

CMD ["yarn", "start"]