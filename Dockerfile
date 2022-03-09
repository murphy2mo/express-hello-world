FROM node:16.13.2
USER root


WORKDIR /app


RUN  apt update &&  apt upgrade \
    && apt install curl -y \ 
    && apt-get install wget -y \
    && npm install yarn -g

COPY package.json /app

RUN yarn

COPY . /app/



# Here, the change proposed:
# https://community.render.com/t/ssh-into-an-alpine-container-user-nobody-root/3335/2
# RUN chown nobody:nogroup /app \
#     && mkdir /.ssh \
#     && chown nobody:nogroup /.ssh \
#     && sed -ri 's/^(nobody.*:)\/sbin\/nologin$/\1\/bin\/sh/' /etc/passwd


EXPOSE 8081

CMD ["npm","run","dev"]