# $PSScriptRoot refers to the current directory that the script occupies
# Any reference to $PSScriptRoot will only work when the entire script is run 
# Running parts of the script will not invoke this built-in variable

#Create Hyper-V Switch
$VSWITCHNAME = "LAB"
New-VMSwitch -Name "$VSWITCHNAME" -SwitchType Private 

#Create Virtual Machines
$VMNAME = "LAB-VM01"
New-VM `
-Name "$VMNAME"`
-VHDPath "$PSScriptRoot\$VMNAME\Virtual Hard Disks\$VMNAME.vhdx"`
-BootDevice VHD `
-MemoryStartupBytes 4GB `
-Path "$PSScriptRoot\$VMNAME\"`
-Switch "$VSWITCHNAME"`
-Generation 2
Set-VMProcessor -VMName $VMNAME -Count 4
Set-VM $VMNAME -SmartPagingFilePath "$PSScriptRoot\$VMNAME\"
Set-VM -Name $VMNAME -AutomaticCheckpointsEnabled $false

$VMNAME = "LAB-VM02"
New-VM `
-Name "$VMNAME"`
-VHDPath "$PSScriptRoot\$VMNAME\Virtual Hard Disks\$VMNAME.vhdx"`
-BootDevice VHD `
-MemoryStartupBytes 4GB `
-Path "$PSScriptRoot\$VMNAME\"`
-Switch "$VSWITCHNAME"`
-Generation 2
Set-VMProcessor -VMName $VMNAME -Count 4
Set-VM $VMNAME -SmartPagingFilePath "$PSScriptRoot\$VMNAME\"
Set-VM -Name $VMNAME -AutomaticCheckpointsEnabled $false

$VMNAME = "LAB-VM03"
New-VM `
-Name "$VMNAME"`
-VHDPath "$PSScriptRoot\$VMNAME\Virtual Hard Disks\$VMNAME.vhdx"`
-BootDevice VHD `
-MemoryStartupBytes 2GB `
-Path "$PSScriptRoot\$VMNAME\"`
-Switch "$VSWITCHNAME"`
-Generation 2
Set-VMProcessor -VMName $VMNAME -Count 2
Set-VM $VMNAME -SmartPagingFilePath "$PSScriptRoot\$VMNAME\"
Set-VM -Name $VMNAME -AutomaticCheckpointsEnabled $false
