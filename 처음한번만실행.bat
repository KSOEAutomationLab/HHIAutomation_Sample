@echo off
:CopyHHIAutomationFolder
echo C드라이브에 공용폴더를 링크합니다
echo ---------------------------------------
if not exist "C:\HHIAutomation" mkdir "C:\HHIAutomation"
if exist "C:\HHIAutomation\OpenBlockWeldingRobot_Server" (
	set /p answer=이미 링크된 폴더가 있습니다. 새로 링크하시겠습니까? Y or N  : 
) else (
	mklink /J C:\HHIAutomation\OpenBlockWeldingRobot_Server OpenBlockWeldingRobot_Server
	echo 새로운 링크를 설정합니다.
)
IF /i "%answer:~,1%"=="Y" (
	echo 삭제 후 재 링크합니다.
	rmdir C:\HHIAutomation\OpenBlockWeldingRobot_Server
	mklink /J C:\HHIAutomation\OpenBlockWeldingRobot_Server OpenBlockWeldingRobot_Server
) ELSE (
	echo 기존 링크를 유지하며 설정을 종료합니다.
)

pause