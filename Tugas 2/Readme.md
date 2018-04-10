
## Soal Sesilab Nginx

Buatlah sistem load balancing dengan 1 load balancer(nginx dan 2 worker(apache2), terapkan algoritma load balancing round-robin, least-connected, dan ip-hash.

Soal :

1. Buatlah Vagrantfile sekaligus provisioning-nya untuk menyelesaikan kasus.
2. Analisa apa perbedaan antara ketiga algoritma tersebut.
3. Biasanya pada saat membuat website, data user yang sedang login disimpan pada session. Sesision secara default tersimpan pada memory pada sebuah host. Bagaimana cara mengatasi masalah session ketika kita melakukan load balancing?

### Petunjuk

1. Lakukan soal nomor 1 dan dokumentasikan bagaimana cara setupnya pada laporan markdown.
2. Untuk nomor 2 dan 3 merupakan analisa terhadap suatu masalah, jawablah pertanyaan diatas dan tulis pada laporan.

### 1.setup

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
---

### 2.Analisa apa perbedaan load balancing round-robin, least-connected, dan ip-hash

#### Round Robin :
Konsep dasar dari algoritma ini yaitu dengan menggunakan time sharing. membagi beban kerja sesuai antrian.
misal ada 4 server, a b c d maka beban akan dibagi dari a - d kemudian balik lagi ke a sampai habis dibagikan.

#### Least Connection :
konsep Least connection yaitu membagi beban kerja berdasarkan banyaknya koneksi yang sedang dilayani oleh sebuah server yang aktif. Algoritma penjadwalan ini termasuk dalam penjadwalan dinamik, dimana memerlukan perhitungan koneksi yang aktif untuk masing-masing real server.
Misal, ada 2 server yaitu A dan B. Koneksi aktif pada server A berjumlah 2 koneksi,  koneksi aktif pada server B berjumlah 5 koneksi, maka beban kerja akan diberikan kepada server A karena koneksi aktif server A lebih sedikit dibanding B.

#### IP Hash :
Menggunakan IP source dan destination dari klien dan server untuk men-generate hash key menjadi kode yang unik. Kode ini digunakan untuk mengalokasikan klien ke server tertentu. Metode ini dapat memastikan bahwa klien akan terhubung dengan server yang sama yang sebelumnya sudah terhubung.
