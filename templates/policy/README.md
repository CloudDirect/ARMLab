# Azure Policy

This template deploys Azure Policy to Azure. 

This policy restricts all resources to UK only (UK South and UK West datacentres).

## Deploy from Azure CLI

	az policy definition create --name 'allowed-locations-uk' --display-name 'Allowed locations - UK only' --description 'This policy restricts resource provisioning to UK only.' --rules "policy/azuredeploy.json" --params "policy/azuredeploy.parameters.json" --mode All
	
	az policy assignment create --name 'Allowed locations - UK only' --policy 'allowed-locations-uk' --params '{"listOfAllowedLocations":{"value":["ukwest","uksouth"]}}'
