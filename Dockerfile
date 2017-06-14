FROM alpine

RUN apk update && apk add curl

RUN curl -o /etc/apk/keys/virtuozzo.rsa.pub http://kojistorage.eng.sw.ru/alpine/ploop/v7.0.88/virtuozzo.rsa.pub 
RUN echo http://kojistorage.eng.sw.ru/alpine/ploop/v7.0.88/ >> /etc/apk/repositories

RUN apk update && apk add ploop gptfdisk sgdisk ploop-lib util-linux parted e2fsprogs e2fsprogs-extra

RUN mkdir -p /run/docker/plugins /mnt/vstorage/docker /mnt/docker

COPY docker-volume-ploop docker-volume-ploop

CMD ["./docker-volume-ploop"]
