if [ ! -f /var/www/html/wp-config.php ]; then
    echo "First Run"
	 until mysqladmin -hmariadb -uwp_user -pwp_password ping; do
        sleep 2
    done
	cd /var/www/html/
	wp core download --allow-root
	wp config create --dbname=wordpress --dbuser=wp_user --dbpass=wp_password --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=clbouche.42.fr --title="beninceptioncgalere" --admin_user=clbouche --admin_password=password --admin_email=clbouche@student.42.fr --skip-email --allow-root
#	wp user create <wp_user> <wp_mail> --role=author --user_pass=<wp_user_pass> --allow-root
	wp theme install "teluro" --activate --allow-root
    echo "End first run"
fi

php-fpm7.3 -F -R