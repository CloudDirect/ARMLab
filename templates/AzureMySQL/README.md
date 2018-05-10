# Azure Database for MySQL

The MySQL platform service follows the traditional model. Users can create a server of various sizes and storage capacity. The databases deployed on the server all use the shared resources, the individual databases can't be scaled separately.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2FAzureMySQL%2Fazuredeploy.json)

## Azure CLI deployment

The `az mysql server` command is used with parameters to manage a MySQL server. The `az mysql db` handles the databases on the servers.

### SQL server creation

```bash
az mysql server create --resource-group <resourceGroupName> --name <serverName> \
--location <location> --admin-user <adminUsername> --admin-password <adminPassword> \
--sku-name <skuName> --version <version>
```

### Create a database in an SQL server

```bash
az mysql db create -g <resourceGroupName> -s <serverName> -n <dbName>
```

### Add firewall rule to the server

```bash
```

## Template deployment

The proviced JSON template deploys a MySQL server and a database in the server and opens up an IP range on the firewall of the SQL server. The name of the MySQL server and database, the IP range, the admin credentials and the size and the version of the server are configurable.