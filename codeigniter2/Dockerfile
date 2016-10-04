# A basic apache server with PHP. To use either add or bind mount content under /var/www

FROM mad93/apache2-php5

MAINTAINER Marc Serra <mserra@wakatagroup.com>

RUN mkdir -p /var/www/httpsdocs
RUN chown www-data:www-data -R /var/www

COPY ./apache2.conf /etc/apache2/
COPY ./httpd.conf /etc/apache2/
COPY ./rewrite.load /etc/apache2/mods-enabled/
COPY ./default /etc/apache2/sites-available/

VOLUME [ "/var/www" ]

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
