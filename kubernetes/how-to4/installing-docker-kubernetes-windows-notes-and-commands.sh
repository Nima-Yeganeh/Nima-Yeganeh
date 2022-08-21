# installing-docker-kubernetes-windows
# https://learnk8s.io/installing-docker-kubernetes-windows

# Docker and Kubernetes are two popular tools to run containers at scale.

# So what's the problem with getting both of these tools on Windows?

# Containers come in two flavours: Windows and Linux containers.

# However, the majority of the time, when people say containers, they refer to Linux containers.

# Unfortunately, you can't run Linux containers on a Windows host or vice versa.

# That's because containers expect to use the kernel of the operating system they're designed for.

# A Linux executable expects a Linux host, and there's no way to run it on Windows!

# But there's a workaround.

# You could create a Virtual Machine that runs Linux on your Windows host.

# This will let every Linux application or executable run inside a container in the virtual machine.

# So how do we choose the right Virtual Machine?

# It depends on your hardware and operating system.

# There are several options available.

# Today, you're going to determine which combination is best for you and get up to speed on how to install it.

# Specifically, we're going to look whether you should install Docker through Docker for Windows or Minikube AND whether you should use Minikube, Kind, or K3s for Kubernetes.

# Containers are processes that are isolated from the rest of the operating system but still use their resources.

# Imagine clicking on an icon on your desktop and launching an application — the application runs unrestricted and can use as many CPU and memory as needed.

# If you execute the same application but within a container, not only you can define how much memory and CPU it will use at most, but you can also restrict access to the filesystem, network, etc.

# Containers use the underlying operating system to offer a restricted view of the resources available.

# If your operating system is Windows, you can isolate Windows applications in containers.

# The same is the case for Linux.

# However, if you want to run Linux containers on Windows, you can't unless you run a Linux host.

# You have a few options when it comes to running Linux on your computer, but it all boils down to running a virtual machine.

# Docker is a tool designed to run containers.

# It can run both Windows and Linux containers, but in this guide, you will focus primarily on Linux containers.

# When Docker for Windows was released, it supported Hyper-V as its virtualization technology.

# In other words, every Linux container that you created ran inside a virtual machine in Hyper-V.

# Hyper-V is a Type-1 hypervisor and thus provides excellent performance for running virtual machines on Windows.

# Then in May 2019, Windows Subsystem for Linux 2 (WSL 2) was announced.

# WSL 2 runs a Hyper-V virtual machine with Linux inside — just like Docker does.

# Why is WSL 2 a big deal?

# WSL 2 runs on top of the Windows Hypervisor (Hyper-V), which is a bare-metal hypervisor.

# You can expect the best type of performance from this hypervisor.

# WSL 2 also supports memory reclaim, and this means that the system uses only the right amount of RAM required for running the Linux kernel.

# And best of all, WSL 2 offers deep integration with the rest of the Windows host.

# You can navigate and copy files across the virtual machine as if it were natively on Windows.

# Wouldn't it be great if you could use WSL2 to run your Docker containers?

# If you're running WSL 2, Docker for Windows integrates with it automatically, and it leverages the existing WSL 2 virtual machine to run your containerised applications.

# If your Windows 10 build is higher than 19018, you should be easily able to install it.

# You can check your build version with the following command:
# PowerShell:
Get-ComputerInfo OsName,OsVersion,OsBuildNumber

# Installing WSL 2
# There are two ways you can install WSL 2: simplified and manual install.

# To use the simplified install method, you need to be a member of the Windows Insider Program and have the preview build of Windows 10 (build 20262 or higher).

# Then open PowerShell as an admin and type:
wsl --install

# After the installation, you'll need to restart your machine.

# For a manual installation, perform the following steps:

# Enable WSL through the PowerShell as an administrator with:
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Now, enable the 'Virtual Machine Platform' setting through:
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# Reboot your system for the changes to take effect.
# Set WSL 2 as the default version with:
wsl --set-default-version 2

# Next thing you need is a Linux distro.

# You can get them from the Microsoft Store.

# If you are not sure, select Ubuntu as the Linux distro.

# It might take a while to complete the installation, but once it is successful, you can test with:
wsl --list --verbose

# As a safety measure, we'll need to explicitly limit how much resource allowance we give to WSL 2.

# Simply go to C:\users\your profile and create a .wslconfig file.

# Here's what its contents should be:
[wsl2]
memory=4GB
processors=3

# Open PowerShell as an administrator and execute:
Restart-Service LxssManager

# To restart WSL 2 for the configurations to take place.

# In case you don't have access to WSL 2, that's where things get a bit tricky.

# Without WSL 2, your second best option for running Linux containers on Windows is using Docker for Desktop with Hyper-V.

# In other words, rather then reutilising the Hyper-V virtual machine created by WSL 2, Docker for Windows creates a brand new virtual machine.

# Unfortunately, not all Windows versions ship with Hyper-V.

