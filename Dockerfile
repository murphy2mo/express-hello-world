FROM nginx

WORKDIR /app
COPY nginx.conf /etc/nginx/nginx.conf



# Here, the change proposed:
# https://community.render.com/t/ssh-into-an-alpine-container-user-nobody-root/3335/2
RUN chown nobody:nogroup /app \
    && mkdir /.ssh \
    && chown nobody:nogroup /.ssh \
    && sed -ri 's/^(nobody.*:)\/sbin\/nologin$/\1\/bin\/sh/' /etc/passwd

USER nobody:nogroup

EXPOSE 80 443

CMD ["nginx","-g","daemon off;"]