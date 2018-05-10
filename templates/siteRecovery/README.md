# Azure Site Recovery

This template deploys a Recovery Services vault to Azure. 

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2FsiteRecovery%2Fazuredeploy.json)


## Deploy from Azure CLI

	Update Parameters in the azuredeploy.parameters.json
	
	az group deployment create --resource-group infra-prod-dr-rg --name deploySiteRecovery --template-file "siteRecovery/azuredeploy.json" --parameters "@siteRecovery/azuredeploy.parameters.json"


## Deploy from Azure Portal (UI Experience)

Steps:
1.  Logon to http://portal.azure.com
2.  New and search for "Template Deployment"
3.  Copy and paste the contents of azuredeploy.json into "Edit Template"
4.  Update all Parameters
5.  Follow the rest of the UI

For protection to VMware, Hyper-V and Azure to Azure scenarios, see the following documentation:
- [VMware to Azure Tutorial](https://docs.microsoft.com/en-us/azure/site-recovery/tutorial-prepare-azure)
- [Hyper-V to Azure Tutorial](https://docs.microsoft.com/en-us/azure/site-recovery/tutorial-prepare-azure)
- [Azure to Azure Quickstart](https://docs.microsoft.com/en-us/azure/site-recovery/azure-to-azure-quickstart)
- [Azure to Azure Tutorial](https://docs.microsoft.com/en-us/azure/site-recovery/azure-to-azure-tutorial-enable-replication)
