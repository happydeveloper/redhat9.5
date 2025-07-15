#!/bin/bash

# MySQL 이미지 빌드 스크립트 (Galera 없음)
echo "Building MySQL image..."

# 도커 이미지 빌드
docker build -t mysql-simple -f Dockerfile.mysql-simple .

# 빌드 결과 확인
if [ $? -eq 0 ]; then
    echo "✅ MySQL image 'mysql-simple' built successfully!"
    echo ""
    echo "Usage:"
    echo "  docker run -d -p 3306:3306 mysql-simple"
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