# Tugas Docker

![](https://logz.io/wp-content/uploads/2016/01/docker-facebook.png)

## Soal Sesilab Docker

Nana adalah mahasiswa semester 6 dan sekarang sedang mengambil matakuliah komputasi awan. Saat mengambil matakuliah komputasi awan dia mendapatkan materi sesilab tentang Docker. Suatu hari Nana ingin membuat sistem reservasi lab menggunakan Python Flask. Dia dibantu temannya, Putra awalnya membuat web terlebih dahulu. Web dapat di download [disini](https://cloud.fathoniadi.my.id/reservasi.zip).

Setelah membuat web, Putra dan Nana membuat Custom Image Container menggunakan Dockerfile. Mereka membuat image container menggunakan base container ubuntu:16.04 kemudian menginstall aplikasi flask dan pendukungnya agar website dapat berjalan [1].

Setelah membuat custom image container, mereka kemudian membuat file __docker-compose.yml__. Dari custom image yang dibuat sebelumnya mereka membuat 3 node yaitu worker1, worker2, dan worker3 [2].

Setelah mempersiapkan worker, mereka kemudian menyiapkan nginx untuk loadbalancing ketiga worker tersebut (diperbolehkan menggunakan images container yang sudah jadi dan ada di Docker Hub) [3].

Karena web mereka membutuhkan mysql sebagai database, terakhir mereka membuat container mysql (diperbolehkan menggunakan images container yang sudah jadi dan ada di Docker Hub)  yang dapat diakses oleh ke-3 worker yang berisi web mereka tadi dengan environment:

    username : userawan
    password : buayakecil
    nama database : reservasi

Selain setup environmet mysql, mereka juga mengimport dump database web mereka menggunakan Docker Compose dan tak lupa membuat volume agar storage mysql menjadi persisten[4].

## 1. Langkah-langkah
### a. Install Docker
		- $ sudo apt-get install docker-ce

### b. Buat 2 file Dockerfile
Dockerfile 1: Web Python Flask

		FROM ubuntu:16.04

		RUN apt update && apt install -y wget apt-utils zip python2.7 python-pip
		RUN apt install -y libmysqlclient-dev
		RUN pip install --upgrade pip

		RUN wget https://cloud.fathoniadi.my.id/reservasi.zip && unzip reservasi.zip

		WORKDIR reservasi
		RUN pip install -r req.txt

		CMD python server.py
	
		EXPOSE 80
---
Dockerfile 2: Setup MySQL

		FROM mysql:5.7
		ENV MYSQL_ROOT_PASSWORD passwordawan
		ENV MYSQL_USER userawan
		ENV MYSQL_PASSWORD buayakecil
		ENV MYSQL_DATABASE reservasi

		COPY ./reservasi.sql /docker-entrypoint-initdb.d
### c. Buat image
		$ docker build -t reservasi
		$ docker build -t mysql_reservasi

### d. Buat file docker-compose.yml
		$ sudo nano docker-compose.yml

### e. Isi file docker-compose.yml seperti dibawah ini
```
version: '3'

services:
  worker1:
    depends_on:
      - db
    image: reservasi
    restart: always
    environment:
      DB_HOST: 172.20.0.110
      DB_USERNAME: userawan
      DB_PASSWORD: buayakecil
      DB_NAME: reservasi
    networks:
      docker1:
        ipv4_address: 172.20.0.114
  
  worker2:
    depends_on:
      - db
    image: reservasi
    restart: always
    environment:
      DB_HOST: 172.20.0.110
      DB_USERNAME: userawan
      DB_PASSWORD: buayakecil
      DB_NAME: reservasi
    networks:
      docker1:
        ipv4_address: 172.20.0.113
  
  worker3:
    depends_on:
      - db
    image: reservasi
    restart: always
    environment:
      DB_HOST: 172.20.0.110
      DB_USERNAME: userawan
      DB_PASSWORD: buayakecil
      DB_NAME: reservasi
    networks:
      docker1:
        ipv4_address: 172.20.0.112

  load_balancer:
    image: nginx:stable-alpine
    depends_on:
      - worker1
      - worker2
      - worker3
    ports:
      - 7777:80
    volumes: 
      - ./nginx.conf:/etc/nginx/conf.d/default.conf:ro
    networks:
      docker1:
        ipv4_address: 172.20.0.111

  db:
    image: mysql_reservasi
    restart: always
    networks:
      docker1:
        ipv4_address: 172.20.0.110

volumes:
  reservasi:

networks:
  docker1:
    ipam:
      config:
        - subnet: 172.20.0.0/24
```

### f. Jalankan docker compose
		$ docker-compose up -d
# Durung mari gan
