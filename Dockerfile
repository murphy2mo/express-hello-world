FROM ubuntu/nginx
USER root

COPY nginx.conf /etc/nginx/nginx.conf


WORKDIR /app


RUN  apt update &&  apt upgrade \
    && apt install curl -y \ 
    && apt-get install wget -y \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash 

RUN echo 'export NVM_DIR="$HOME/.nvm"' 
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> "$HOME/.bashrc"
RUN echo '[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion' >> "$HOME/.bashrc"

RUN nvm install 16.13.2                    && \
    npm install -g yarn

COPY package.json /app

RUN yarn

COPY . /app/


EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]