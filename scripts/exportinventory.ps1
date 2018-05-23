#Exports a full inventory
# settings
$defaultPath = "c:\Temp\azureresources.csv"
$csvDelimiter = ','
  
# set azure account
[void] (Login-AzureRmAccount)
  
# receive all subscriptions
$subscriptions = Get-AzureRmSubscription
$subscriptions | ft SubscriptionId, @{Name="Name";Expression={if(!$_.SubscriptionName) { $_.Name; } else { $_.SubscriptionName } } }
  
# select azure subscriptions that you want to export
"Please enter subscription ids (comma separated, leave empty to use all subscriptions)"
$subscriptionIds = read-host
  
if([String]::IsNullOrWhiteSpace($subscriptionIds)) {
    $subscriptionIds = @($subscriptions | select -ExpandProperty SubscriptionId)
}
elseif($subscriptionIds.Contains(',')) {
    $subscriptionIds = $subscriptionIds.Split(',')
}
else {
    $subscriptionIds = @($subscriptionIds)
}
  
# configure csv output
"Enter destination path - leave it empty to use $defaultPath"
$path = read-host
if([String]::IsNullOrWhiteSpace($path)) {
    $path = $defaultPath
}
  
if (Test-Path $path) { 
    "File $path already exists. Delete? y/n [Default: y)"
    $remove = read-host
    if([String]::IsNullOrWhiteSpace($remove) -or $remove.ToLower().Equals('y')) {
        Remove-Item $path
    }
}
  
"Start exporting data..."
foreach($subscriptionId in $subscriptionIds) {
    # change azure subscription
    [void](Set-AzureRmContext -SubscriptionID $subscriptionId)
    # read subscription name as we want to see it in the exported csv
    $currentSubscription = ($subscriptions | Where { $_.SubscriptionId -eq $subscriptionId })
    $subscriptionName = $currentSubscription.SubscriptionName
    if([String]::IsNullOrEmpty($subscriptionName)) {
        $subscriptionName = $currentSubscription.Name
    }
      
    $subscriptionSelector = @{ Label="SubscriptionName"; Expression={$subscriptionName} }
    $tagSelector =  @{Name="Tags";Expression={ if($_.Tags -ne $null) { $x = $_.Tags.GetEnumerator() | %{ "{ `"" + $_.Name + "`" : `"" + $_.Value + "`" }, " }; ("{ " + ([string]$x).TrimEnd(", ") + " }") } }}
    #get resources from azure subscription
    $export = Get-AzureRmResource | select *, $subscriptionSelector, $tagSelector -ExcludeProperty "Tags"
    $export | Export-CSV $path -Delimiter $csvDelimiter -Append -Force -NoTypeInformation
    "Exported " + $subscriptionId + " - " + $subscriptionName
}
  
"Export done!"
