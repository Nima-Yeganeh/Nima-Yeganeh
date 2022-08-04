

FROM alpine
LABEL maintainer="nimayeganeh"
RUN apk add --no-cache apache2 && \
mkdir -p /run/apache2 && \
echo "<html><h1>Docker Test</h1></html>" > \
/var/www/localhost/htdocs/index.html
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

