# RHEL 9.5 Base Docker Image

RHEL 9.5 (Red Hat Enterprise Linux) 기반의 도커 베이스 이미지를 생성하는 프로젝트입니다.

## 📋 프로젝트 개요

이 프로젝트는 UBI 9.5 (Universal Base Image)를 기반으로 하여 필수 시스템 도구들이 설치된 베이스 도커 이미지를 제공합니다.

## 🛠️ 포함된 패키지

- **sudo**: 권한 관리
- **iproute**: 네트워크 인터페이스 관리
- **net-tools**: 네트워크 도구 (ifconfig, netstat 등)
- **iputils**: 네트워크 진단 도구 (ping, traceroute 등)
- **vim-minimal**: 텍스트 편집기
- **tar**: 아카이브 도구

## 🚀 사용 방법

### 1. 자동 빌드 스크립트 사용 (권장)

```bash
./build.sh
```

### 2. 수동 빌드

```bash
docker build -t rhel95-base -f Dockerfile.rhel95 .
```

### 3. 이미지 실행

```bash
docker run -it rhel95-base
```

## 📁 파일 구조

```
mysql/
├── Dockerfile.rhel95    # RHEL 9.5 베이스 이미지 Dockerfile
├── build.sh             # 자동 빌드 스크립트
└── README.md           # 프로젝트 문서
```

## 🔧 빌드 과정

1. **UBI 9.5 베이스 이미지 사용**
   - `registry.access.redhat.com/ubi9/ubi:9.5`

2. **시스템 업데이트**
   - 최신 패키지 정보로 업데이트

3. **필수 패키지 설치**
   - 시스템 관리 및 네트워크 도구 설치

4. **캐시 정리**
   - 불필요한 패키지 캐시 제거

## ⚠️ 주의사항

- 이 이미지는 Red Hat의 UBI (Universal Base Image)를 사용합니다
- 상업적 사용 시 Red Hat 라이선스 정책을 확인하세요
- 프로덕션 환경에서 사용하기 전에 보안 검토를 권장합니다

## 🐛 문제 해결

### 패키지 충돌 오류
- `curl-minimal`과 `curl` 패키지 간 충돌이 발생할 수 있습니다
- 현재는 `curl-minimal`을 사용하여 충돌을 방지했습니다

### 빌드 실패
- 네트워크 연결을 확인하세요
- Docker 데몬이 실행 중인지 확인하세요
- 충분한 디스크 공간이 있는지 확인하세요

## 📝 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다.

## 🤝 기여

버그 리포트나 기능 제안은 이슈를 통해 제출해 주세요.

---

**버전**: 1.0.0  
**최종 업데이트**: 2025년 1월 