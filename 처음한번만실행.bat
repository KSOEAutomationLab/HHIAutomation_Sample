@echo off
:CopyHHIAutomationFolder
echo C����̺꿡 ���������� ��ũ�մϴ�
echo ---------------------------------------
if not exist "C:\HHIAutomation" mkdir "C:\HHIAutomation"
if exist "C:\HHIAutomation\OpenBlockWeldingRobot_Server" (
	set /p answer=�̹� ��ũ�� ������ �ֽ��ϴ�. ���� ��ũ�Ͻðڽ��ϱ�? Y or N  : 
) else (
	mklink /J C:\HHIAutomation\OpenBlockWeldingRobot_Server OpenBlockWeldingRobot_Server
	echo ���ο� ��ũ�� �����մϴ�.
)
IF /i "%answer:~,1%"=="Y" (
	echo ���� �� �� ��ũ�մϴ�.
	rmdir C:\HHIAutomation\OpenBlockWeldingRobot_Server
	mklink /J C:\HHIAutomation\OpenBlockWeldingRobot_Server OpenBlockWeldingRobot_Server
) ELSE (
	echo ���� ��ũ�� �����ϸ� ������ �����մϴ�.
)

pause