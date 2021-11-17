FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get -y install apache2

COPY /app/index.html /var/www/html/index.html
COPY /app/style.css /var/www/html/style.css
COPY /app/icon.png /var/www/html/icon.png

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
