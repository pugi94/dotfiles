# 🗂️ dotfiles

> Windows 환경에서 Claude AI 설정을 어디서든 동기화하는 개인 설정 저장소입니다.

---

## 📦 포함된 설정

| 파일 | 설명 |
|------|------|
| `.claude/CLAUDE.md` | Claude 동작 지침 (컨텍스트 관리, 세션 초기화, 한국어 응답 등) |
| `install.ps1` | 새 컴퓨터에서 자동으로 설정을 적용하는 PowerShell 스크립트 |
| `README.txt` | install.ps1 상세 사용 설명서 |

---

## ⚡ 새 컴퓨터에서 설치 (원클릭)

**PowerShell을 관리자 권한으로 실행** 후 아래 한 줄만 실행하면 끝입니다.

```powershell
irm https://raw.githubusercontent.com/pugi94/dotfiles/main/install.ps1 | iex
```

### 자동으로 진행되는 작업
1. 관리자 권한 확인
2. Git 설치 여부 확인
3. 이 레포를 `~\.dotfiles`에 클론
4. `~\.claude` 심볼릭 링크 연결
5. Git 사용자 정보 설정

---

## ✅ 적용되는 환경

| 환경 | 적용 여부 |
|------|-----------|
| Claude Code (터미널) | ✅ |
| Claude Code (VS Code 익스텐션) | ✅ |
| Claude Desktop App (Cowork) | ✅ |
| Antigravity (Claude Code 익스텐션 설치 시) | ✅ |
| Claude.ai 웹 / 모바일 | ❌ (별도 설정 필요) |

---

## 📝 CLAUDE.md 주요 기능

### 자동 실행
- 모든 작업 시작 전 `chatlog.md`를 자동으로 읽어 이전 맥락을 이어갑니다.

### 커맨드
| 커맨드 | 동작 |
|--------|------|
| `/compress` 또는 `/save` | 현재 대화를 압축해 `chatlog.md`에 저장 |
| `/reset` | 대화 저장 후 세션 초기화 |

### chatlog.md 저장 형식
```markdown
## [YYYY-MM-DD HH:MM] Session Summary
- **Goal**: 이 세션에서 하려던 것
- **Completed**: 완료된 작업
- **In Progress**: 미완료 작업
- **Key Decisions**: 핵심 결정사항
- **Next Steps**: 다음 작업
```

---

## 🔄 CLAUDE.md 수정 방법

```powershell
# 1. 파일 열기
notepad $HOME\.dotfiles\.claude\CLAUDE.md

# 2. 수정 후 저장 (Ctrl+S)

# 3. GitHub에 반영
cd $HOME\.dotfiles
git add .
git commit -m "Update CLAUDE.md"
git push
```

다른 컴퓨터에서 최신 내용 받기:
```powershell
cd $HOME\.dotfiles
git pull
```

---

## 🛠️ 문제 해결

**스크립트 실행 오류**
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**관리자 권한 오류**
> PowerShell 우클릭 → 관리자 권한으로 실행

**Git 없음 오류**
> https://git-scm.com 에서 설치 후 재시도
