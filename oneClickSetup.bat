@echo off
set /p DOTFILES=Enter dotfiles folder path (e.g. C:\Users\lovel\dotfiles): 

mklink %USERPROFILE%\.editorconfig %DOTFILES%\.editorconfig
mklink %USERPROFILE%\.clang-format %DOTFILES%\.clang-format
mklink %USERPROFILE%\.gitconfig %DOTFILES%\.gitconfig

echo Done! Symbolic links created successfully.
pause