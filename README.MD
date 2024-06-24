# Signage Server image

Signage device content server Docker image

## Features

- Web server: Apache 2
- SSl Certificate: Certbot
- FTP server: Vsftpd
- SSH server: OpenSSH

## Usage

- Build image

```bash
docker build --build-arg USERNAME=user --build-arg PASSWORD=pass -t signage_server:1.0 .
```

- Execute container

```bash
docker run -d -p 8080:80 -p 4443:443 -p 2121:21 -p 2222:22 --name signage signage_server:1.0
```

- Other useful commands

```bash
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

# View running services
service --status-all

```

## References

- [Generate Certbot Certificate](https://stackoverflow.com/questions/45761841/create-a-docker-apache-image-with-letsencrypt)

- [Building an Apache Web Server through a Dockerfile](https://www.digitalocean.com/community/tutorials/apache-web-server-dockerfile)
