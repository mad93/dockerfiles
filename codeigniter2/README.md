CodeIgniter 2.1

It is needed to link this image to the main mysql docker container

https://hub.docker.com/_/mysql/

docker run \
    --name mysql \
    -e MYSQL_ROOT_PASSWORD=my-secret-pw \
    -v /my/own/datadir:/var/lib/mysql \
    -d mysql:latest

docker run \
    --name codeigniter2 \
    --link mysql:mysql \
    --volume /your/html/directory:/var/www/html \
    --publish 80:80 \
    -d mad93/codeigniter2