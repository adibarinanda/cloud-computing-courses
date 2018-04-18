## 1. Langkah-langkah
### a. Buat 3 Vagrant (1 Load Balancer + 2 Worker)
	- Buat 3 folder untuk Vagrant
		$ mkdir loadbalancer1 worker1 worker

	- Masuk ke folder loadbalancer1
		$ cd loadbalancer1

	- Inisiasi Project Vagrant
		$ vagrant init

	- Tambakan box dengan OS Ubuntu 16.04
		$ vagrant box add ubuntu/xenial64

	- Edit file Vagrantfile
		$ sudo nano Vagrantfile

	- Ubah bagian
		config.vm.box = "base"	
		menjadi	
		config.vm.box = "ubuntu/xenial64"



### b. Buat Provision untuk Instalasi Software Load Balancer dan Worker
	- Di masing-masing folder, buat file baru bootstrap.sh
		$ sudo nano bootstrap.sh

	- Isikan masing-masing file bootstrap.sh sebagai berikut:
		- Load Balancer : 
			> #!/usr/bin/env bash
			> apt-get install nginx -y
			> apt-get install php7.0-fpm -y

		- Worker :
			> #!/usr/bin/env bash
			> apt-get install apache2
			> apt-get install libapache2-mod-php7.0 php7.0-fpm -y


### c. Setup Algoritma yang ingin digunakan di Load Balancer
	- Load Balancer :
		
		./load_balancing start [balancing_method]
			
		Balancing method diisi dengan algoritmanya, 
		contoh:
		
		./load_balancing start round_robin
		./load_balancing start ip_hash
		./load_balancing start least_conn
