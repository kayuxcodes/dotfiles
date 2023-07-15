# oh-my-posh
oh-my-posh init pwsh --config ("C:/Users/ghost/desktop/learn/" + "final.omp.json") | Invoke-Expression

# PSRadLine Options
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Modules
Import-Module -name Terminal-Icons

# Aliases
Set-Alias vim nvim
Set-Alias pt "C:\Program Files\PowerToys\PowerToys.exe"
Set-Alias xampp "C:/xampp/xampp-control.exe"
Set-Alias npp "C:\Program Files (x86)\Notepad++\Notepad++.exe"

# KeyBindgs
Set-PSReadLineKeyHandler -Key "ALT+i" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "ALT+k" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key "ALT+j" -Function BackwardChar
Set-PSReadLineKeyHandler -Key "ALT+l" -Function ForwardChar
Set-PSReadLineKeyHandler -Key "Ctrl+ALT+j" -Function BackwardWord
Set-PSReadLineKeyHandler -Key "Ctrl+ALT+l" -Function ForwardWord

# Utility Functions
# delete files and folders
function dlt {
	$numOfArgs = $args.Length
	$Faileds = @()
	$Success = @()
	for ($i=0; $i -lt $numOfArgs; $i++) {
		if (Test-Path $args[$i]) {
			rm -r -fo $args[$i]
			$Success+= $args[$i]
		} else {
			$Faileds+= $args[$i]
		}
	}
	if ($Faileds.length -eq 0 -and $Success.length -gt 0) {
		echo "$($Success.length) removed successfuly"
	} elseif ($Faileds.length -gt 0 -and $Success.length -eq 0) {
		echo "$($Faileds.length) files failed to removed"
		Write-Host "Failed Files: ('$Faileds')" -ForegroundColor 'red' 
	} elseif ($Faileds.length -eq 0 -and $Success.length -eq 0) {
		echo "nothing removed"
	} else {
		$sCount = $Success.length
		$fCount = $Faileds.length
		echo "$($Success.length) removed successfuly, but $($Faileds.length) failed to removed"
		Write-Host "Failed Files: ('$Faileds')" -ForegroundColor 'red' 
	}
}
# copy to clipboard
function cpy ($target, $o) {
	if ((Test-Path $target) -eq $false -and $o) {
		$target | clip
		echo "content copied"
	} elseif (Test-Path $target) {
		Get-Content $target | clip
		echo "file content copied"
	}
	else {
		Write-Host "$target file does not exist" -ForegroundColor "red"
	}
}
# generate a typescript interface for an api or existing file using quicktype library
function getinterface ($target, $output, $getcontent) {
	if (Get-Command "quicktype" -ErrorAction SilentlyContinue) {
		if ($target) {
			if ($output) {
				quicktype $target --just-types --lang ts --out $output | clip
				echo "interface saved in ('$(Join-Path $(gl)$output)') file"
			} else {
				quicktype $target --just-types --lang ts | clip
				echo "interface copied"
			}
		} else {
			echo "target must not be empty"
		}
	} else {
		echo "you have to install the 'quicktype' library to run this command"
	}	
}