# Create Azure Container Registry

set rgname=PSContainersRG
set acrname=pscontainerregevp
set aciname=pscontainers
set location=NorthCentralUS

# login to Azure from the CLI
az login

# create the resource group
az group create --name %rgname% --location %location% --output Table

# create the container registry
az acr create --name %acrname% --resource-group %rgname% --sku Basic --output Table

az acr login --name %acrname%

docker tag aspcontainers pscontainerregevp.azurecr.io/aspcontainers

docker push pscontainerregevp.azurecr.io/aspcontainers


az acr credential show --name %acrname% --query "passwords[0].value"

az container create --resource-group %rgname% --name %aciname% --image pscontainerregevp.azurecr.io/aspcontainers:latest --cpu 1 --memory 1 --registry-login-server pscontainerregevp.azurecr.io --registry-username %acrname% --registry-password WnVEwwJewsqpCL2HJdRu+RTfua8xjWiu --dns-name-label m3pscontain --ports 80 --location SouthCentralUS