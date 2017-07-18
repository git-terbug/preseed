# scripts
TO DO
Revisar valores

# preseed.cfg
7: d-i netcfg/get_hostname string debian
28 - 38:
#d-i passwd/root-password password admin
#d-i passwd/root-password-again password admin

#d-i passwd/root-password-crypted password [crypt(3) hash]

d-i passwd/user-fullname string test
d-i passwd/username string test
d-i passwd/user-password password admin
d-i passwd/user-password-again password admin

#d-i passwd/user-password-crypted password [crypt(3) hash]

194: && wget http://192.168.56.101/preseed/rc.local -P /target/etc \

# rc.local
15: export DEF_USER=test

27:42
#Usuario del sistema de configuración basado en web:
echo "phpmyadmin phpmyadmin/setup-username string config" | debconf-set-selections 
#Contraseña del sistema de configuración basado en web:
echo "phpmyadmin phpmyadmin/setup-password password config" | debconf-set-selections 
#Confirmación de contraseña:
echo "phpmyadmin phpmyadmin/password-confirm password config" | debconf-set-selections 

#Nombre del usuario de administración de la base de datos:
#echo "phpmyadmin phpmyadmin/mysql/admin-user string root" | debconf-set-selections 
echo "phpmyadmin phpmyadmin/mysql/admin-user string admin" | debconf-set-selections 
#Contraseña del usuario de administración de la base de datos:
echo "phpmyadmin phpmyadmin/mysql/admin-pass password admin" | debconf-set-selections 

#Contraseña de aplicación MySQL para phpmyadmin:
echo "phpmyadmin phpmyadmin/mysql/app-pass password qwerty" | debconf-set-selections
#Confirmación de contraseña:
echo "phpmyadmin phpmyadmin/app-password-confirm password qwerty" | debconf-set-selections

72: mysql --user=root mysql -Bse "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;FLUSH PRIVILEGES;"

# config.json

# enketo


