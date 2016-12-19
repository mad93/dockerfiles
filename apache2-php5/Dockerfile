# A basic apache server with PHP. To use either add or bind mount content under /var/www

FROM mad93/apache2

MAINTAINER Marc Serra <mserra@wakatagroup.com>

RUN apt-get update && apt-get install -y php5 libapache2-mod-php5 php5-mysql php5-cli php5-gd php5-curl && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
