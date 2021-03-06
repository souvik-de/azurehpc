#!/bin/bash

resource_group=$1
node_name=$2
ad_domain=$3
ad_user=$4
ad_password=$5

echo "Calling ad_nfs.ps1..."
echo resource_group $1
echo node_name $2
echo ad_domain $3
echo ad_user $4
echo ad_password $5


az vm run-command invoke \
    --name $node_name  \
    --resource-group $resource_group \
    --command-id RunPowerShellScript \
    --scripts @$azhpc_dir/scripts/ad_nfs.ps1 \
    --parameters ad_domain=$ad_domain ad_user=$ad_user ad_password=$ad_password \
    --output table

echo "AD nfs setup done"

