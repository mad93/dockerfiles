FROM ubuntu:14.04
MAINTAINER Marc Serra <mserra@wakatagroup.com>
RUN apt-get update
# install the prerequisite patches here so that rvm will install under non-root account. 
RUN apt-get install -y curl patch gawk g++ gcc make libc6-dev patch libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

#Add user app to sudoers
RUN useradd -ms /bin/bash app -G sudo
RUN echo "app ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER app


ENV RUBY_VERSION 1.8.7

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN /bin/bash -l -c "curl -L get.rvm.io | bash -s stable"
RUN /bin/bash -l -c "rvm install ${RUBY_VERSION}"
RUN /bin/bash -l -c "echo 'gem: --no-ri --no-rdoc' > ~/.gemrc"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

USER root

# Remove user app from sudoers
RUN gpasswd -d app sudo
RUN head -n -1 /etc/sudoers

# Nginx configuration
RUN apt-get install -y nginx

RUN /bin/bash -l -c "mkdir /var/app-socket"
RUN /bin/bash -l -c "chown app:app -R /var/app-socket"
RUN /bin/bash -l -c "mkdir -p /var/www/app"
RUN /bin/bash -l -c "chown app:app -R /var/www/app"

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

# The whole point is to expose a http server
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]