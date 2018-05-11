# Azure SQL platform service

The service consits an SQL server and SQL databases. The SQL server does not determine the performance od the databases running in it. The SQL server is just a logical unit that dictates the admin user credentials for all of the databases and the login IP and hostname and the networking rules. The performance of the databases can be set individually. The performance of the databases is defined in Database Transfer Units (DTU).

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2sql%2Fazuredeploy.json)

## Azure CLI deployment

The `az sql server` command is used with parameters to manage SQL servers. The `az sql db` command manipulates the databases on the servers.

### SQL server creation

```bash
az sql server create --name <serverName> --resource-group <resourceGroupName> \
--location <location> --admin-user <adminUser> --admin-password <adminPassword>
```

### Create a database in an SQL server

```bash
az sql db create --resource-group <resourceGroupName> --server <serverName> \
--name <dbName> --service-objective <serviceObjective>
```

The service level objective parameter determines the performance of the database. The available capacity list is different per location. To get a of possible settings use:

```bash
az sql db list-editions --location <location> --query '[].supportedServiceLevelObjectives[].name'
```

### Add firewall rule to an SQL server

```bash
az sql server firewall-rule create --resource-group <resourceGroupName> --server <serverName> \
--name <ruleName> --start-ip-address <startIpAddress> --end-ip-address <endIpAddress>
```

## Template deployment

The proviced JSON template deploys an SQL server and a database in the server and opens up an IP range on the firewall of the SQL server. The name of the SQL server and database, the IP range, the admin credentials and the size of the database are configurable.