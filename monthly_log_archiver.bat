@echo off
call config.bat

REM Log out put directory
cd %DIR%
dir
mkdir old

set dt=%date%
set yy=%dt:~-10,4%
set mm=%dt:~-5,2%
set dd=%dt:~-2,2%
echo Today is %yy%/%mm%/%dd%.
echo.

REM last month

set /a dd=1%dd%-101
set dd=00%dd%
set dd=%dd:~-2%
set /a ymod=%yy% %% 4

if %mm%==01 (set mm=12)
if %mm%==02 (set mm=01)
if %mm%==03 (set mm=02)
if %mm%==04 (set mm=03)
if %mm%==05 (set mm=04)
if %mm%==06 (set mm=05)
if %mm%==07 (set mm=06)
if %mm%==08 (set mm=07)
if %mm%==09 (set mm=08)
if %mm%==10 (set mm=09)
if %mm%==11 (set mm=10)
if %mm%==12 (set mm=11)

@echo on

if not exist old\%yy%%mm%.zip (
  cd %DIR%
  cd
  %ZIP% a old\%yy%%mm%.zip .\*%yy%%mm%*
  #pause
  del .\*%yy%%mm%*
)
