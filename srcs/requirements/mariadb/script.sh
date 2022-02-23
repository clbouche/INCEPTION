if [ ! -d /var/lib/mysql/wordpress ]; then
    echo "First Run"
    mysqld&
    until mysqladmin ping; do
        sleep 2
    done
    mysql -u root -e "SET GLOBAL general_log=1;"
    mysql -u root -e "SET GLOBAL general_log_file='mariadb.log';"
    mysql -u root -e "CREATE DATABASE ${DB_WORDPRESS};"
    mysql -u root -e "CREATE USER 'admin'@'*' IDENTIFIED BY 'admin';"
    mysql -u root -e "GRANT ALL ON *.* TO 'admin'@'%';"
    mysql -u root -e "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_password';"
    mysql -u root -e "GRANT ALL ON ${DB_WORDPRESS}.* TO 'wp_user'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    killall mysqld
    echo "End first run"
fi
mysqld