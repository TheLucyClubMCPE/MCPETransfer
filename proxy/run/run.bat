@echo off
echo STARTING RAKLIB BINARIE SOCKETS
title Loading RakLib Binaries...
sleep 5
echo Starting MCPE-Transfer-1.0.98_devBuild#3352
title Loading Main/Proxy-Lib
sleep 10
title MCPE-Transfer-1.0.98_devBuild#3352
echo [Proxy] Started
echo [ProxyThread/Info] Locating local proxy hosts...
ping 127.0.0.1
ping Servers Here
echo [ProxyThread/Info] Found %n proxy(s)
echo ==============[Hosts]===============
echo error.noHostsFound
echo ====================================
echo [ProxyThread/Notice] STARTED PROXY LOGGING
timeout /t 1
echo [ProxyThread/Warning] Currently proxy logging is not implented, so if this doesn't work, then just know you're not doing anything wrong.
echo To keep from overwelming the CPU, the proxy will sleep for 20 seconds
sleep 20
goto :loop
echo [ProxyThread/Notice] Done. Now switching to log

:loop
echo [RakLib/Main] Locating more hosts in 10 seconds !
timeout /t 10
ping 127.0.0.1:19132
ping 192.168.local.local:port
ping 192.168.local.local:port
ping 192.168.local.local:port
/* You can also add external servers, e.g. ping sg.lbsg.net:19132 */
echo [RakLib/Notice] %ping.network.resultsServers
goto :loop
