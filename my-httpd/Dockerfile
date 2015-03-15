FROM ubuntu:trusty

MAINTAINER Martina Weinzettel <mataw@outlook.sk>

# Update apt
RUN apt-get update

#install apache and php
RUN apt-get install -y apache2

RUN apt-get install -y php5 libapache2-mod-php5
RUN apt-get install -y php5-cli
RUN apt-get install -y php5-cgi
RUN apt-get install -y php5-mysql
RUN apt-get install -y php5-pgsql

#RUN sed -i 's|^DocumentRoot.*|DocumentRoot "/srv"|' /etc/apache2/apache2.conf

#update php config, allow php opening tags and quiten errors
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php5/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php5/apache2/php.ini

#enable apache mod
RUN a2enmod rewrite
RUN a2enmod php5

#only first time if getting error, ten again comment it
#RUN mkdir /var/lock/apache2

#manual setup enviroment variables for apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
#ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
#ENV APACHE_SERVERADMIN admin@localhost
#ENV APACHE_SERVERNAME localhost
#ENV APACHE_SERVERALIAS docker.localhost
#ENV APACHE_DOCUMENTROOT /var/www

#open port for web server
EXPOSE 80

#add index file from www to default site
ADD www /var/www/site

#add apache conf for default site
#make more for another virtual server if you need it
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

#run server
ENTRYPOINT /usr/sbin/apache2 -D FOREGROUND
