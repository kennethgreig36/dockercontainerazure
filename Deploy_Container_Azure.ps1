$ACR_NAME= "ContainerRegistrykge865"
$AKV_NAME = $ACR_NAME

$RES_GROUP= "ContainerRegistry01" # Resource Group name

#az group create --resource-group $RES_GROUP --location westeurope
#az acr create --resource-group $RES_GROUP --name $ACR_NAME --sku Standard --location westeurope

az container create `
    --resource-group $RES_GROUP `
    --name acr-tasks `
    --image "$ACR_NAME.azurecr.io/helloacrtasks:v1" `
    --registry-login-server "$ACR_NAME.azurecr.io" `
    --registry-username $(az keyvault secret show --vault-name $AKV_NAME --name "$ACR_NAME-pull-usr" --query value -o tsv) `
    --registry-password $(az keyvault secret show --vault-name $AKV_NAME --name "$ACR_NAME-pull-pwd" --query value -o tsv) `
    --dns-name-label "acr-tasks-$ACR_NAME" `
    --query "{FQDN:ipAddress.fqdn}" `
    --output table