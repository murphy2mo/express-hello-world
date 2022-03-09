FROM ubuntu/nginx
USER root

COPY nginx.conf /etc/nginx/nginx.conf


WORKDIR /app


RUN  apt update &&  apt upgrade \
    && apt install curl -y 


# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash 

COPY . /app/


EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]