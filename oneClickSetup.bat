@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

REM ── 관리자 권한 자동 승격 (mklink 에 필요) ──────────────────
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 관리자 권한이 필요합니다. 권한 상승 후 다시 실행합니다...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%~f0'"
    exit /b
)

REM ── dotfiles 폴더 = 이 배치 파일이 있는 위치 (자동 인식) ──────
set "DOTFILES=%~dp0"
if "%DOTFILES:~-1%"=="\" set "DOTFILES=%DOTFILES:~0,-1%"

echo dotfiles 폴더: %DOTFILES%
echo 사용자 폴더 : %USERPROFILE%
echo.

REM ── 링크 생성 대상 목록 ─────────────────────────────────────
set "FILES=.editorconfig .clang-format .gitconfig"

for %%F in (%FILES%) do (
    if not exist "%DOTFILES%\%%F" (
        echo [건너뜀] %%F  - dotfiles 폴더에 원본이 없습니다.
    ) else (
        REM 기존 파일/링크가 있으면 백업 후 제거
        if exist "%USERPROFILE%\%%F" (
            echo [백업]   %%F  - 기존 파일을 %%F.bak 으로 이동
            move /y "%USERPROFILE%\%%F" "%USERPROFILE%\%%F.bak" >nul
        )
        mklink "%USERPROFILE%\%%F" "%DOTFILES%\%%F" >nul && (
            echo [완료]   %%F
        ) || (
            echo [실패]   %%F
        )
    )
)

echo.
echo 모든 작업이 끝났습니다.
pause
