FROM nginx:latest

WORKDIR /app

RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev

COPY fastcgi_server.c ./
COPY inner.sh ./

EXPOSE 81

ENTRYPOINT ["bash", "./inner.sh"]



