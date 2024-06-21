# Signage Server image

## Features

Web server: Apache 2 
SSl Certificate: Certbot
FTP server: Vsftpd
SSH server: OpenSSH

## Usage

- Build image
```bash 
docker build --build-arg USERNAME=user --build-arg PASSWORD=pass -t signage_server .
``` 
- Execute container
```bash 
docker run -d -p 80:80 -p 443:443 -p 21:21 -p 22:22 --name signage signage_server
``` 
- Other useful commands
``` 
# List containers
docker container ls 

# stop container
docker stop id

# Remove container
docker rm id

# List processes
docker ps

# Run a shell in the container
docker exec -it proccess_id /bin/bash

``` 
