# Azure Database for MySQL

This template deploys an Azure Database for PostgreSQL to Azure. 

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2FpostgreSql%2Fazuredeploy.json)


## Deploy from Azure CLI

	Update Parameters in the azuredeploy.parameters.json
	
	az group deployment create --resource-group data-prod-rg --name postgreSql --template-file "postgreSql/azuredeploy.json" --parameters "@postgreSql/azuredeploy.parameters.json"


## Deploy from Azure Portal (UI Experience)

Steps:
1.  Logon to http://portal.azure.com
2.  New and search for "Template Deployment"
3.  Copy and paste the contents of azuredeploy.json into "Edit Template"
4.  Update all Parameters
5.  Follow the rest of the UI

## Create PostgreSQL databases within the Azure Database for PostgreSQL server
