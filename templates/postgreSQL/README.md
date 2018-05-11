# Azure Database for PostgreSQL

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCloudDirect%2FARMLab%2Fmaster%2Ftemplates%2FpostgreSQL%2Fazuredeploy.json)

## Azure CLI deployment

The `az postgres server` command is used with parameters to manage MySQL servers. The `az postgres db` handles the databases on the servers.

### PostgreSQL server creation

```bash
az postgres server create --location <location> --resource-group <resourceGroup> --name <serverName> \
--admin-user <adminUserName> --admin-password <adminPassword> \
--sku-name <skuName>
```

### Create a database in a PostgreSQL server

```bash
```

### Add firewall rule to a MySQL server

```bash
```

## Template deployment

Description of what the template does