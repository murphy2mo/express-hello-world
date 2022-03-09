FROM node:16.13.2

RUN mkdir /.ssh
RUN chown nobody:nobody /.ssh
RUN sed -ri 's/^(nobody.*:)\/sbin\/nologin$/\1\/bin\/sh/' /etc/passwd
USER nobody:nobody

EXPOSE 8081

