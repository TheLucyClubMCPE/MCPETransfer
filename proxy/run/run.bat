@echo off
echo Locating local proxy hosts...
ping 192.168.0.1
echo Found 0 proxy(s)
echo ==============[Hosts]===============
echo error.noHostsFound
echo ====================================
echo STARTED PROXY LOGGING
echo [NOTICE] Currently proxy logging is not implented, so if this doesn't work, then just know you're not doing anything wrong.
echo mcpetransfer\exit.li exit 1
goto :loop

:loop
goto :loop
