@echo off
rem  ----------------------------------------------------------------------------
rem                 RADICAL ELECTRONIC SYSTEMS
rem          (C) 2016 - www.radicalsystems.co.za
rem  ----------------------------------------------------------------------------
rem  ROBOT T410 Additional RootFS files installation script
rem  ----------------------------------------------------------------------------

set _PUTTY_PATH="c:\Program Files (x86)\PuTTY\"
set _PSCP=pscp.exe
set _SCPCMD=%_PUTTY_PATH%\%_PSCP%
set _REMOTE=%1

echo Copying files remote Robot-T410 filesystem @ %_REMOTE%
%_SCPCMD% -r etc/* root@%_REMOTE%:/etc/.
%_SCPCMD% -r home/* root@%_REMOTE%:/home/.
%_SCPCMD% -r usr/* root@%_REMOTE%:/usr/.
echo Installation complete
