- Construir imagen
```bash 
docker build --build-arg USERNAME=user --build-arg PASSWORD=pass -t signage_server .
``` 
- Ejecutar contenedor
```bash 
docker run -d -p 80:80 -p 443:443 -p 21:21 -p 22:22 --name signage signage_server
``` 
``` 
# docker ps
# docker container ls 
# docker stop id
# docker rm id
``` 