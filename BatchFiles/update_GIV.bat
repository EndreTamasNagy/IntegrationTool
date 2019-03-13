@echo off

::get input from the user
echo Possible rack or NCU names: 
echo standard2, multi1, multi2, multi3, multi4, ppu3, ppu4
set /p input1=Please enter the rack or NCU name: 

::if the input is empty..
if [%input1%] == [] ( call:Error )

call:SetIP

::1=NCU IP address, 2=fileName
pscp -batch -pw SUNRISE %1 manufact@%IP%:/user
plink -batch -pw SUNRISE manufact@%IP% "/opt/bin/sc stop nck hmi && /opt/bin/sc restore -update -force /user/%1; rm /user/%1 && /opt/bin/sc reboot"

::End of Program (skip any code below)
goto :eof

::===FUNCTION DEFINITIONS===
::determining the IP address
:SetIP
	IF %input1% == standard2 ( set IP=10.10.138.63)
	IF %input1% == multi1 ( set IP=10.10.136.158)
	IF %input1% == multi2 ( set IP=10.10.136.182)
	IF %input1% == multi3 ( set IP=10.10.136.173)
	IF %input1% == multi4 ( set IP=10.10.136.141)
	IF %input1% == ppu4 ( set IP=10.10.139.28)
	IF %input1% == ppu3 ( set IP=10.10.138.129)
	echo Host %IP% is chosen
	EXIT /B 0

::handle Error
:Error
echo You did not enter anything. Bye bye!
pause