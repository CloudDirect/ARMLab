# Virtual Network

This template deploys a Virtual Network to Azure. 

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2FvNet%2Fazuredeploy.json)


## Deploy from Azure CLI

	Update Parameters in the azuredeploy.parameters.json
	
	az group deployment create --resource-group network-prod-rg --name deployNetwork --template-file "vNet/azuredeploy.json" --parameters "@vNet/azuredeploy.parameters.json"


## Deploy from Azure Portal (UI Experience)

Steps:
1.  Logon to http://portal.azure.com
2.  New and search for "Template Deployment"
3.  Copy and paste the contents of azuredeploy.json into "Edit Template"
4.  Update all Parameters
5.  Follow the rest of the UI

## Parameters

| Parameter                      | Description 
| ------------------------------ | ----------- 
| vNet / name                    | Name of the Virtual Network.
| vNet / resourceGroup           | Resource Group of the Virtual Network.
| vNet / addressPrefixes         | Subnet ranges within the Virtual Network in CIDR notation. Can be multiple ranges.
| vNet / dnsServerAddresses      | DNS servers allocation by DHCP within the Virtual Network. Can be multiple IP addresses. Leave blank to use Default Azure DNS servers.
| vNet / subnets                 | Subnets within the Virtual Network, multiple subnets can exist within the Virtual Network.
| vNet / subnets / name          | Name of the subnet.
| vNet / subnets / addressPrefix | Subnet for the subnet in CIDR notation.
| vNet / subnets / nsg           | Network Security Group (NSG) name applied to the subnet.
| nsgResourceGroup               | Name of the Resource Group containing the NSGs applied to the subnets.

