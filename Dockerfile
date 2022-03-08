FROM node:16.13.2
WORKDIR /app
COPY . /app
RUN npm install

EXPOSE 8081
CMD 'node app.js'