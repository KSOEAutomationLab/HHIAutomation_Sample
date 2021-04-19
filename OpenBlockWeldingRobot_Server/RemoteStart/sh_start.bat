@echo off
taskkill /f /im "putty.exe"
putty.exe -ssh root@192.168.100.240 -pw root -m "C:\HHIAutomation\OpenBlockWeldingRobot_Server\RemoteStart\sh_commands.txt"
exit