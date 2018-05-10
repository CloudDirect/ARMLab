# Storage

This template deploys an Azure Storage account to Azure. 

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2Fstorage%2Fazuredeploy.json)


## Deploy from Azure CLI

	Update Parameters in the azuredeploy.parameters.json
	
	az group deployment create --resource-group infra-prod-rg --name deployStorage --template-file "storage/azuredeploy.json" --parameters "storage/azuredeploy.parameters.json"


## Deploy from Azure Portal (UI Experience)

Steps:
1.  Logon to http://portal.azure.com
2.  New and search for "Template Deployment"
3.  Copy and paste the contents of azuredeploy.json into "Edit Template"
4.  Update all Parameters
5.  Follow the rest of the UI
