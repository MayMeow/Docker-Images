#!/bin/sh

sudo docker run -d -p 80 -v /home/mataw/public_html:/var/www/site httpd-php:1
