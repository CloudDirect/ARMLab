Login-AzureRmAccount
$tenant = ""
$subid = ""
Select-AzureRmSubscription -TenantId $tenant -SubscriptionId $subid  
$subs = Get-AzureRmSubscription -TenantId $tenant -SubscriptionId $subid

$allResources = @()

foreach ($sub in $subs) 
{
    Select-AzureRmSubscription -SubscriptionId $subid -TenantId $tenant
    $resources = Get-AzureRmVM
    foreach ($vm in $resources)
    {
        $customPsObject = New-Object -TypeName PsObject
        
        If ($vm.StorageProfile.OsDisk.ManagedDisk.Id -ne $null)
        {
            $osDiskStorageAccount = 'Managed Disk'
        }
        
        else
        {
            $osDiskStorageAccount = ([uri]$vm.StorageProfile.OsDisk.Vhd.Uri).Host
        }
        
        $nics = $vm.NetworkProfile.NetworkInterfaces
        $dataDiskS = $vm.StorageProfile.DataDisks
        $subscription = Get-AzureRmSubscription -SubscriptionId ($vm.Id -split '/')[2] -TenantId $tenant
        #$resource = Get-AzureRmResource -ResourceName $vm.Name

        $tags = $vm.Tags.Keys + $vm.Tags.Values -join ':'
        
        $customPsObject | Add-Member -MemberType NoteProperty -Name VmName -Value $vm.Name
        $customPsObject | Add-Member -MemberType NoteProperty -Name ResourceGroup -Value $vm.ResourceGroupName
        
        #$customPsObject | Add-Member -MemberType NoteProperty -Name ResourceType -Value $resource.ResourceType
        #$customPsObject | Add-Member -MemberType NoteProperty -Name Kind -Value $resource.Kind
        $customPsObject | Add-Member -MemberType NoteProperty -Name Tags -Value $tags
        #$customPsObject | Add-Member -MemberType NoteProperty -Name Sku -Value $resource.Sku
        #$customPsObject | Add-Member -MemberType NoteProperty -Name ResourceId -Value $resource.ResourceId

        $customPsObject | Add-Member -MemberType NoteProperty -Name Location -Value $vm.Location
        $customPsObject | Add-Member -MemberType NoteProperty -Name Size -Value $vm.HardwareProfile.VmSize

        $i = 0
        foreach ($adapter in $nics)
        {
            $nic = Get-AzureRmResource -ResourceId $adapter.Id
            $vnet = ($nic.Properties.ipConfigurations.properties.subnet -split '/')[-3]
            $subnet = ($nic.Properties.ipConfigurations.properties.subnet -split '/')[-1]
            $privateIpAddress = $nic.Properties.ipConfigurations.properties.privateIPAddress
            $publicIpId = $nic.Properties.ipConfigurations.properties.publicIPAddress.id
            
            if ($publicIpId -eq $null)
            {
                $publicIpAddress = $null
            }
            Else
            {
                $publicIpResource = Get-AzureRmResource -ResourceId $publicIpId -ErrorAction SilentlyContinue
                $publicIpAddress = $publicIpResource.Properties.ipAddress
            }
            
            $availabilitySet = ($vm.AvailabilitySetReference.Id -split '/')[-1]        
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("nic-" + $i + "-Vnet") -Value $vnet
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("nic-" + $i + "-Subnet")  -Value $subnet
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("nic-" + $i + "-PrivateIpAddress") -Value $privateIpAddress
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("nic-" + $i + "-PublicIpAddress") -Value $publicIpAddress
            $i++
        }

        $customPsObject | Add-Member -MemberType NoteProperty -Name AvailabilitySet -Value $availabilitySet
        $customPsObject | Add-Member -MemberType NoteProperty -Name osDisk -Value $osDiskStorageAccount

        $i = 0
        foreach ($dataDisk in $dataDiskS)
        {
            if ($DataDisk.ManagedDisk.Id -ne $null)
            {
                $dataDiskHost = 'Managed Disk'
            }
            Else
            {
                $dataDiskHost = ([uri]($dataDisk.Vhd.Uri)).Host
            }
            $customPsObject | Add-Member -MemberType NoteProperty -Name ("dataDisk-" + $i) -Value $dataDiskHost
            $i++
        }
        
        $customPsObject | Add-Member -MemberType NoteProperty -Name Subscription -Value $subscription.Name
        #$customPsObject | Add-Member -MemberType NoteProperty -Name SubscriptionID -Value $sub.Id

        $allResources += $customPsObject
    }
}

$allResources | Export-Csv .\vm-audit.csv -NoTypeInformation



