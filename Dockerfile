FROM ubuntu/nginx
USER root

COPY nginx.conf /etc/nginx/nginx.conf


WORKDIR /app


RUN  apt update &&  apt upgrade \
    && apt install curl -y \ 
    && apt-get install wget -y 

RUN export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ]
ENV NODE_VERSION 1

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm install -g yarn


COPY package.json /app

RUN yarn

COPY . /app/


EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]