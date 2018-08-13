# Set Locale, language etc. 
& $env:SystemRoot\System32\control.exe "intl.cpl,,/f:`"UKRegion.xml`""

# These would be nice but they don't affect the default user account, so are pretty pointless.
#Set-WinSystemLocale -SystemLocale en-GB
#Set-WinHomeLocation -GeoId 242
#Set-WinUserLanguageList -LanguageList (New-WinUserLanguageList -Language en-GB) -Force

# Set Timezone
& tzutil /s "GMT Standard Time"

# Set languages/culture
Set-Culture en-GB

# Add/format any raw data disks and name them as per their LUN ID.
$CandidateRawDisks = Get-Disk |  Where {$_.PartitionStyle -eq 'raw'} | Sort -Property Number
Foreach ($RawDisk in $CandidateRawDisks) {
    $LUN = (Get-WmiObject Win32_DiskDrive | Where index -eq $RawDisk.Number | Select SCSILogicalUnit -ExpandProperty SCSILogicalUnit)
    $Disk = Initialize-Disk -PartitionStyle MBR -Number $RawDisk.Number
    $Partition = New-Partition -DiskNumber $RawDisk.Number -UseMaximumSize -AssignDriveLetter
    $Volume = Format-Volume -Partition $Partition -FileSystem NTFS -NewFileSystemLabel "DATA-$LUN" -Confirm:$false
}