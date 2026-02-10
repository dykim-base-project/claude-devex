#!/bin/bash
# claude-devex: 기존 프로젝트에 이슈 사이클 스킬 설치
# 사용법: curl -sL https://raw.githubusercontent.com/dykim-base-project/claude-devex/main/setup.sh | bash

set -e

REPO="dykim-base-project/claude-devex"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

echo "=== claude-devex 이슈 사이클 설치 ==="
echo ""

# 1. .claude/skills/ 공통 스킬 설치 (항상 최신으로 업데이트)
SKILLS="github-issue spec implement commit github-pr"
for skill in $SKILLS; do
  mkdir -p ".claude/skills/${skill}"
  curl -sL "${BASE_URL}/.claude/skills/${skill}/SKILL.md" -o ".claude/skills/${skill}/SKILL.md"
  echo "[설치] .claude/skills/${skill}/SKILL.md"
done

# 2. .claude/settings.json (없으면 생성)
if [ ! -f ".claude/settings.json" ]; then
  curl -sL "${BASE_URL}/.claude/settings.json" -o ".claude/settings.json"
  echo "[생성] .claude/settings.json"
else
  echo "[유지] .claude/settings.json (이미 존재)"
fi

# 3. .claude/README.md (없으면 생성)
if [ ! -f ".claude/README.md" ]; then
  curl -sL "${BASE_URL}/.claude/README.md" -o ".claude/README.md"
  echo "[생성] .claude/README.md"
else
  echo "[유지] .claude/README.md (이미 존재)"
fi

# 4. CLAUDE.md (없으면 템플릿 복사)
if [ ! -f "CLAUDE.md" ]; then
  curl -sL "${BASE_URL}/CLAUDE.md" -o "CLAUDE.md"
  echo "[생성] CLAUDE.md"
else
  echo "[유지] CLAUDE.md (이미 존재)"
fi

# 5. .gitignore에 .claude/ 관련 패턴 추가
if [ -f ".gitignore" ]; then
  if ! grep -q "settings.local.json" ".gitignore" 2>/dev/null; then
    echo "" >> ".gitignore"
    echo "# Claude Code 로컬 설정" >> ".gitignore"
    echo ".claude/settings.local.json" >> ".gitignore"
    echo "[추가] .gitignore에 Claude 패턴 추가"
  else
    echo "[유지] .gitignore (패턴 이미 존재)"
  fi
else
  echo "# Claude Code 로컬 설정" > ".gitignore"
  echo ".claude/settings.local.json" >> ".gitignore"
  echo "[생성] .gitignore"
fi

echo ""
echo "=== 설치 완료 ==="
echo ""
echo "사용법:"
echo "  /github-issue  - GitHub 이슈 생성"
echo "  /spec          - 명세(설계) 작성"
echo "  /implement     - 코드 구현"
echo "  /commit        - 변경사항 리뷰 및 커밋"
echo "  /github-pr     - PR 생성"
echo ""
echo "상세 가이드: .claude/README.md"
