========================================
  dotfiles / install.ps1 사용 설명서
========================================

[ 이 파일이 하는 일 ]
새 Windows 컴퓨터에서 Claude 설정(CLAUDE.md)을 자동으로 적용해주는 스크립트입니다.
한 번만 실행하면 아래 환경에서 Claude 지침이 자동으로 활성화됩니다.

  - Claude Code (터미널)
  - Claude Code (VS Code 익스텐션)
  - Claude Desktop App (Cowork)
  - Antigravity (Claude Code 익스텐션 설치 시)


========================================
  사전 준비
========================================

1. Git 설치 (이미 있으면 건너뜀)
   https://git-scm.com 에서 다운로드 및 설치

2. PowerShell을 관리자 권한으로 실행
   시작 메뉴 → PowerShell 우클릭 → "관리자 권한으로 실행"


========================================
  설치 방법 (새 컴퓨터에서)
========================================

[ 방법 1 - 원클릭 설치 (권장) ]
PowerShell 관리자 권한으로 실행 후 아래 한 줄 붙여넣기:

  irm https://raw.githubusercontent.com/pugi94/dotfiles/main/install.ps1 | iex

인터넷만 되면 GitHub에서 자동으로 받아와서 실행됩니다.


[ 방법 2 - 파일 직접 실행 ]
install.ps1 파일을 다운받은 경우:

  1. PowerShell을 관리자 권한으로 실행
  2. 아래 명령어 실행:

     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
     .\install.ps1


========================================
  설치 시 자동으로 진행되는 작업
========================================

  [1] 관리자 권한 확인
  [2] Git 설치 여부 확인
  [3] GitHub에서 dotfiles 레포 클론 (또는 업데이트)
  [4] ~/.claude 심볼릭 링크 연결
  [5] Git 사용자 정보 설정 (이메일, 이름)


========================================
  CLAUDE.md 내용 수정하고 싶을 때
========================================

어느 컴퓨터에서든 아래 순서로 수정합니다.

  1. 파일 열기:
     notepad $HOME\.dotfiles\.claude\CLAUDE.md

  2. 내용 수정 후 저장 (Ctrl+S)

  3. GitHub에 반영:
     cd $HOME\.dotfiles
     git add .
     git commit -m "Update CLAUDE.md"
     git push

  4. 다른 컴퓨터에서 최신 내용 받기:
     cd $HOME\.dotfiles
     git pull


========================================
  Claude 지침 주요 커맨드
========================================

  /compress 또는 /save  →  현재 대화 압축 후 chatlog.md 저장
  /reset               →  대화 저장 후 세션 초기화


========================================
  적용되는 환경 / 적용 안 되는 환경
========================================

  ✅ 적용됨
     - Claude Code (터미널 / VS Code)
     - Claude Desktop App (Cowork)
     - Antigravity (Claude Code 익스텐션 설치 시)

  ❌ 적용 안 됨 (로컬 파일 접근 불가)
     - Claude.ai 웹사이트
     - Claude 모바일 앱

  → 웹/모바일에서도 동일한 지침을 적용하려면
    Claude.ai → Settings → General → Profile 에 CLAUDE.md 내용을 직접 붙여넣으세요.


========================================
  문제 해결
========================================

  오류: "이 시스템에서 스크립트를 실행할 수 없습니다"
  해결: PowerShell에서 아래 명령어 실행 후 재시도
        Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

  오류: "관리자 권한이 필요합니다"
  해결: PowerShell을 우클릭 → 관리자 권한으로 실행

  오류: "Git을 찾을 수 없습니다"
  해결: https://git-scm.com 에서 Git 설치 후 재시도


========================================
  레포지토리
========================================

  https://github.com/pugi94/dotfiles

========================================
