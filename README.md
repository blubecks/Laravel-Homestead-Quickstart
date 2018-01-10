# Laravel-scaffolding

Hi, if you are here you're going to dev something using Laravel. To avoid super boring setup you can use my Laravel-scaffolding
to get ready to ship beautiful code in 5 minutes.

- Requirements: all you need to 
- How to use: steps to use the scaffolding
- Tips n' Tricks
- Contributions & Issues

## Requirements

We are using Homestead based on Vagrant as a container. To install and prepare your perfect dev environment you need:

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html) 
- [Composer (system wide)](https://getcomposer.org/download/)
- [Php 7 or greater](https://www.google.it/search?q=if+you+don%27t+know+hot+to+install+php+you+can%27t+write+a+line+of+code) 

## How to use
Follow these simple steps to get ready to develop new feature.
    
    git clone https://github.com/blubecks/Laravel-scaffolding.git <proj-name>
    cd <proj-name>
    sh run_machine.sh
    
Now all your settings are up&running.

### Tips n' Tricks

Edit on the host machine the `/etc/hosts` adding the following lines:

- 192.168.10.10  homestead.local
- 127.0.0.1 phpmyadmin.local 

In this way you can reach with ease your sites.

- [home](http://homestead.local/)
- [phpmyadmin](http://phpmyadmin.local:8000/) (user:local, pwd:local)

### Contributions & Issues
Please follow the standard, pull-req to contrib and open issues for any problems :)
    
    
