# acestream for arm7

## usage

### github

```
$ git clone https://github.com/sybdata/acearm7.git
$ cd acearm7/
$ docker build -t sybdata/acearm7 .
$ id <dockeruser>
$ docker run --privileged -d -e PUID=0 -e PGID=0 --name acepi -p 8621:8621 -p 62062:62062 -p 6878:6878 -p 8000:8000 sybdata/acearm7
```
## info

* Shell access whilst the container is running: `docker exec -it acepi /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f acepi`

* https://paste.ee/p/WRjtL
* https://paste.ee/p/3fNxl

## add HTTPAceProxy

* https://paste.ee/p/ZofDu




![pidock](https://user-images.githubusercontent.com/24189833/38767729-4adaaec0-3fe7-11e8-8952-e6ea6f7e7744.png)

![piace](https://user-images.githubusercontent.com/24189833/38771057-7540bca6-401c-11e8-82b4-1087c1464fc2.png)


