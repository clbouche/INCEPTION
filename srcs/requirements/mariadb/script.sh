if [ ! -d /var/lib/mysql/wordpress ]; then
    echo "First Run"
    mysqld&
    until mysqladmin ping; do
        sleep 2
    done
    mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; FLUSH PRIVILEGES;"
    mysql -e "GRANT ALL ON wordpress.* TO 'wp-admin'@'localhost' IDENTIFIED BY 'wp-admin' WITH GRANT OPTION; ALTER USER 'root'@'localhost'; FLUSH PRIVILEGES;"
    killall mysqld
    echo "End first run"
fi
mysqld
