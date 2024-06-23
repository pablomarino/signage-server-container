##
## Sistema operativo
##

FROM debian:latest
RUN apt-get update && apt-get upgrade -y

##
## Parametros
## 

ARG USERNAME
ARG PASSWORD


##
## APACHE2
## 

RUN apt-get install -y apache2
# Configuracion
# COPY cfg/apache/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
COPY cfg/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
# Modulos
# RUN a2enmod ssl
RUN a2enmod rewrite
# RUN a2ensite default-ssl
RUN a2dissite 000-default




#
# Certbot
#

# Certbot para certificados SSL
# RUN apt-get install -y certbot python3-certbot-apache

##
## FTP
## 

# RUN apt-get install -y vsftpd
# Configuracion servidor ftp 
# COPY cfg/vsftp/vsftpd.conf /etc/vsftpd.conf
# RUN echo "cecafi">etc/vsftp.user_list

##
## OpenSSH
## 

# RUN apt-get install -y openssh-server
# RUN mkdir /var/run/sshd
# Configuracion
# desactivar el inicio de sesión como root y permitir la autenticación con contraseña
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
# RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
# #RUN useradd -rm -d /home/$USERNAME -s /bin/bash -g root -G sudo -p "$(openssl passwd -1 $PASSWORD)" $USERNAME
# RUN mkdir -p /home/$USERNAME/.ssh
# RUN chmod 700 /home/$USERNAME/.ssh


##
## Puertos expuestos HTTP, HTTPS, FTP y SSH
##

EXPOSE 80 443 21 22

##
## Script de inicio
##

COPY script/start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]

##
## Usuario
## 

RUN useradd -m -s /bin/bash $USERNAME && echo "$USERNAME:$PASSWORD" | chpasswd
RUN usermod -aG sudo $USERNAME
USER $USERNAME
RUN mkdir -p /home/$USERNAME
WORKDIR /home/$USERNAME