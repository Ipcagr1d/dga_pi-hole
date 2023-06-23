# This script gets the IPv4 address and gateway IP of the Wireless LAN adapter

# Get the Wi-Fi adapter
$wireless = Get-NetAdapter -Name Wi-Fi

# Get the IP configuration of the Wi-Fi adapter
$ipconfig = Get-NetIPConfiguration -InterfaceIndex $wireless.ifIndex

# Extract the IPv4 address and gateway IP
$ipv4 = $ipconfig | Select-Object -ExpandProperty IPv4Address
$gateway = $ipconfig | Select-Object -ExpandProperty IPv4DefaultGateway

# Print the results
"Wireless LAN adapter Wi-Fi IPv4 Address: $($ipv4.IPAddress)"
"Wireless LAN adapter Wi-Fi Gateway IP: $($gateway.NextHop)"