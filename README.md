# dotfiles
# 다운받은 README.txt를 dotfiles 폴더로 이동
Move-Item "$HOME\Downloads\README.txt" "$HOME\.dotfiles\README.txt"

# GitHub에 push
cd $HOME\.dotfiles
git add .
git commit -m "Add README.txt"
git push
```

이러면 dotfiles 레포 구조가 이렇게 됩니다:
```
dotfiles/
├── .claude/
│   └── CLAUDE.md       ← Claude 지침
├── install.ps1          ← 자동 설치 스크립트
└── README.txt           ← 사용 설명서
