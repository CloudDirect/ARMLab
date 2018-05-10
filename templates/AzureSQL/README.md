# Azure SQL platform service

The service consits an SQL server and SQL databases. The SQL server does not determine the performance od the databases running in it. The SQL server is just a logical unit that dictates the admin user credentials for all of the databases and the login IP and hostname. The performance of the databases can be set individually. The performance of the databases is defined in Database Transfer Units (DTU).

## Azure CLI deployment

The `az sql server` command is used with parameters to create an SQL server.

Example SQL server creation:
```
az sql server create --name <serverName> --resource-group <resourceGroupName> \
--location <location> --admin-user <adminUser> --admin-password <adminPassword>
```