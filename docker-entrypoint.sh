#!/bin/bash

# Start DB server and reset password to empty
service mysql start >/dev/null
mysql -uroot -psupers3curePaSswd -e "SET PASSWORD = PASSWORD('');"

# Setup Portus database
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed

chown -R www-data:www-data /portus

exec "$@"
