FROM blakeblackshear/frigate:stable-amd64

ARG USER_UID=1000
ARG USER_GID=1000

RUN apt-get update && \
    apt-get install supervisor && \
    addgroup --gid 1000 nonroot && \
    adduser -u 1000 -G nonroot -D -H -g "" nonroot && \
    ln -sf /dev/stdout /usr/local/nginx/logs/access.log && \
    ln -sf /dev/stderr /usr/local/nginx/logs/error.log && \
    # ln -sf /tmp /usr/local/nginx/client_body_temp && \
    # ln -sf /tmp /usr/local/nginx/proxy_temp && \
    # ln -sf /tmp /usr/local/nginx/fastcgi_temp && \
    # ln -sf /tmp /usr/local/nginx/uwsgi_temp && \
    # ln -sf /tmp /usr/local/nginx/scgi_temp && \
    rm -rf /etc/services.d && \
    rm -rf /etc/conf-init.d && \
    rm -rf /etc/conf-finish.d && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY ./root/ /

USER ${USER_UID}:${USER_GID}

EXPOSE 5000
EXPOSE 1935

ENTRYPOINT [ "supervisord", "-c", "/etc/supervisor.conf" ]