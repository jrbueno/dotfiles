#Set-Location C:\SmartgisticsRepos
Import-Module posh-git
Import-Module git-aliases -DisableNameChecking

# oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config 'C:\jbueno\ohmyposh\jbueno-jandedobbleleer.omp.json' | Invoke-Expression

$env:POSH_GIT_ENABLED = $true

# function Set-PoshGitStatus {
    # $global:GitStatus = Get-GitStatus
    # $env:POSH_GIT_STRING = Write-GitStatus -Status $global:GitStatus
# }
# New-Alias -Name 'Set-PoshContext' -Value 'Set-PoshGitStatus' -Scope Global -Force

#Set-PoshPrompt -Theme paradox
#Set-PoshPrompt jandedobbeleer
# Set-PoshPrompt zash


# Change $TARGET_BRANCH to your targeted branch, e.g. change from `master` to `main` to delete branches squashed into `main`.
# TARGET_BRANCH=master 
# && git checkout -q $TARGET_BRANCH 
# && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $TARGET_BRANCH $branch) 
# && [[ $(git cherry $TARGET_BRANCH $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] 
# && git branch -D $branch; done
# OR you can put this function in a global git alias and call it like this
# `git delete-squashed` OR `git delete-squashed main`
#git config --global alias.delete-squashed '!f() { local targetBranch=${1:-master} && git checkout -q $targetBranch && git branch --merged | grep -v "\*" | xargs -n 1 git branch -d && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base $targetBranch $branch) && [[ $(git cherry $targetBranch $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done; }; f'

function gbds {
	
	
	# $(git for-each-ref refs/heads --format="%(refname:short)" | Select-String "^(\*|\s*($MainBranch|develop|dev)\s*$|^(releases))" -NotMatch).line | foreach {$mergeBase = $(git merge-base $MainBranch $_);$branchTree = $(git rev-parse "$_^{tree}");$newCommit = $(git commit-tree $branchTree -p $mergeBase -m _); Write-Host ($(git cherry $MainBranch $newCommit) -match "^(-)" ? "Should delete $_" : "Not Merged $_")}
	$MainBranch = Get-Git-MainBranch
	
	git checkout -q $MainBranch	
	
	$MergedBranchs = $(git for-each-ref refs/heads --format="%(refname:short)" | Select-String "^(\*|\s*($MainBranch|develop|dev)\s*$|^(releases)|^(release))" -NotMatch).line
	$MergedBranchs | ForEach-Object {
		if ([string]::IsNullOrEmpty($_)) {
			return
		}
		$mergeBase = $(git merge-base $MainBranch $_)		
		$branchTree = $(git rev-parse "$_^{tree}")
		$newCommit = $(git commit-tree $branchTree -p $mergeBase -m _)
		if($(git cherry $MainBranch $newCommit) -match "^(-)"){			
			git branch -D $_.Trim();
		}
	}
}

function cmdh {	
	if($args.count -gt 0)
	{
		$term = "*$($args[0])*"	
		Get-Content (Get-PSReadlineOption).HistorySavePath | ? { $_ -like "$($term)" }
	} else { echo "Please pass a term" }
}

function gbv {
	git branch -v
}