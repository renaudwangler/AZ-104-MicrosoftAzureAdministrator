$stud=$(az ad signed-in-user show --query displayName)
$rgName="$($stud.substring(1,$stud.length-2))-RG2"
$vmssName = 'az10408vmss0'
$vmss = Get-AzVmss `
	-ResourceGroupName $rgName `
	-VMScaleSetName $vmssName

$publicSettings = @{
	"fileUris" = (,"https://raw.githubusercontent.com/Azure-Samples/compute-automation-configurations/master/prepare_vm_disks.ps1");
	"commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File prepare_vm_disks.ps1"
}

Add-AzVmssExtension -VirtualMachineScaleSet $vmss `
	-Name "customScript" `
	-Publisher "Microsoft.Compute" `
	-Type "CustomScriptExtension" `
	-TypeHandlerVersion 1.8 `
	-Setting $publicSettings

# Update the scale set and apply the Custom Script Extension to the VM instances
Update-AzVmss `
	-ResourceGroupName $rgName `
	-Name $vmssName `
	-VirtualMachineScaleSet $vmss
