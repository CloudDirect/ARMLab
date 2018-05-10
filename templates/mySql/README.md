# Azure Database for MySQL

The MySQL platform service follows the traditional model. Users can create a server of various sizes and storage capacity. The databases deployed on the server all use the shared resources, the individual databases can't be scaled separately.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2FmySql%2Fazuredeploy.json)

## Azure CLI deployment

The `az mysql server` command is used with parameters to create an SQL server.

### SQL server creation

```bash
```

### Create a database in an SQL server

```bash
az mysql db create -g <resourceGroupName> -s <serverName> -n <dbName>
```

## Create MySQL databases within the Azure Database for MySQL server

```bash
az mysql db create -g data-prod-rg -s mysql-prod-123 -n mysqldb1
```
