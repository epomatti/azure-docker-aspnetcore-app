FROM microsoft/dotnet:2.2-aspnetcore-runtime

ENTRYPOINT [ "dotnet", "Containers.dll" ]
ARG source=.
WORKDIR /app
COPY $source .