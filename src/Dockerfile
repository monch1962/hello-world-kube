FROM node:14.21.3-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
#COPY src/package*.json ./
#COPY src/* ./
#COPY src/components/* ./components/
#COPY src/html ./html/
#COPY src/tests ./tests/
#COPY src/helloworld.js .
COPY . ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8080
CMD [ "node", "helloworld.js" ]