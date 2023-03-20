FROM php:7.2-apache
ADD ./images /var/www/html/images
COPY . /var/www/html/
CMD  'cp images/github3.jpg /var/www/html/images/'
ENTRYPOINT apachectl -D FOREGROUND
ENV name Devops Balajik
