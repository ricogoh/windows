@echo off
REM Remove Windows history files

setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

echo ... Deleting History ...

Del /F /Q %APPDATA%\Microsoft\Windows\Recent\*
Del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
Del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F
REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /VA /F

echo ... End ...

:END
endlocal