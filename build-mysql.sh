#!/bin/bash

# MySQL Galera 클러스터 이미지 빌드 스크립트
echo "Building MySQL Galera cluster image..."

# 도커 이미지 빌드
docker build -t mysql-galera -f Dockerfile.mysql-galera .

# 빌드 결과 확인
if [ $? -eq 0 ]; then
    echo "✅ MySQL Galera image 'mysql-galera' built successfully!"
    echo ""
    echo "Usage:"
    echo "  docker run -d -p 3306:3306 -p 4444:4444 -p 4567:4567 -p 4568:4568 mysql-galera"
    echo ""
    echo "Environment variables:"
    echo "  MYSQL_ROOT_PASSWORD=root"
    echo "  MYSQL_DATABASE=test"
    echo "  MYSQL_USER=user"
    echo "  MYSQL_PASSWORD=password"
else
    echo "❌ Docker build failed!"
    exit 1
fi 