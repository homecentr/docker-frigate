FROM blakeblackshear/frigate:0.11.0-0e9c8a4

ARG USER_UID=1000
ARG USER_GID=1000

RUN apt-get update && \
    apt-get install -y --no-install-recommends supervisor=4.1.0-1ubuntu1 && \
    addgroup --gid 1000 nonroot && \
    adduser -u 1000 -G nonroot -D -H -g "" nonroot && \
    ln -sf /dev/stdout /usr/local/nginx/logs/access.log && \
    ln -sf /dev/stderr /usr/local/nginx/logs/error.log && \
    rm -rf /etc/services.d && \
    rm -rf /etc/conf-init.d && \
    rm -rf /etc/conf-finish.d && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/apt && \
    rm -rf /var/lib/dpkg && \
    rm -rf /var/lib/cache && \
    rm -rf /var/lib/log

COPY ./root/ /

USER ${USER_UID}:${USER_GID}

EXPOSE 5000
EXPOSE 1935

ENTRYPOINT [ "supervisord", "-c", "/etc/supervisor.conf" ]