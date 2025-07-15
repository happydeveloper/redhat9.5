#!/bin/bash

# RHEL 9.5 베이스 이미지 빌드 스크립트
echo "Building RHEL 9.5 base image..."

# 도커 이미지 빌드
docker build -t rhel95-base -f Dockerfile.rhel95 .

# 빌드 결과 확인
if [ $? -eq 0 ]; then
    echo "✅ Docker image 'rhel95-base' built successfully!"
    echo "You can now run: docker run -it rhel95-base"
else
    echo "❌ Docker build failed!"
    exit 1
fi 