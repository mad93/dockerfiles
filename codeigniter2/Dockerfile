# A basic apache server with PHP. To use either add or bind mount content under /var/www

FROM mad93/apache2-php5

MAINTAINER Marc Serra <mserra@wakatagroup.com>

ADD ./setup.sh /tmp/setup.sh
RUN /bin/sh /tmp/setup.sh

COPY ./apache2.conf /etc/apache2/

VOLUME [ "/var/www/html" ]

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
