FROM ubuntu

WORKDIR /app

# Here, the change proposed:
# https://community.render.com/t/ssh-into-an-alpine-container-user-nobody-root/3335/2
RUN chown nobody:nobody /app \
    && mkdir /.ssh \
    && chown nobody:nobody /.ssh \
    && sed -ri 's/^(nobody.*:)\/sbin\/nologin$/\1\/bin\/sh/' /etc/passwd

USER nobody:nobody

# COPY --from=build --chown=nobody:nobody /stuff ./

ENV HOME=/app
ADD start.sh ./

CMD ["./start.sh"]
