# CLAUDE.md

AI 기반 프로젝트 협업 가이드 (범용)

## 작업 방식

**AI-Native Development (Spec-Driven Workflow)**

```
spec(Markdown) → implement(AI) → review → commit → PR → merge
```

마크다운 명세를 기반으로 AI 에이전트가 구현하며, 커밋/푸시는 사용자 검토 후에만 수행합니다.

## Git Flow

```
main ─────────────────────────────────●─────
         \                           /
          develop ────●────●────●───
                       \       /
                        feature/xxx
```

### 브랜치 전략

| 브랜치 | 용도 |
|--------|------|
| `main` | 배포 가능한 상태 |
| `develop` | 개발 통합 브랜치 |
| `feature/*` | 기능 개발 |
| `fix/*` | 버그 수정 |
| `docs/*` | 문서 작업 |

### 작업 플로우

1. **브랜치 생성**: `develop`에서 분기
2. **작업 및 커밋**: 기능 단위로 커밋
3. **푸시**: 원격에 브랜치 푸시
4. **PR 생성**: `develop`으로 PR
5. **리뷰 및 머지**: 승인 후 머지

### 커밋 전 필수 확인

- [ ] 변경 파일 목록 확인
- [ ] 커밋 메시지 사용자 승인
- [ ] 브랜치 확인

## 워크플로우

```
Issue → Spec → Implement → Commit → PR
```

| 단계 | 스킬 | 설명 |
|------|------|------|
| 이슈 | `/github-issue` | GitHub 이슈 생성, 라벨 매핑, 브랜치명 제안 |
| 명세 | `/spec` | 요구사항 분석, 아키텍처 설계, 다이어그램 |
| 구현 | `/implement` | 설계 문서 기반 코드 구현 |
| 커밋 | `/commit` | diff 리뷰, 커밋 메시지 제안, 커밋 |
| PR | `/github-pr` | PR 생성, 이슈 연결 |

> 스킬 상세: [.claude/README.md](./.claude/README.md)

## 핵심 규칙

1. **명세 우선**: 코드 작성 전 명세 문서 먼저
2. **사용자 승인**: 커밋/푸시는 사용자 요청 시에만
3. **동기화 유지**: 문서와 코드는 항상 일치
4. **멱등성 검증**: 작업 완료 후 가이드 기준 검증

## 다이어그램

| 용도 | 도구 |
|------|------|
| 플로우, 시퀀스, 구조도 | Mermaid (README 임베딩) |
| 클래스, ERD 등 상세 | PlantUML + SVG |

PlantUML 사용 시: `example.puml` → `example.svg` 필수 생성

## 커밋 컨벤션

### 형식

```
타입: 수정내용 요약

* 상세 내용 1
* 상세 내용 2
```

### 타입

| 타입 | 용도 |
|------|------|
| init | 초기 설정 |
| feat | 새 기능 |
| fix | 버그 수정 |
| docs | 문서 |
| refactor | 리팩토링 |
| chore | 기타 |

### 예시

```
docs: AI 협업 가이드 Git Flow 추가

* 브랜치 전략 정의 (main, develop, feature/*)
* 커밋 메시지 형식 상세화
* 커밋 전 체크리스트 추가
```

## 설정 파일

| 파일 | 범위 | Git |
|------|------|-----|
| `.claude/settings.json` | 공통 설정 | 추적 |
| `.claude/settings.local.json` | 로컬 전용 | 무시 |
| `.claude/skills/` | 워크플로우 스킬 (`/spec`, `/implement`, `/commit` 등) | 추적 |

## 프로젝트별 커스텀

프로젝트 전용 설정이 필요하면:

- `CLAUDE.md` 하단에 프로젝트 고유 규칙 추가
- `README.md`에 기술 스택, 디렉토리 구조, 실행 방법 등 작성
- `.claude/settings.local.json`에 로컬 전용 설정 추가
