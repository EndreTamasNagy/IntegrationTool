@echo off

set IP=%1

echo /opt/bin/sc vncpwd set companynetwork dummy_password 
plink -batch -pw SUNRISE manufact@%IP% "/opt/bin/sc vncpwd set companynetwork dummy_password"
echo sed -i 's/=1$/=0/g' /user/system/etc/sinumerikvnc.ini
plink -batch -pw SUNRISE manufact@%IP% "sed -i 's/=1$/=0/g' /user/system/etc/sinumerikvnc.ini"
echo /opt/bin/sc reboot
plink -batch -pw SUNRISE manufact@%IP% "/opt/bin/sc reboot"