Login-AzureRmAccount
$tenant = ""
$subid = ""

Select-AzureRmSubscription -TenantId $tenant -SubscriptionId $subid  
$subs = Get-AzureRmSubscription -TenantId $tenant -SubscriptionId $subid


$allResources = @()

foreach ($sub in $subs) 
{
    Select-AzureRmSubscription -TenantId $tenant -SubscriptionId $subid
    $resources = Get-AzureRmVirtualNetwork
    foreach ($vnet in $resources)
    {
        $customPsObject = New-Object -TypeName PsObject

        $customPsObject | Add-Member -MemberType NoteProperty -Name VnetName -Value $vnet.Name
        $customPsObject | Add-Member -MemberType NoteProperty -Name Location -Value $vnet.Location
        $customPsObject | Add-Member -MemberType NoteProperty -Name Subscription -Value $sub.Name
        $customPsObject | Add-Member -MemberType NoteProperty -Name SubscriptionID -Value $sub.Id

        $i = 0
        foreach ($prefix in $vnet.AddressSpace)
        {
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("AddressSpace-" + $i) -Value $vnet.AddressSpace[$i].AddressPrefixes[0]
            $i++
        }

        $i = 0
        foreach ($subnet in $vnet.Subnets)
        {
            $subnetString = $subnet.Name + ":" + $vnet.Subnets[$i].AddressPrefix
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("Subnet-" + $i) -Value $subnetString
            $i++
        }

        $i = 0
        foreach ($peering in $vnet.virtualNetworkPeerings)
        {
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("VNetPeering" + $i) -Value $vnet.VirtualNetworkPeerings[$i].Name
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("VNetPeering" + $i + "-(State)") -Value $vnet.VirtualNetworkPeerings[$i].PeeringState
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("VNetPeering" + $i + "-(RemoteVirtualNetwork)") -Value ($vnet.VirtualNetworkPeerings[$i].RemoteVirtualNetwork.Id -split '/')[-1]
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("VNetPeering" + $i + "-(AllowVnetAccecss)") -Value $vnet.VirtualNetworkPeerings[$i].AllowVirtualNetworkAccess
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("VNetPeering" + $i + "-(AllowForwardedTraffic)") -Value $vnet.VirtualNetworkPeerings[$i].AllowForwardedTraffic
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("VNetPeering" + $i + "-(AllowGatewayTransit)") -Value $vnet.VirtualNetworkPeerings[$i].AllowGatewayTransit
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("VNetPeering" + $i + "-(UseRemoteGateway)") -Value $vnet.VirtualNetworkPeerings[$i].UseRemoteGateways
            $i++
        }
        
        $allResources += $customPsObject
    }
}

$allResources | Export-Csv .\vnet-audit.csv -NoTypeInformation
