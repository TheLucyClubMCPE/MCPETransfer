@echo off
echo STARTING RAKLIB BINARIE SOCKETS
title Loading RakLib Binaries...
ping 1.2.3.4 -n 4000>nul
echo Starting MCPE-Transfer-1.0.98_devBuild#3352
title Loading Main/Proxy-Lib
ping 1.2.3.4 -n 5000>nul
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
ping 1.2.3.4 -n 3000>nul
echo [ProxyThread/Warning] Currently proxy logging is not implented, so if this doesn't work, then just know you're not doing anything wrong.
echo To keep from overwelming the CPU, the proxy will sleep for 20 seconds
ping 1.2.3.4 -n 20000>nul
goto :loop
echo [ProxyThread/Notice] Done. Now switching to log

:loop
echo [RakLib/Main] Locating more hosts in 10 seconds !
ping 1.2.3.4 -n 2000>nul
ping 127.0.0.1:19132>nul
ping 192.168.local.local:port>nul
ping 192.168.local.local:port>nul
ping 192.168.local.local:port>nul
/* You can also add external servers, e.g. ping sg.lbsg.net:19132 */
echo [RakLib/Notice] %ping.network.resultsServers
goto :loop
