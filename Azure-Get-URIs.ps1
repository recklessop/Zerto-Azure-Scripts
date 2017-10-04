# Please set the region to the location that your ZCA will run
# Possible values are:
# eastasia,southeastasia,centralus,eastus,eastus2,westus,northcentralus
# southcentralus,northeurope,westeurope,japanwest,japaneast,brazilsouth
# australiaeast,australiasoutheast,southindia,centralindia,westindia
# canadacentral,canadaeast,uksouth,ukwest,westcentralus,westus2,koreacentral,koreasouth

$region = "eastus"

Import-Module AzureRM
Login-AzureRmAccount

$VMs=Get-AzureRMVM
ForEach ($VM in $VMs)
{
	$VMName = $VM.Name
	$VMRG = $VM.ResourceGroupName
	$info=Get-AzureRMVM –Name $VMName -ResourceGroupName $VMRG
	$VMStorageURL=($info.StorageProfile.OsDisk.Vhd).uri
	Write-Host "VM: $VMName URI: $VMStorageURL"
}