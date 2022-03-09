FROM ubuntu/nginx
USER root

COPY nginx.conf /etc/nginx/nginx.conf


WORKDIR /app


RUN  apt update &&  apt upgrade \
    && apt install curl -y 


# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash 
RUN /root/nvm_install.sh && \
  source /root/.bashrc && \
  cd /root && \
  nvm install 16.13.2 &&\
  npm install -g yarn


COPY package.json /app

RUN yarn

COPY . /app/


EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]