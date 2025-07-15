#!/bin/bash

# MySQL 서비스 시작
echo "Starting MySQL..."

# MySQL 데이터 디렉토리 초기화 (첫 실행 시)
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MySQL data directory..."
    mysqld --initialize-insecure --user=mysql
fi

# Galera 플러그인 확인
if [ -f "/usr/lib64/mysql/plugin/libgalera_smm.so" ]; then
    echo "Galera plugin found, starting with cluster support..."
    mysqld --user=mysql --wsrep-provider=/usr/lib64/mysql/plugin/libgalera_smm.so \
           --wsrep-cluster-address=gcomm:// \
           --wsrep-sst-method=rsync \
           --wsrep-node-name=node1 \
           --wsrep-node-address=$(hostname -i) \
           --default-authentication-plugin=mysql_native_password &
else
    echo "Galera plugin not found, starting standalone MySQL..."
    mysqld --user=mysql --default-authentication-plugin=mysql_native_password &
fi

# MySQL 시작 대기
sleep 10

# 데이터베이스 및 사용자 생성
mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "MySQL is ready!"
echo "Database: $MYSQL_DATABASE"
echo "User: $MYSQL_USER"
echo "Password: $MYSQL_PASSWORD"

# 포그라운드에서 실행
wait 