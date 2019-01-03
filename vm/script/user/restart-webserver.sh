#!/bin/bash

source /vm/script/bash/util/console.sh

# ----------------------------------------------------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------------------------------------------------

function copy_config_file
{
    printf "Copy ${CONSOLE_COLOR_CYAN}${1}${CONSOLE_COLOR_NONE} to ${CONSOLE_COLOR_CYAN}${2}${CONSOLE_COLOR_NONE}\n";
    sudo cp ${1} ${2}
}

function restart_redis
{
    copy_config_file "/vm/config/redis/redis.conf" "/etc/redis/redis.conf"
    print_green "Restart redis...";
    sudo service redis-server restart
}

function restart_php
{
    copy_config_file "/vm/config/php/user.ini" "/etc/php/7.2/fpm/conf.d/user.ini"
    print_green "Restart php...";
    sudo service php7.2-fpm restart
}

function restart_mysql
{
    print_green "Restart mysql...";
    sudo /etc/init.d/mysql restart
}

function restart_nginx
{
    copy_config_file "/vm/config/nginx/site/default" "/etc/nginx/sites-available/default"
    print_green "Restart nginx...";
    sudo service nginx restart
}

# ----------------------------------------------------------------------------------------------------------------------
# Script
# ----------------------------------------------------------------------------------------------------------------------

restart_redis;
restart_php;
restart_mysql;
restart_nginx;
