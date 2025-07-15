#!/bin/bash

# MariaDB 서비스 시작
echo "Starting MariaDB..."

# MariaDB 데이터 디렉토리 초기화 (첫 실행 시)
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# MariaDB 서비스 시작
mysqld --user=mysql --default-authentication-plugin=mysql_native_password &

# MariaDB 시작 대기
sleep 10

# 데이터베이스 및 사용자 생성
mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "MariaDB is ready!"
echo "Database: $MYSQL_DATABASE"
echo "User: $MYSQL_USER"
echo "Password: $MYSQL_PASSWORD"

# 포그라운드에서 실행
wait 