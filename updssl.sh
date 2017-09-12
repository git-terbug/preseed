!#/bin/bash -e
CERT_NAME=$1
CERT_PATH=$2
sh /home/admin/scripts/ngx default tomcat-ssl.conf
#rm /etc/nginx/sites-enabled/tomcat-ssl.conf
#ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
#service nginx reload
cd $CERT_PATH
certbot certonly --webroot -w /usr/share/nginx/html --csr $CERT_PATH/dlab.csr 
bash -c "cat 0000_cert.pem 0000_chain.pem > $CERT_NAME.pem"

#exportar certificado
openssl pkcs12 -export -in $CERT_PATH/$CERT_NAME.pem -inkey $CERT_PATH/CERT_NAME.key -out $CERT_PATH/$CERT_NAME.pfx
chmod 644 $CERT_PATH/CERT_NAME.pfx
usermod -a -G ssl-cert tomcat8