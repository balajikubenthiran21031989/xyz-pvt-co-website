FROM kkbalajius/k8s-case-study
RUN apt-get update
RUN apt-get -y install apache2
RUN apt-get clean
COPY ./images /var/www/html/images
COPY . /var/www/html/
EXPOSE 80
ENTRYPOINT apachectl -D FOREGROUND
ENV name Devops Balajik
