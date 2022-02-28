if [ ! -d /var/lib/mysql/${DB_WORDPRESS} ]; then
    echo "First Run"
    mysqld&
    until mysqladmin ping; do
        sleep 2
    done
    mysql -u root -e "SET GLOBAL general_log=1;"
    mysql -u root -e "SET GLOBAL general_log_file='mariadb.log';"
    mysql -u root -e "CREATE DATABASE ${DB_WORDPRESS};"
    mysql -u root -e "CREATE USER '${ADMIN}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';"
    mysql -u root -e "GRANT ALL ON *.* TO '${ADMIN}'@'%';"
    mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';"
    mysql -u root -e "GRANT ALL ON ${DB_WORDPRESS}.* TO '${DB_USER}'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    killall mysqld
    echo "End first run"
fi
mysqld