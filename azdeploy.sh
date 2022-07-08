#!/bin/bash
echo '/////////////////////////////////////////////////////////////'

echo '////////////////----Deployin-Bicep-Script---\\\\\\\\\\\\\\\\'

echo '/////////////////////////////////////////////////////////////'
echo '##############################################################'

az deployment group create \
--resource-group  NT-Prod-Platform-Communications-RG \
--template-file nafprod.bicep \
--parameters service='NT-Prod-Platform-Communications' \
--confirm-with-what-if \

echo '#################################################x#############'
echo '\\\\\\\\\\\\\\\\\  --- SCRIPT-COMPLETE ---//////////////////////'


