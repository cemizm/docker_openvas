#Dockerized openvas

This is the repository for a dockerized openvas container

###Running

```
docker run -d --name openvas -p 9390:9390 -p 9392:9392 --env OPENVAS_PASSWORD=pw cemizm/openvas
```
    