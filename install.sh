#!/bin/sh

REMOTE=$1

echo Installing ROBOT T210 Root Filesystem Additional Files...

scp -r etc/* root@$REMOTE:/etc/.
scp -r home/* root@$REMOTE:/home/.
scp -r usr/* root@$REMOTE:/usr/.
scp -r sbin/* root@$REMOTE:/sbin/.
scp -r lib/* root@$REMOTE:/lib/.

echo Installation complete. Performing post installation tasks.
