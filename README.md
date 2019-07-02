# Azure Docker app

A simple docker app that deploys to Azure Container Registry.

Requirements:

* .NET Core SDK
* Azure CLI
* Docker client

## Run it

1. `dotnet publish -c Release`
2. `docker build ./bin/release/netcoreapp2.2/publish --tag aspcontainers -f Dockerfile`
3. `docker run -d -p 5000:80 --name asplocal aspcontainers`

## Publish to Azure

On Windows: [deploy-to-azure.ps1](./deploy-to-azure.ps1)

## Build it from stratch

1. Create the app with `dotnet new mvc`
2. Create the Docker configuration file

Alternatively, an empty project:

```
mkdir <projectname>
dotnet new web
dotnet publish -c Release -o out
docker build -t samplewebapp .
docker image ls
docker run -d -p 5000:80 --name myapp samplewebapp
docker rm -f myapp
```
