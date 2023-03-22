FROM webdevops/php-apache
ADD ./images /var/www/html/images
COPY . /var/www/html/
ENTRYPOINT apachectl -D FOREGROUND
ENV name Devops Balajik
