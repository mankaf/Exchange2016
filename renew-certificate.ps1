$txtrequest = Get-ExchangeCertificate -Thumbprint 435D52D9C007FC2E2091EDCDA2A76CBE9FED3CF8 | New-ExchangeCertificate -GenerateRequest
[System.IO.File]::WriteAllBytes('\\mailsrv\cert_renew2024\DiscoveryCertRenewal2024.req', [System.Text.Encoding]::Unicode.GetBytes($txtrequest))



Import-ExchangeCertificate -FileData ([System.IO.File]::ReadAllBytes('\\mailsrv\cert_renew2024\remote.discovery-group.cz.p7b'))
