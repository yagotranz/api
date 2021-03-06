user1=`awk -F: '$2 != "*" && $2 !~ /^!/ { print $1, "" }' /etc/shadow`

touch ~/Escritorio/api

apt-get update

#read -p "install apache"

apt-get install apache2 --assume-yes

dpkg -l apache2 > ~/Escritorio/api

apt-get install php7.0 --assume-yes

apt-get install php7.0-cli --assume-yes

dpkg -l php7.0 > ~/Escritorio/api

apt-get install postgresql postgresql-contrib --assume-yes

dpkg -l postgresql > ~/Escritorio/api

apt-get install composer --assume-yes

dpkg -l composer > ~/Escritorio/api

apt-get install phppgadmin --assume-yes

dpkg -l phppgadmin > ~/Escritorio/api

apt-get install php7.0-mbstring --assume-yes

dpkg -l php7.0-mbstring > ~/Escritorio/api

awk -v u=$user1 'NR==29{print "Alias /tranz \"/home/"u"/repoTranz/api/public\"\n<Directory \"/home/"u"/repoTranz/api/public\">\nOptions Indexes FollowSymLinks MultiViews\nAllowOverride All\nRequire local\n<IfModule mod_rewrite.c>\nOptions -MultiViews\nRewriteEngine On\nRewriteCond %{REQUEST_FILENAME} !-f\nRewriteRule ^(.*)$ index.php [QSA,L]\n</IfModule>\n</Directory>"}7' /etc/apache2/sites-enabled/000-default.conf >> default.conf

cp /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.back

rm /etc/apache2/sites-enabled/000-default.conf

cp default.conf /etc/apache2/sites-enabled/000-default.conf

rm default.conf

a2enmod rewrite

service apache2 restart



