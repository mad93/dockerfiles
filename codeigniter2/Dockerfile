# A basic apache server with PHP. To use either add or bind mount content under /var/www

FROM mad93/apache2-php5

MAINTAINER Marc Serra <mserra@wakatagroup.com>

RUN apt-get update && apt-get install -y php5 libapache2-mod-php5 php5-mysql php5-cli && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./apache2.conf /etc/apache2/

VOLUME [ "/var/www/html", "/etc/apache2" ]

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
