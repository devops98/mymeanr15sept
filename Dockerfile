FROM node:9

WORKDIR /app


COPY package.json .
RUN npm install --force
RUN npm install --unsafe-perm node-sass
RUN npm install --unsafe-perm --per

COPY . .
RUN npm test
USER node
EXPOSE 3000

CMD ["npm", "start"]
