### 2.Analisa apa perbedaan load balancing round-robin, least-connected, dan ip-hash

#### Round Robin :
Konsep dasar dari algoritma ini yaitu dengan menggunakan time sharing. membagi beban kerja sesuai antrian.
misal ada 4 server, a b c d maka beban akan dibagi dari a - d kemudian balik lagi ke a sampai habis dibagikan.

#### Least Connection :
konsep Least connection yaitu membagi beban kerja berdasarkan banyaknya koneksi yang sedang dilayani oleh sebuah server yang aktif. Algoritma penjadwalan ini termasuk dalam penjadwalan dinamik, dimana memerlukan perhitungan koneksi yang aktif untuk masing-masing real server.
Misal, ada 2 server yaitu A dan B. Koneksi aktif pada server A berjumlah 2 koneksi,  koneksi aktif pada server B berjumlah 5 koneksi, maka beban kerja akan diberikan kepada server A karena koneksi aktif server A lebih sedikit dibanding B.

#### IP Hash :
Menggunakan IP source dan destination dari klien dan server untuk men-generate hash key menjadi kode yang unik. Kode ini digunakan untuk mengalokasikan klien ke server tertentu. Metode ini dapat memastikan bahwa klien akan terhubung dengan server yang sama yang sebelumnya sudah terhubung.

