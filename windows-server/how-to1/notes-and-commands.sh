# docker-windows-server
# This is a very simple Microsoft IIS website that allows a user to send a tweet.

# To use it:
# Build it: 
docker build -t windows_tweet_app .

# Run it:
docker container run --detach -p 8080:80 windows_tweet_app

# Information
# docker search microsoft
# runs with following results:
microsoft/dotnet
microsoft/mssql-server-linux
microsoft/aspnet
microsoft/windowsservercore
microsoft/aspnetcore
microsoft/nanoserver
microsoft/iis
microsoft/mssql-server-windows-developer
microsoft/aspnetcore-build
microsoft/azure-cli
microsoft/powershell
microsoft/vsts-agent
microsoft/dynamics-nav
microsoft/dotnet-samples
microsoft/bcsandbox
microsoft/mssql-tools
microsoft/oms
microsoft/cntk
microsoft/wcf
microsoft/dotnet-nightly
microsoft/dotnet-framework-build
microsoft/mmlspark
microsoft/service-fabric-reverse-proxy
microsoft/aspnetcore-build-nightly
microsoft/cntk-nightly

docker pull mcr.microsoft.com/windows/servercore:1809
docker pull mcr.microsoft.com/windows/nanoserver:1809
docker pull mcr.microsoft.com/windows:1809
docker pull mcr.microsoft.com/windows/servercore:ltsc2019
docker pull microsoft/windowsservercore:ltsc2016
docker pull microsoft/nanoserver:1709
docker pull mcr.microsoft.com/windows/servercore:ltsc2016
docker pull mcr.microsoft.com/windows/nanoserver:1709

