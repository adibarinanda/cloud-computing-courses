
## Soal Sesilab Nginx

Buatlah sistem load balancing dengan 1 load balancer(nginx dan 2 worker(apache2), terapkan algoritma load balancing round-robin, least-connected, dan ip-hash.

Soal :

1. Buatlah Vagrantfile sekaligus provisioning-nya untuk menyelesaikan kasus.
2. Analisa apa perbedaan antara ketiga algoritma tersebut.
3. Biasanya pada saat membuat website, data user yang sedang login disimpan pada session. Sesision secara default tersimpan pada memory pada sebuah host. Bagaimana cara mengatasi masalah session ketika kita melakukan load balancing?

### Petunjuk

1. Lakukan soal nomor 1 dan dokumentasikan bagaimana cara setupnya pada laporan markdown.
2. Untuk nomor 2 dan 3 merupakan analisa terhadap suatu masalah, jawablah pertanyaan diatas dan tulis pada laporan.

### 1.
### setup

```sh
./load_balancing start [balancing_method]
```
> Balancing method diisi dengan algoritmanya, 
contoh:
```sh
./load_balancing start round_robin
./load_balancing start ip_hash
./load_balancing start least_conn
```

#### Mengubah Balancing Method

```sh
./load_balancing method [balancing_method]
```
Example
```sh
./load_balancing method round_robin
./load_balancing method ip_hash
./load_balancing method least_conn
```

#### Destroy
untuk destroy balancer/worker aktif

```sh
./load_balancing destroy
```

---
