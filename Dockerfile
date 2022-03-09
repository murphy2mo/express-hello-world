FROM ubuntu/nginx
USER root

COPY nginx.conf /etc/nginx/nginx.conf


WORKDIR /app


RUN  apt update &&  apt upgrade \
    && apt install curl -y \ 
    && apt-get install wget -y 

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

RUN nvm install 16.13.2 \
    && npm install -g yarn

COPY package.json /app

RUN yarn

COPY . /app/


EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]