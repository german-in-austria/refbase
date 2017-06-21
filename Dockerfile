FROM php:5.6-apache

RUN apt-get update -y && \
  apt-get install nano -y && \
  apt-get install bibutils -y

RUN curl -L 'https://downloads.sourceforge.net/project/refbase/refbase/refbase-0.9.6/refbase-0.9.6.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Frefbase%2Ffiles%2F&ts=1498047916&use_mirror=10gbps-io' > refbase.tar
RUN mkdir /src
RUN tar -C /src -xzf refbase.tar

# COPY config/php.ini /usr/local/etc/php/
RUN mv /src/refbase-0.9.6/* /var/www/html/

COPY ./initialize /var/www/html/initialize
