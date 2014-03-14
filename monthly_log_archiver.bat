@echo off

REM Log out put directory
cd \temp\poderosa
REM you also need to make a directory \temp\poderosa\old

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

if %mm%==01 (set mm=12& set dd=31 & set /a yy=%yy%-1)
if %mm%==02 (set mm=01& set dd=31)
if %mm%==03 (set mm=02& set dd=28 & if %ymod%==0 (set dd=29))
if %mm%==04 (set mm=03& set dd=31)
if %mm%==05 (set mm=04& set dd=30)
if %mm%==06 (set mm=05& set dd=31)
if %mm%==07 (set mm=06& set dd=30)
if %mm%==08 (set mm=07& set dd=31)
if %mm%==09 (set mm=08& set dd=31)
if %mm%==10 (set mm=09& set dd=30)
if %mm%==11 (set mm=10& set dd=31)
if %mm%==12 (set mm=11& set dd=30)

@echo on

if not exist old\%yy%%mm%.zip (
  C:\Temp\7za920\7za.exe a old\%yy%%mm%.zip .\*%yy%%mm%*
  del .\*%yy%%mm%*
)
