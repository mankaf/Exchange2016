reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" /v Release | findstr /c:"528040"


Setup.exe /Mode:Upgrade /IAcceptExchangeServerLicenseTerms_DiagnosticDataON

# PowerShell below 

Get-Service *Exchange* | Start-Service
