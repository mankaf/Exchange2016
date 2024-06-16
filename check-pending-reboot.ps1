# Check for pending reboots in multiple registry locations
$RebootPending = $false

# Check Component Based Servicing
$CBSRebootPending = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" -Name RebootPending -ErrorAction SilentlyContinue
if ($CBSRebootPending -ne $null) {
    Write-Output "Component Based Servicing: Reboot is pending"
    $RebootPending = $true
}

# Check Windows Update
$WURebootRequired = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name RebootRequired -ErrorAction SilentlyContinue
if ($WURebootRequired -ne $null) {
    Write-Output "Windows Update: Reboot is pending"
    $RebootPending = $true
}

# Check PendingFileRenameOperations
$PendingFileRenameOperations = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name PendingFileRenameOperations -ErrorAction SilentlyContinue
if ($PendingFileRenameOperations -ne $null) {
    Write-Output "PendingFileRenameOperations: Reboot is pending"
    $RebootPending = $true
}

if (-not $RebootPending) {
    Write-Output "No reboot is pending"
}
