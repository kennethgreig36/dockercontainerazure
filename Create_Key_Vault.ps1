$AKV_NAME= $ACR_NAME

az keyvault create --resource-group $RES_GROUP --name $AKV_NAME

# Create service principal, store its password in AKV (the registry *password*)
az keyvault secret set `
  --vault-name $AKV_NAME `
  --name $ACR_NAME-pull-pwd `
  --value $(az ad sp create-for-rbac `
                --name $ACR_NAME-pull `
                --scopes $(az acr show --name $ACR_NAME --query id --output tsv) `
                --role acrpull `
                --query password `
                --output tsv)

# Store service principal ID in AKV (the registry *username*)
az keyvault secret set `
    --vault-name $AKV_NAME `
    --name $ACR_NAME-pull-usr `
    --value $(az ad sp show --id http://$ACR_NAME-pull --query appId --output tsv)
