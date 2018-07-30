-- Set variables
set username to short user name of (system info)
set computername to host name of (system info)
set ethernet to primary Ethernet address of (system info)
set MacAddress to (do shell script "ifconfig en1 | awk '/ether/{print $2}'")
set ipaddress to IPv4 address of (system info)
set OSVersion to (do shell script "sw_vers -productVersion")
set MacModel to (do shell script "system_profiler SPHardwareDataType | awk '/Model Identifier/ {print $3}'")
set serial to (do shell script "system_profiler SPHardwareDataType | awk '/Serial/ {print $4}'")

-- Display a popup box with info
display dialog "Current Username : " & username & "
Local Computer Name : " & computername & "
Current IP Address : " & ipaddress & "
Mac Model : " & MacModel & "
MacOS Version: " & OSVersion & " 
MAC Address : " & MacAddress & "
Serial Number : " & serial with icon caution buttons {"OK", "Email IT"} default button 1
set response to button returned of the result
-- Program buttons to email IT

if response is equal to "Email IT" then
	open location "mailto: emailaddressgoeshere"
end if