FROM nginx:latest

WORKDIR /app

COPY fastcgi_server.c ./
COPY inner.sh ./

RUN apt-get update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    rm -rf /var/lib/apt/lists && \
    useradd -m -s /bin/bash kill0 && \
    touch /var/run/nginx.pid && \
    chmod g-s /usr/bin/expiry && \
    chmod g-s /usr/sbin/unix_chkpwd && \
    chmod g-s /usr/bin/chage && \
    chown -R kill0:kill0 /app /var/run/nginx.pid && \
    chown -R kill0:kill0 /var/cache/nginx && \
    chmod u-s /usr/bin/gpasswd /usr/bin/chsh /usr/bin/chfn /usr/bin/passwd /sbin/unix_chkpwd /usr/bin/chage /usr/bin/wall /bin/umount /bin/mount /usr/bin/newgrp /bin/su

USER kill0

HEALTHCHECK --interval=30s --timeout=10s --start-period=30s \
    CMD curl -f http://localhost:81/ || exit 1

# EXPOSE 81

ENTRYPOINT ["bash", "./inner.sh"]



