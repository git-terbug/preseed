#!/bin/bash

echo "configurando phpmyadmin $DATE" > /home/test/world 

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get dist-upgrade > /home/test/logupdate
#/usr/share/debconf/fix_db.pl > /home/test/logtest

# Usuario del sistema de configuración basado en web:
echo "phpmyadmin phpmyadmin/setup-username string admin" | debconf-set-selections 
# Contraseña del sistema de configuración basado en web:
echo "phpmyadmin phpmyadmin/setup-password password admin" | debconf-set-selections 
# Confirmación de contraseña:
echo "phpmyadmin phpmyadmin/password-confirm password admin" | debconf-set-selections 

# Nombre del usuario de administración de la base de datos:
echo "phpmyadmin phpmyadmin/mysql/admin-user string root" | debconf-set-selections 
# Contraseña del usuario de administración de la base de datos:
echo "phpmyadmin phpmyadmin/mysql/admin-pass password admin" | debconf-set-selections 

# Contraseña de aplicación MySQL para phpmyadmin:
echo "phpmyadmin phpmyadmin/mysql/app-pass password qwerty" | debconf-set-selections
# Confirmación de contraseña:
echo "phpmyadmin phpmyadmin/app-password-confirm password qwerty" | debconf-set-selections

# ¿Desea configurar la base de datos para phpmyadmin con «dbconfig-common»?
echo "phpmyadmin	phpmyadmin/dbconfig-install	boolean	true" | debconf-set-selections
# ¿Desea realizar las actualizaciones de la base de datos de phpmyadmin con «dbconfig-common»?
echo "phpmyadmin	phpmyadmin/dbconfig-upgrade	boolean	true" | debconf-set-selections

# Servidor web que desea reconfigurar automáticamente:
# Choices: apache2, lighttpd
echo "phpmyadmin	phpmyadmin/reconfigure-webserver	multiselect	apache2" | debconf-set-selections

# El tipo de base de datos que se va a utilizar para phpmyadmin:
# Choices: 
echo "phpmyadmin	phpmyadmin/database-type	select	mysql" | debconf-set-selections
# Método de conexión para la base de datos MySQL de phpmyadmin:
#phpmyadmin	phpmyadmin/mysql/method	select	unix socket
#phpmyadmin	phpmyadmin/mysql/admin-user	string	root
# Nombre de usuario MySQL para phpmyadmin:
echo "phpmyadmin	phpmyadmin/db/app-user	string	phpmyadmin" | debconf-set-selections
# Nombre de la base de datos MySQL para phpmyadmin:
echo "phpmyadmin	phpmyadmin/db/dbname	string	phpmyadmin" | debconf-set-selections
#phpmyadmin	phpmyadmin/reconfigure-webserver	multiselect	apache2
#phpmyadmin	phpmyadmin/setup-username	string	admin

# ¿Desea realizar una copia de seguridad de la base de datos de phpmyadmin antes de actualizar?
#phpmyadmin	phpmyadmin/upgrade-backup	boolean	true
# ¿Desea reinstalar la base de datos para phpmyadmin?
#phpmyadmin	phpmyadmin/dbconfig-reinstall	boolean	false

apt-get install -q -y phpmyadmin > /home/test/logtest

#dpkg-reconfigure phpmyadmin > /home/test/logdpkg

#apt-get -f dist-upgrade > /home/test/logapt
apt-get update
apt-get install -f > /home/test/logapt

rm /home/test/post.sh
rm /etc/rc.local
cp /etc/rc.local.old /etc/rc.local
echo "removido exitoso" > /home/test/rm

