FROM node:9

WORKDIR /app


COPY package.json .
RUN npm install --force
RUN npm install --unsafe-perm node-sass
COPY . .
RUN npm install --unsafe-perm --per

USER node
EXPOSE 3000

CMD ["npm", "start"]
