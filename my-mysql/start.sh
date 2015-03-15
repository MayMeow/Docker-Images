#!/bin/sh

sudo docker run -d -p 3306 -v /home/mataw/data/mysql:/var/lib/mysql my-mysql:3
