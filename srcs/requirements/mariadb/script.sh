#start
service mysql start

#create table
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

#create user
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#rights
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#root rights
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

#refresh
mysql -e "FLUSH PRIVILEGES;"

#restart
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe
