# Install Hyper-V
# Copy the following script to the txt file.

pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V-All /LimitAccess /ALL

# Change the suffix of the file to bat, and then run the script as an administrator. It’s actually downloading the virtual machine that comes with windows

# Initialize environment
# Open PowerShell as administrator and execute the following commands respectively

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Update wsl2
# Download and install
# https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
# Execute commands under administrator

wsl --set-default-version 2

# Install docker
# Download it on the official website and go to the next step

# disable hyper-v after docker installation
dism.exe /Online /Disable-Feature /FeatureName:Microsoft-Hyper-V-All
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor
