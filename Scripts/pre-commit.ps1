# branch match pattern
# $branchRegexPattern = "(?<smc>SMC-)(?<ticket>\d+)"
$branchRegexPattern = "SMC-\d+"

# git ops
$branchName = $(git rev-parse --abbrev-ref HEAD)

echo "Event [Pre-Commit]"
#if ($branchName

$isMatch = $branchName -cmatch $branchRegexPattern

if (!$isMatch) 
{
    Write-Host "Bad branch name: ${branchName}. SMC-<ticket num> required." -ForegroundColor red
    
    Write-Host "Hint: " -NoNewLine 
    Write-Host "use " -NoNewLine -ForegroundColor cyan
    Write-Host "git branch -m <new name>" -NoNewLine -ForegroundColor yellow
    Write-Host " to rename the current branch." -ForegroundColor cyan
    
    Write-Host "Example: " -NoNewLine
    Write-Host "feature/SMC-19-CMS-Required-Good-Faith-Estimate" -ForegroundColor green
    
    Exit 1;
}

Exit 0;