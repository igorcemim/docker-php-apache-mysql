#!/bin/bash

# Start Apache2 in background...
apachectl -D FOREGROUND&

# Watch changes in php.ini and reload configuration
config_sum=$(md5sum /etc/php/7.2/apache2/php.ini)
while true
do
    config_sum_new=$(md5sum /etc/php/7.2/apache2/php.ini)
    if [ "$config_sum" != "$config_sum_new" ]; then
        config_sum=$config_sum_new
        /etc/init.d/apache2 reload
        echo "PHP config reloaded..."
    fi
    sleep 1
done
