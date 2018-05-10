# Azure Database for MySQL

This template deploys an Azure Database for MySQL to Azure. 

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2FmySql%2Fazuredeploy.json)


## Deploy from Azure CLI

	Update Parameters in the azuredeploy.parameters.json
	
	az group deployment create --resource-group data-prod-rg --name deployMySql --template-file "mySql/azuredeploy.json" --parameters "@mySql/azuredeploy.parameters.json" --no-wait


## Deploy from Azure Portal (UI Experience)

Steps:
1.  Logon to http://portal.azure.com
2.  New and search for "Template Deployment"
3.  Copy and paste the contents of azuredeploy.json into "Edit Template"
4.  Update all Parameters
5.  Follow the rest of the UI

## Create MySQL databases within the Azure Database for MySQL server

	az mysql db create -g data-prod-rg -s mysql-prod-123 -n mysqldb1
