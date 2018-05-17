FROM microsoft/aspnetcore
WORKDIR /app
COPY ./bin/Docker .
ENV ASPNETCORE_URLS http://*:5000
ENV ASPNETCORE_ENVIRONMENT docker
ENTRYPOINT dotnet asp.net-core-mvc.dll