#!/bin/bash

# Apache
service apache2 start

# vsftpd
service vsftpd start

# Servicio SSH
service ssh start

# Certbot para obtener certificados SSL
##certbot --apache -d yourdomain --non-interactive --agree-tos -m cecafi@udc.es

# Dejo un proceso abierto para que el contenedor siga en ejecución
tail -f /dev/null
