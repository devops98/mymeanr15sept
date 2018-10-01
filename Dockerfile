FROM node:8.10.0-alpine
MAINTAINER devops98

RUN mkdir /opt/meanstackjs
WORKDIR /opt/meanstackjs

# Install npm packages
ADD package.json /opt/meanstackjs/package.json
RUN apk add --no-cache python make gcc g++ curl && npm install --quiet
RUN npm install --production  --force --unsafe-perm  --per node-sass && npm rebuild node-sass

# Share local directory on the docker container
ADD . /opt/meanstackjs

# Set development environment as default
ENV NODE_ENV production

RUN cd  /opt/meanstackjs/tools/livereload && rm -rf node_modules && npm install

# Ports generic
EXPOSE 80:80
EXPOSE 443:443

# Port 3000 for Meanstackjs server
EXPOSE 3000:3000

# Port 5858 for node debug
EXPOSE 5858:5858

# Port 35729 for livereload
EXPOSE 35729:35729

# Run Meanstackjs server
CMD ["npm", "start"]

