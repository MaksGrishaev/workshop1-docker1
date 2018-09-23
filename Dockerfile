FROM ubuntu:18.04

ENV APACHE_LOG_DIR=/var/log/apache2/
ENV APACHE_RUN_DIR=/etc/apache2/
ENV APACHE_PID_FILE=/var/run/apache2.pid
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data

RUN apt-get update -y && apt-get -y install apache2

RUN a2enmod proxy && \
    a2enmod proxy_http && \
    a2enmod proxy_balancer && \
    a2enmod lbmethod_byrequests

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

