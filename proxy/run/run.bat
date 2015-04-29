@echo off
echo Locating local proxy hosts...
echo Found 2 proxy(s)
echo ==============[Hosts]===============
echo MC-SERVER: 192.168.0.26 
echo HOME: 192.168.0.16 
echo SAMSUNG GT-P7510: 192.168.0.36
echo ====================================
echo STARTED PROXY LOGGING
echo SAMSUNG-p4wifi[/192.168.0.36:19133] lost connection to HOME: Kicked by admin. Reason: Changing SERVER
echo SAMSUNG-p4wifi[/192.168.0.36:19132] inbound to MC-SERVER
echo SAMSUNG-p4wifi[/192.168.0.36:19132] connection tunnel dropped
echo SAMSUNG-p4wifi[/192.168.0.36:ERROR] connection lost
echo [/192.168.0.0:44444] error.emptyNameSpace
echo SAMSUNG-p4wifi[/192.168.0.36:19132] inbound to MC-SERVER
echo SAMSUNG-p4wifi[/192.168.0.36:19132] connection tunnel denied
echo SAMSUNG-p4wifi[/192.168.0.36:ERROR] connection lost
echo SAMSUNG-p4wifi[/192.168.0.36:19132] inbound to MC-SERVER
echo SAMSUNG-p4wifi[/192.168.0.36:19132] connection accepted
echo SAMSUNG-p4wifi has joined MC-SERVER
color 6
goto :loop

:loop
goto :loop