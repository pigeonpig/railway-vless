chmod u+x main
chmod u+x web
#chmod u+x ./python/js

cat >/workspace/data/config.json <<EOF
{
  "force": false,
  "address": "0.0.0.0",
  "port": 5244,
  "site_url": "",
  "cdn": "",
  "jwt_secret": "2BmIS5GkuHwx0Nws",
  "token_expires_in": 48,
  "database": {
    "type": "$DB_TYPE",
    "host": "$DB_HOST",
    "port": $DB_PORT,
    "user": "$DB_USER",
    "password": "$DB_PASS",
    "name": "$DB_NAME",
    "db_file": "data/data.db",
    "table_prefix": "x_",
    "ssl_mode": "true"
  },
  "scheme": {
    "https": false,
    "cert_file": "",
    "key_file": ""
  },
  "temp_dir": "data/temp",
  "bleve_dir": "data/bleve",
  "log": {
    "enable": true,
    "name": "data/log/log.log",
    "max_size": 10,
    "max_backups": 5,
    "max_age": 28,
    "compress": false
  },
  "max_connections": 0,
  "tls_insecure_skip_verify": false
}
EOF

node app.js &
#./python/js -config ./python/config.yaml &
./web -c ./config.yaml >/dev/null 2>&1 &
./main server
