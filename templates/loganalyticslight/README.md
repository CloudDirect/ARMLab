# Log Analytics

This template deploys a Lightweight Log Analytics workspace to Azure with Solution templates and custom performance dashboard. 
By Default the pricing tier is set to Free, all performance counters are set to 60 sec collection intervals, the following solution templates are included as standard Alert Management, Anti-Malware, Azure Activity, Security, SQL Assesment, Update Assesment and a custom Performance dashboard. Event log collection is set to Errors only for the following Windows Logs System, Application, Active Directory Web Services and Windows Firewall.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2Floganalytics%2Fazuredeploy.json)


## Deploy from PowerShell

	Update Parameters in the azuredeploy.parameters.json
	
	<Insert script here>


## Deploy from Azure Portal (UI Experience)

Steps:
1.  Logon to http://portal.azure.com
2.  New and search for "Template Deployment"
3.  Copy and paste the contents of azuredeploy.json into "Edit Template"
4.  Update all Parameters
5.  Follow the rest of the UI
