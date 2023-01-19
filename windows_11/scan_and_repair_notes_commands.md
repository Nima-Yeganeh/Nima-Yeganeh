# scan and repair
# group policy problem and file checking

sfc /scannow
Dism /Online /Cleanup-Image /RestoreHealth
