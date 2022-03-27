# SMC Hooks installer. V 1.0

# where are we?
[string]$location = Get-Location

# check for smc repos path
if (!$location.EndsWith('revspring-tech')) 
{
	Write-Host "Bad Location: $($location). Run in 'revspring-tech'." -ForegroundColor red
	Exit 1
}

# get smc repos
$repos = Get-ChildItem -Path $location -Directory -Name "smc_*"

if ($repos.Count -eq 0) 
{
	Write-Host "No revspring SMC repos. Try cloning some first." -ForegroundColor red
	Exit 1
}

foreach($repo in $repos) 
{
	# [pre-commit]
	$hook = "pre-commit"
	$path = Join-Path -Path $location -ChildPath "$($repo)\.git\hooks\$($hook)"
	Set-Content -Path $path -Value $("l1","line2")
	$acl = Get-Acl -Path $path
	Set-Acl -Path $path
	Write-Host "$($hook)|$($path)"
}

Write-Host "Exited"
Exit 0


#!/bin/sh
echo 
exec powershell.exe -ExecutionPolicy RemoteSigned -File '.\.git\hooks\pre-commit.ps1'
exit

#[prepare-commit-msg]
#!/bin/sh
echo 
exec powershell.exe -ExecutionPolicy RemoteSigned -File '.\.git\hooks\prepare-commit-msg.ps1' $1 $2 $3
exit