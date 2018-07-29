# scripts
TO DO: Revisar valores

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

# geoportal-install

7: echo "geoportal:password" | sudo chpasswd

# gpt.xml
53
538: <account username="gptuser" password="gptuser" encrypted="false"/>

# geoportal.xml
           
# proxy-install
53

# setenv.sh

# ssl-setup
