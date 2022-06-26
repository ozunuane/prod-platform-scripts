#!/bin/bash
echo '/////////////////////////////////////////////////////////////'

echo '////////////////----Deployin-Bicep-Script---\\\\\\\\\\\\\\\\'

echo '/////////////////////////////////////////////////////////////'
echo '##############################################################'

az deployment group create \
--resource-group  NT-Prod-Platform-Partner-RG \
--template-file documentsvc1.bicep \
--parameters service='NT-Prod-Platform-Pa11' --confirm-with-what-if \

echo '#################################################x#############'

echo '\\\\\\\\\\\\\\\\\  --- SCRIPT-COMPLETE ---//////////////////////'


