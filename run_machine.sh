composer install
php vendor/bin/homestead make
sed -i -e 's/map: homestead.test/map: homestead.local/g' $(pwd)/Homestead.yaml
vagrant up
vagrant ssh -- -t 'cd code/; /bin/bash configure_stuff.sh'

