# robot-t410-rootfs
Tweaks done to the final root file system to customise it for a particular application

## To install
run `install.bat` or `install.sh` to automatically copy the file to the remote system.  
* Windows requires Putty to be installed. If needed modify the script file for your setup.
* Linux requires that an SSH client is available.

## Information
This setup provides a QT Based Kiosk like custom web browser. It provides access to only two
URLs, a local user interface and remote boot URL. The local UI is used to configure the device
as well.
