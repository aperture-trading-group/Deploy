# constans
$VCenterServer = 'sel-v-vcenter02.synseal.com'
$VcenterTemplate = ''
$VM_OS = ''
$VM_HW_cpu = 2
$VM_HW_MemGB = 8
$VM_HW_DiskGB = 40
$VM_HW_DiskFormat = 'Thin'

#$Vcenter_User = 'administrator@vsphere.local'
$Vcenter_User = Read-Host -Prompt 'Username - press enter for administrator@vsphere.local'
if (!$Vcenter_User) {
    $Vcenter_User = 'administrator@vsphere.local'
}
$Vcenter_Password = Read-Host -Prompt 'Password' -AsSecureString

$Vcenter_Credentials = New-Object System.Management.Automation.PSCredential($Vcenter_User, $Vcenter_Password)

# confirm the necessary dependencies have been installed
try {
    Import-Module -Name VMware.VimAutomation.Core -ErrorAction Stop
    Write-Host "VMware.VimAutomation.Core module installed."
    Write-Host "Setting ParticipateInCEIP to false."
    Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $false -Confirm:$false
}
Catch {
    Write-Host "VMware.VimAutomation.Core module not found. Install by running the following command in an elevated powershell shell: Install-Module -Name VMware.VimAutomation.Core -Force"
    exit
}

# attempt to make the connection the vcenter server
Connect-ViServer -Server $VCenterServer -Protocol https -Port 443 -Credential $Vcenter_Credentials
Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction Ignore -Confirm:$false
Get-VM
Disconnect-VIServer -Confirm:$false