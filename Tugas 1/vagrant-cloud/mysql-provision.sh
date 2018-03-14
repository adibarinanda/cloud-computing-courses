debconf-set-selections <<< 'mysql-server mysql-server/root_password password adib'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password adib'
apt-get update
apt-get install -y mysql-server
