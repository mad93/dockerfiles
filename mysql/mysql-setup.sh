#!/bin/sh

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

apt-get update && apt-get install -y mysql-server && apt-get clean && rm -rf /var/lib/apt/lists/*

sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

/usr/sbin/mysqld &
sleep 5
echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'secret' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql