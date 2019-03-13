::Parameter 1 = NCU IP address 
::Parameter 2 = fileName with tgz extension
@echo off

call:GetInput
call:SetIP

::location of ini files
set iniLocation=\\tdt\Transfershare\PR_Team\AutomateNCU\INI_files\
::set the console location where the pscp.exe is located
::set PATH=c:\Program Files (x86)\Siemens\MotionControl\siemens\sinumerik\hmi\base\

::upload ini file
echo execute pscp
pscp -batch -l manufact -pw SUNRISE %iniLocation%update.ini %IP%:/user/sinumerik/nck/

pause
::performs a reboot
echo execute plink
plink -batch -pw SUNRISE manufact@%IP% "/opt/bin/sc reboot"	
pause
goto :eof

::===FUNCTION DEFINITIONS===
::get input from the user
:GetInput
	echo To list possible rack or NCU names type 'help'
	set /p input1=Please enter the rack or NCU name:
	EXIT /B 0

::determining the IP address
:SetIP
	IF %input1% == ncu1 ( set IP=163.242.252.131 )
	IF %input1% == ncu2 ( set IP=163.242.252.132 )
	IF %input1% == ncu3 ( set IP=163.242.252.133 )
	IF %input1% == ncu4 ( set IP=163.242.252.134 )
	IF %input1% == sepultura ( set IP=163.242.252.167 )
	IF %input1% == gyulus (	set IP=163.242.132.43 )
	IF %input1% == nirvana ( set IP=163.242.252.150 )
	IF %input1% == pataky ( set IP=163.242.252.190 )
	IF %input1% == pepsi ( set IP=163.242.252.149 )
	IF %input1% == paksi ( set IP=163.242.252.166 )
	IF %input1% == armin ( set IP=163.242.252.248 )
	IF %input1% == oz (	set IP=163.242.252.239 )
	IF %input1% == 828 ( set IP=163.242.252.183 )
	echo Host %IP% is chosen
	EXIT /B 0