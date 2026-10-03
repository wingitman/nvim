@echo off
rem Load this from an interactive Command Prompt to define the `z` macro.
rem Example: call C:\path\to\zoxide-init.cmd
doskey z=for /f "delims=" %%i in ('zoxide query -- $*') do @cd /d "%%i"
