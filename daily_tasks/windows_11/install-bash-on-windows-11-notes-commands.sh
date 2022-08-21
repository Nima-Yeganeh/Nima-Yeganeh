# Bash, the default shell on most Linux distributions, runs better than ever on Windows 11 thanks to upgrades to the Windows Subsystem for Linux. Here’s how you install the Bourne Again Shell using Windows Terminal.

# Microsoft released the original Windows Subsystem for Linux (WSL) some five years ago. Since then, it has undergone major revisions — the original WSL didn’t run a true Linux kernel, it didn’t run in a virtual machine, and it didn’t support GUI applications without some extra steps. All of that has changed with upgrades to WSL 2.0.

# Linux distributions like Ubuntu that run under WSL include Bash. They’re the best way to get Bash on a Windows 11 PC.

# BASH comes as the default shell on most Linux distributions (distros) out there. You need to install WSL to get Linux running on Windows though. Fortunately, the installation process has been streamlined — it is a single command in Windows Terminal.

# To run a Terminal as an administrator, click on the Start button, type “terminal” into the search bar,  right-click the Windows Terminal result, and then click “Run as Administrator.”

# Type wsl --install into the Windows Terminal and hit Enter. It will begin downloading and installing necessary assets. This could take a few minutes, the subsystem is several hundred megabytes.
wsl --install

# Once it finishes, your computer will need to be restarted. Type shutdown /r /t 0 and hit Enter to restart immediately.
shutdown -r -f -t 0

# The installation will resume automatically after your computer restarts. It’ll begin by downloading and installing Ubuntu, and then you’ll be prompted to pick a username and password. They don’t have to be related to your Windows 11 login details, and you shouldn’t reuse the same password.
# Ubuntu will boot once you pick your password.

# Ubuntu is the default Linux operating system that comes packaged with WSL, but it isn’t the only one available. wsl –install -d opensuse-42 in Terminal and type wsl --list --online or wsl -l -o.
wsl --list --online

# You can install any of the distros listed by typing wsl --install -d <distro>. As an example, if you wanted to install openSUSE-42, you’d need to type wsl --install -d opensuse-42. You can also install them via the Microsoft Store if you prefer that.

wsl --install -d ubuntu

# Note: PowerShell and Command Prompt are not case sensitive. Linux terminals are case sensitive.
# That’s it — you’re done. Bash is the default shell in Ubuntu. You can use Bash at any time by launching Ubuntu (or any Linux distro) from the Start menu, or through the Windows Terminal.

wsl --install -d debian
wsl --install -d kali-linux