# Hyper-V is unavailable on Windows 10 Home, but ships with the Windows 10 Pro and Enterprise editions.

# You can check if your computer supports Hyper-V with the following command:
Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V

# If you have Hyper-V, but it is disabled, you can enable it with:
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart

# If your computer supports Hyper-V but not WSL 2, you can jump to the next chapter to install Docker for Windows on Hyper-V.

# If your Windows installation doesn't have WSL 2 or Hyper-V, you can't install Docker for Windows unless you upgrade.

# Installing Docker for Windows with WSL 2 or Hyper-V
# Instead of downloading the binary and manually insert environment variables, this guide uses Chocolatey the Windows package manager to install Docker for Windows.

# You can follow the instructions on how to install Chocolatey here.

# With Chocolatey, you can install Docker for Windows with:
choco install docker-desktop -y

# Once the installation is over, you can search in the Windows menu for Docker by typing its name.

# If it's there, restart your PC for the changes to take effect because, without it, it won't run.

# Once you make the changes, restart your machine and Docker should now work.

# To confirm if it works, open PowerShell as an administrator and type:
docker ps

# You can verify that Docker is installed correctly with the following command:
docker run hello-world

# Excellent, now that you've installed Docker for Windows, you're ready to install Kubernetes.

# What options do you have for installing Kubernetes on Windows 10?
# Similar to Docker, Kubernetes has constraints that you need to watch out for.

# Kubernetes can run Windows and Linux containers.

# However, you can only run Windows containers on Windows nodes and Linux containers on Linux nodes.

# And there's a further constraint: the Kubernetes control plane can only run on a Linux node.

# In other words, Kubernetes will have to run inside a Linux virtual machine to operate correctly on Windows.

# Here you have the same choice of virtual machines as you had with Docker:

# You can run Kubernetes in WSL 2.
# If your Windows version supports it, you can use Hyper-V to create a virtual machine or
# You can create a virtual machine using VirtualBox.
# But choosing a virtual machine is only part of the challenge.

# There are several tools designed to run a Kubernetes cluster locally.

# In this guide, you will cover Minikube, Kind and K3s.

# But how do you decide which method to install with?

# Well, it depends on your use case.

# Are you getting started with Kubernetes and you need a fully working environment in no time? If so, Minikube will work just right.
# If you're extending Kubernetes or you need to test Kubernetes using clusters larger than a single node, Kind is the way to go.
# If you have a low spec machine or want something that uses fewer resources, K3s is what you need.
# After that, you need to look at your hardware capabilities.

# The methods we're going to look at demand anywhere from 2GB to up to 8GB of RAM.

# To be specific, Minikube needs 2GB, Kind needs 8GB and K3s requires 2GB.

# In most cases, your hardware will easily be able to support all three methods.

# Once you know which methods your system is capable of running, you can look at your use case and choose your preferred method.

# Installing Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco search hugo
choco search hugo -v
choco install hugo
choco upgrade chocolatey
choco list --local-only
choco install chrome --yes
choco -v

# Now you can use choco install <name> to install any executable you wish.

# Installing Kubernetes on Windows 10 with Minikube
# Minikube is one of the most developer-friendly local Kubernetes cluster that you can install.

# If you haven't done so, install Chocolatey — the Windows package manager.

# You can find the instructions here.

# Open PowerShell as an administrator and execute:
choco install minikube -y

# Once the installation is complete, you can launch a local cluster with:
minikube start

# Minikube follows the same logic as Docker for Windows.

# If WSL 2 has been installed, it will be used by default.

# If WSL 2 isn't available, Minikube will try to use the same Hyper-V virtual machine created by Docker for Windows.

# You can also create a separate Hyper-V virtual machine with :
minikube start --driver=hyperv

# After a while, you'll either have a successful installation or be presented with some error.

# In most cases, if following the instruction doesn't help, you should try to delete the cluster with:
minikube delete

# And create a new one with:
minikube start --v=7

# The --v=7 flag increases the logging level, and you should be able to spot the error in the terminal output.

# Once the command completes successfully, you can test the setup with:
kubectl get nodes

# Congrats you have a fully working Kubernetes cluster!

# Installing Kubernetes on Windows 10 - Kind
# Kind is short for Kubernetes in Docker.

# As the name suggests, you need to have a working installation of Docker before you can use KinD.

# Once Docker is installed, you should install kubectl next.

# Kubectl is a command-line interface that assists in handling Kubernetes clusters.
choco install kubernetes-cli -y

# Now you will use choco to install Kind.
choco install kind -y

# If you hadn't installed Docker till now, the above command should install it automatically.

# Note: If you have WSL 2 installed, it will automatically be used.

# Let's test it:
kind create cluster
kubectl cluster-info --context kind-kind

# To further debug and diagnose cluster problems, use:
kubectl cluster-info dump

# Excellent, your cluster is ready!

# Type the following command to get information on your network:
Get-NetConnectionProfile
