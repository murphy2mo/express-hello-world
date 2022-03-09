FROM ubuntu/nginx
USER root


WORKDIR /app
COPY nginx.conf /etc/nginx/nginx.conf


RUN sudo apt update && sudo apt upgrade \
    && sudo apt install curl \ 
    && sudo apt-get install wget \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Here, the change proposed:
# https://community.render.com/t/ssh-into-an-alpine-container-user-nobody-root/3335/2
# RUN chown nobody:nogroup /app \
#     && mkdir /.ssh \
#     && chown nobody:nogroup /.ssh \
#     && sed -ri 's/^(nobody.*:)\/sbin\/nologin$/\1\/bin\/sh/' /etc/passwd


EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]