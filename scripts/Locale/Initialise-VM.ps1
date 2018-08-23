# Set Locale, language etc. 
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"UKRegion.xml`""

# Set Timezone
& tzutil /s "GMT Standard Time"

# Set languages/culture
Set-Culture en-GB

# Add/format any raw data disks and name them.
$CandidateRawDisks = Get-Disk |  Where {$_.PartitionStyle -eq 'raw'} | Sort -Property Number
Foreach ($RawDisk in $CandidateRawDisks) {
    $LUN = (Get-WmiObject Win32_DiskDrive | Where index -eq $RawDisk.Number | Select SCSILogicalUnit -ExpandProperty SCSILogicalUnit)
    $Disk = Initialize-Disk -PartitionStyle GPT -Number $RawDisk.Number
    $Partition = New-Partition -DiskNumber $RawDisk.Number -UseMaximumSize -AssignDriveLetter
    $Label = $LUN +1
    $Volume = Format-Volume -Partition $Partition -FileSystem NTFS -NewFileSystemLabel "datadisk0$Lun" -Confirm:$false
}
