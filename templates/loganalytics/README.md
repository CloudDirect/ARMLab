# Log Analytics

This template deploys a Log Analytics workspace to Azure with Solution templates and custom performance dashboard. The following solution templates are included as standard Alert Management, Anti-Malware, Azure Activity, Security, SQL Assesment, Update Assesment, Application Insights, Office365 and a custom Performance dashboard. All Linux & Windows performance counters to support the performance monitoring are set to 10 sec collection intervals.

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
