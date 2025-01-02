#!/bin/bash
set -e

if [ ! -f /etc/odoo/odoo.conf ]; then
    echo "Creating default odoo.conf file..."
    cat <<EOF > /etc/odoo/odoo.conf
[options]
addons_path = /mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons
db_host = localhost
db_port = 5432
db_user = odoo
db_password = odoo
EOF
    chown odoo:odoo /etc/odoo/odoo.conf
fi

exec "$@"
