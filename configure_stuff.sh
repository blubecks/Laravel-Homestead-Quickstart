#!/bin/bash
PHPMYADMIN_HOSTNAME="phpmyadmin.local"

if [ ! -d  "$(pwd)/phpmyadmin" ]; then
 echo 'Downloading phpMyAdmin 4.7.5'
 curl -#L https://files.phpmyadmin.net/phpMyAdmin/4.7.5/phpMyAdmin-4.7.5-english.tar.gz -o phpmyadmin.tar.gz

 mkdir phpmyadmin && tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1

 rm phpmyadmin.tar.gz

 CMD=/vagrant/vendor/laravel/homestead/scripts/serve-laravel.sh
 CMD_CERT=/vagrant/vendor/laravel/homestead/scripts/create-certificate.sh 

 if [ ! -f $CMD ]; then
     # Fallback for older Homestead versions
     CMD=/vagrant/scripts/serve.sh
 else
     # Create an SSL certificate
     sudo bash $CMD_CERT $PHPMYADMIN_HOSTNAME
 fi
 sudo bash $CMD $PHPMYADMIN_HOSTNAME $(pwd)/phpmyadmin
 echo 'phpMyAdmin ready'
 sudo sed -i -e 's/fastcgi_pass.*/fastcgi_pass unix:\/var\/run\/php\/php7.0-fpm.sock;/g' /etc/nginx/sites-available/$PHPMYADMIN_HOSTNAME
 sudo service nginx reload
 sudo service php7.0-fpm reload
fi

echo "I am going to create the Database"
mysql -u homestead <<MYSQL_SCRIPT
CREATE DATABASE local;
CREATE USER 'local'@'localhost' IDENTIFIED BY 'local';
GRANT ALL PRIVILEGES ON local.* TO 'local'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL user created."
echo "Username:   local"
echo "Password:   local"

echo "Updating .env file with new credentials"
cp $(pwd)/.env.example $(pwd)/.env
sed -i -e 's/DB_DATABASE=homestead/DB_DATABASE=local/g' $(pwd)/.env
sed -i -e 's/DB_USERNAME=homestead/DB_USERNAME=local/g' $(pwd)/.env
sed -i -e 's/DB_PASSWORD=secret/DB_PASSWORD=local/g' $(pwd)/.env


echo "Key generation"
php $(pwd)/artisan key:generate
