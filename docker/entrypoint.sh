#!/bin/sh

set -e

cp /var/www/.env.${APP_ENV} /var/www/.env

echo "Serializing environment:"

react-env --dest .

cat env.js

exec "$@"