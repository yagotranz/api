
service apache2 stop

apt-get --purge remove apache\* --assume-yes

rm -r /etc/apache2/

apt-get --purge remove php\* --assume-yes

apt-get purge postgres\* --assume-yes

rm -r /etc/postgresql/
rm -r /etc/postgresql-common/
rm -r /var/lib/postgresql/
userdel -r postgres
groupdel postgres

apt-get purge composer --assume-yes

apt-get purge phppgadmin --assume-yes

apt autoremove --assume-yes

rm ~/Escritorio/apiTranz