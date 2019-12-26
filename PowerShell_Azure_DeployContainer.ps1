$password = ConvertTo-SecureString 'Kut43749' -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ('IT.Support@symatrix.com', $password)

Connect-AzureRmAccount -Credential $credential -Subscription 'e9b5c6f5-684c-4f14-8d62-607320da1d8c' -Tenant '885c456e-183b-4491-aa31-37685ebf3d2e'

$resourceGroup = Get-AzureRmResourceGroup -Name 'Kens_Containers'

$ContainerParams = @{
    ResourceGroupName = $resourceGroup.ResourceGroupName
    Name = 'supertscontainer'
    Image = 'microsoft/iis:nanoserver'
    OsType = 'Windows'
    DnsNameLabel = 'supertscontainer'
}
New-AzureRmContainerGroup @ContainerParams

#Get-AzContainerGroup -ResourceGroupName "Kens_Containers" -Name "supertscontainer"

#Remove-AzureRmContainerGroup -ResourceGroupName "Kens_Containers" -Name "supertscontainer"