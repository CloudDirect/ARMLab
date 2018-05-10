# Virtual Machine

This template deploys a Virtual Machine to Azure. 

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2FvirtualMachine%2Fazuredeploy.json)


## Deploy from Azure CLI

	Update Parameters in the azuredeploy.parameters.json
	
	az group deployment create --resource-group infra-prod-rg --name deployUbuntu --template-file "virtualMachine/azuredeploy.json" --parameters	"@virtualMachine/azuredeploy.parameters.json" --no-wait


## Deploy from Azure Portal (UI Experience)

Steps:
1.  This template uses Managed Disks, there is no need to create a storage account to hold your disks.
2.  Logon to http://portal.azure.com
3.  New and search for "Template Deployment"
4.  Copy and paste the contents of azuredeploy.json into "Edit Template"
5.  Update all Parameters
6.  Follow the rest of the UI
