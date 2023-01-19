# if docker not running or any problem try commands below ...

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
dism.exe /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V-All
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor

# docker test command
docker run -d -p 80:80 docker/getting-started
