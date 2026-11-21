ipconfig /all
Get-NetIPConfiguration
Get-DnsClientServerAddress
Get-NetRoute -AddressFamily IPv4 | Sort-Object RouteMetric
