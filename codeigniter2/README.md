CodeIgniter 2.1

The main mysql docker container is needed linked to this image 
Please note that the main folder for apache is set to /var/www/httpsdocs
That folder should exist inside the folder you want to mount with your container.

docker run \
    --name mysql \
    -e MYSQL_ROOT_PASSWORD=my-secret-pw \
    -v /your/starting/sql/files:/docker-entrypoint-initdb.d \
    -v /my/own/datadir:/var/lib/mysql \
    -d mysql:latest

docker run \
    --name codeigniter2 \
    --link mysql:mysql \
    --volume /your/html/directory:/var/www/ \
    --publish 80:80 \
    -d mad93/codeigniter2