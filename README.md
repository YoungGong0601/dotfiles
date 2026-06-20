# dotfiles

개인 개발 환경 설정 파일 모음

## 파일 목록

- `.editorconfig` - 모든 언어 공통 코드 스타일 설정 (들여쓰기, 줄 끝 문자 등)
- `.clang-format` - C/C++ 포맷팅 설정
- `.gitconfig` - Git 전역 설정

## 새 컴퓨터에서 설정하기

### 1. 클론
```cmd
git clone https://github.com/YoungGong0601/dotfiles.git %USERPROFILE%\dotfiles
```

### 2. 자동 설정 실행
`oneClickSetup.bat` 더블클릭만 하면 끝입니다.

- 관리자 권한이 **자동으로 승격**됩니다 (UAC 창에서 "예" 클릭)
- dotfiles 폴더 경로를 **자동으로 인식**합니다 (입력 불필요)
- 심볼릭 링크를 자동 생성하고, 기존 파일이 있으면 `.bak` 으로 백업합니다

> 명령줄에서 실행하려면: `%USERPROFILE%\dotfiles\oneClickSetup.bat`

### 3. 완료
이후 설정 변경 시 `dotfiles` 폴더에서 수정 후 푸시하면 자동 동기화됩니다.
```cmd
git add .
git commit -m "설정 변경 내용"
git push
```