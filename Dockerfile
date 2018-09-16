FROM node:8.10.0-alpine

RUN mkdir -p /usr/app/build
WORKDIR /usr/app

COPY package.json .
RUN npm install --force
RUN npm install --unsafe-perm node-sass
COPY . .
RUN npm install --unsafe-perm --per

EXPOSE 3000

CMD ["npm", "start"]
