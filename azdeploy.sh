#!/bin/bash
echo '/////////////////////////////////////////////////////////////'

echo '////////////////----Deployin-Bicep-Script---\\\\\\\\\\\\\\\\'

echo '/////////////////////////////////////////////////////////////'
echo '##############################################################'

az deployment group create \
--resource-group  NT-Prod-Platform-Partner-RG \
--template-file documentsvc.bicep \
--parameters service='prodplat81-Test'  \
  --confirm-with-what-if \

echo '#################################################x#############'

echo '\\\\\\\\\\\\\\\\\  --- SCRIPT-COMPLETE ---//////////////////////'


