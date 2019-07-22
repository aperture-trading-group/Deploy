# constans
$VCenterServer = ''
$VcenterTemplate = ''
$VM_OS = ''
$VM_HW_cpu = 2
$VM_HW_MemGB = 8
$VM_HW_DiskGB = 40
$VM_HW_DiskFormat = 'Thin'

$Vcenter_User = Read-Host -Prompt 'Username'
$Vcenter_Password = Read-Host -Prompt 'Password'
Import-Module -Name VMware.VimAutomation.Core