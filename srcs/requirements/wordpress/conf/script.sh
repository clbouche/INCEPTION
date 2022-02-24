if [ ! -f /var/www/html/wp-config.php ]; then
    echo "First Run"
	 until mysqladmin -hmariadb -uwp_user -pwp_password ping; do
        sleep 2
    done
	cd /var/www/html/
	wp core download --allow-root
	wp config create --dbname=${DB_WORDPRESS} --dbuser=${DB_USER} --dbpass=${DB_USER_PASSWORD} --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_MAIL} --skip-email --allow-root
	wp user create ${WP_USER} ${WP_USER_MAIL} --role=author --user_pass=${WP_USER_PASSWORD} --allow-root
	wp theme install "teluro" --activate --allow-root
    echo "End first run"
fi

php-fpm7.3 -F -R