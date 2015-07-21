clear
Write-host `n

#Function returns maximum set Processor Power State
function GetMaxCPU{
#Get Max Processor Power State and store in string variable
[string]$Max = powercfg -q 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 | Select-String -pattern "Current AC Power Setting Index" | Select-Object -Last 1

#Split returned string by spaces and only store last object in arrray (value we need)
$Max = $Max.split()[-1]

#Convert number to decimal
$Max = [Convert]::ToString($Max, 10)

return $Max
}

$Max = GetMaxCPU
Write-host "Maximum Processor Power State is $Max"`n

if( $Max -ne 100 ){

	Write-host "Raising Maximum Processor Power State"
	Write-host `t"Set AC Value 100"
	powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100

	Write-host `t"Set DC Value 100"
	powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100

	Write-host `t"Reapply Power Plan: High Performance"
	powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
	
}elseif( $Max -eq 100 ){

	Write-host "Lowering Maximum Processor Power State"
	Write-host `t"Set AC Value 10"
	powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 10

	Write-host `t"Set DC Value 10"
	powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 10

	Write-host `t"Reapply Power Plan: High Performance"
	powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
}
$Max = GetMaxCPU
Write-host `n"New Maximum Processor Power State is $Max"`n`n

Start-sleep -s 3
