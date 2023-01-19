# Go to HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard

# Add a new DWORD value named EnableVirtualizationBasedSecurity. Set the value of this registry setting to 1 to enable virtualization-based security and set it to 0 to disable it.

# Add a new DWORD value named RequirePlatformSecurityFeatures. Set the value of this registry setting to 1 to use Secure Boot only or set it to 3 to use Secure Boot and DMA protection.

# Go to HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa

# Add a new DWORD value named LsaCfgFlags. Set the value of this registry setting to 1 to enable Windows Defender Credential Guard with UEFI lock, set it to 2 to enable Windows Defender Credential Guard without lock, and set it to 0 to disable it.

# Open Registry Editor, now Go to HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\DeviceGuard. Add a new DWORD value named EnableVirtualizationBasedSecurity and set it to 0 to disable it.
# Next Go to HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\LSA. Add a new DWORD value named LsaCfgFlags and set it to 0 to disable it.
