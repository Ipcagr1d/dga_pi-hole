# This script changes the DNS server settings for a network adapter

# Get all available network adapters
$adapters = Get-NetAdapter | Sort-Object -Property Name

# Display a list of all available network adapters
Write-Host "Available network adapters:"
foreach ($adapter in $adapters) {
    Write-Host "  [$($adapter.ifIndex)] $($adapter.Name)"
}

# Prompt the user to choose a network adapter
$adapterIndex = Read-Host -Prompt "Enter the index of the network adapter you want to change"

# Get the specified adapter
$adapter = $adapters | Where-Object { $_.ifIndex -eq $adapterIndex }

# Prompt the user to enter the DNS server addresses
$dnsServers = Read-Host -Prompt "Enter the DNS server addresses (separated by commas)"

# Split the DNS server addresses into an array
$dnsServers = $dnsServers -split ","

# Change the DNS server settings for the adapter
Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses $dnsServers

# Print a success message
"Changed DNS server settings for adapter '$($adapter.Name)' to: $($dnsServers -join ', ')"