# dotfiles

개인 개발 환경 설정 파일 모음

## 파일 목록

- `.editorconfig` - 모든 언어 공통 코드 스타일 설정 (들여쓰기, 줄 끝 문자 등)
- `.clang-format` - C/C++ 포맷팅 설정
- `.gitconfig` - Git 전역 설정

## 새 컴퓨터에서 설정하기

### 1. 클론
```cmd
git clone https://github.com/YoungGong0601/dotfiles.git C:\Users\사용자명\dotfiles
```

### 2. 심볼릭 링크 생성 (관리자 권한 CMD)
```cmd
mklink C:\Users\사용자명\.editorconfig C:\Users\사용자명\dotfiles\.editorconfig
mklink C:\Users\사용자명\.clang-format C:\Users\사용자명\dotfiles\.clang-format
mklink C:\Users\사용자명\.gitconfig C:\Users\사용자명\dotfiles\.gitconfig
```

### 3. 완료
이후 설정 변경 시 `dotfiles` 폴더에서 수정 후 푸시하면 자동 동기화됩니다.
```cmd
git add .
git commit -m "설정 변경 내용"
git push
```