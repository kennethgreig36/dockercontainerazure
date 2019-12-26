Login-AzureRmAccount

$resourceGroup = Get-AzureRmResourceGroup -Name 'Kens_Containers'

$ContainerParams = @{
    ResourceGroupName = $resourceGroup.ResourceGroupName
    Name = 'supertscontainer'
    Image = 'microsoft/iis:nanoserver'
    OsType = 'Windows'
    DnsNameLabel = 'supertscontainer'
}
New-AzureRmContainerGroup @ContainerParams
