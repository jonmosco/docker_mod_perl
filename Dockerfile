FROM httpd:2.4

RUN apt-get update && apt-get install less libapache2-mod-perl2 libapache2-mod-apreq2 -y
RUN cp /usr/lib/apache2/modules/mod_perl.so /usr/local/apache2/modules/
RUN cp /usr/lib/apache2/modules/mod_apreq2.so /usr/local/apache2/modules/
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf
COPY ./perl.conf /usr/local/apache2/conf/extra/perl.conf
ADD ./public-html/ /usr/local/apache2/htdocs/
EXPOSE 80
