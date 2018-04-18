
# How to Run

```sh
docker-compose up
```

# 1
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

