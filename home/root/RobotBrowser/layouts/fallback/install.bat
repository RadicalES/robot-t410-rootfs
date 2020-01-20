@echo off
rem  ----------------------------------------------------------------------------
rem                 RADICAL ELECTRONIC SYSTEMS
rem          (C) 2017 - www.radicalsystems.co.za
rem  ----------------------------------------------------------------------------
rem  ROBOT T410 Additional RootFS files installation script
rem  ----------------------------------------------------------------------------

set _PUTTY_PATH="c:\Program Files (x86)\PuTTY\"
set _PSCP=pscp.exe
set _SCPCMD=%_PUTTY_PATH%\%_PSCP%
set _REMOTE=192.168.100.10

echo Copying files remote Robot-T410 filesystem @ %_REMOTE%
%_SCPCMD% *.qml root@%_REMOTE%:/home/root/RobotBrowser/layouts/fallback/.

echo Installation complete
