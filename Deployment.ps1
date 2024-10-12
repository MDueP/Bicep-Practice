$rg = "Bicep-Test"
$location = "swedencentral"
$path = "./linux_vm.bicep"
Connect-AzAccount
New-AzResourceGroup -Name $rg -Location $location
New-AzResourceGroupDeployment -ResourceGroupName $rg -TemplateFile $path

Get-AzPublicIpAddress -ResourceGroupName $rg | Select-Object IpAddress

#Remove-AzResourceGroup -Name $rg -Force