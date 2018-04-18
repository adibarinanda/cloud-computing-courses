
## How to Run

```sh
docker-compose up
```

## 1
1. Buat file dockerfile pada folder reservasi `nano Dockerfile`
2. dockerfile:

    ```Dockerfile
    FROM ubuntu:16.04
    RUN apt-get update && apt-get -y install python-pip libmysqlclient-dev
    COPY reservasi /reservasi
    WORKDIR /reservasi
    RUN pip install -r requirements.txt
    ENTRYPOINT ["python"]
    CMD ["server.py"]
    ```
3. Simpan. Jalankan perintah `sudo docker build -t reservasi .`.
4. Cek container dengan perintah `sudo docker ps`.

---
---

## 2
Buat 3 buah worker dengan menggunakan image yang dibuat pada soal [1](#1).
```yml
services:
    worker1:
        image: reservasi
    worker2:
        image: reservasi
    worker3:
        image: reservasi
```

---
---

