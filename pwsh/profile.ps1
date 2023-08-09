param (
    [switch]$lazy
)
# options-for-configuration--------------------------------------------------------------------------------------------
$windowsTerminalSettingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json"
$fzfSettings = "
--pointer='∩äà'
--marker='∩äà'
--prompt='∩üö '
--border='sharp'
"
# dark
$darkColorSchemeName = "Poimandres"
$darkBackgroundImagePath = "$Home\Pictures\dark.jpg"
$darkOhMyPosh = "$Home/Documents/Powershell/poimandres.omp.json" 

$darkFzf = $fzfSettings + @"
          --color=bg+:#303340,gutter:-1,spinner:#6DE4C7,hl:#5DE4C7,border:#7390AA
          --color=fg:#A6ACCD,header:#FF23FB,info:#FFFAC2,pointer:#89DDFF
          --color=marker:#FFFAC2,fg+:#E4F0FB,prompt:#D0679D,hl+:#D0679D
"@
# light
$lightBackgroundImagePath = "$Home\Pictures\light.jpg"
$lightColorSchemeName = "Catppuccin Latte"
$lightOhMyPosh = "$Home/Documents/Powershell/kayux.omp.json" 
$lightFzf = $fzfSettings + @"
--color=bg+:#ccd0da,gutter:-1,spinner:#dc8a78,hl:#d20f39,border:#eff1f5
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39
"@
# jsonContent for Windows Terminal json settings
$wtSettings = Get-Content -Path $windowsTerminalSettingsPath -Raw | ConvertFrom-Json
# this function will call after the settings will applied
function Set-Envs {
  $wtProfile = $windowsTerminalSettingsPath
  $defaults = $wtSettings.profiles.defaults
  $env:ThemeName=$defaults.colorScheme
  $env:TerminalFont=$defaults.font.face
  $env:TerminalFontSize=$defaults.font.size
  $env:NEOFETCH_PROFILE="$Home\.config\neofetch\config.conf"
  $nfProfile = $env:NEOFETCH_PROFILE 
}
# ---------------------------------------------------------------------------------------------------------------------
function Get-WindowsDarkThemeStatus {
    $registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    if (Test-Path $registryPath) {
        $themeProperties = Get-ItemProperty -Path $registryPath
        # Check if the "AppsUseLightTheme" registry value is set to 0 (dark theme) or 1 (light theme)
       $isDarkThemeEnabled = $themeProperties.AppsUseLightTheme -eq 0
        return $isDarkThemeEnabled
    } else {
        Write-Host "Theme information not found. Are you using a supported version of Windows?"
        return $false
    }
}
function Set-WindowsTheme {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet('dark','light')]
        [string]$mode
    )
      $UseDarkTheme = $mode -eq 'dark'? $true : $false
      $isDarkThemeEnabled = Get-WindowsDarkThemeStatus
      if (($isDarkThemeEnabled -ne $UseDarkTheme) -or (!$isDarkThemeEnabled -ne !$UseDarkTheme)) {
        $themeKeyPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize'
          $themeValue = $UseDarkTheme ? 0 : 1
          $systemThemeValue = $UseDarkTheme ? 0 : 1
          Set-ItemProperty -Path $themeKeyPath -Name "AppsUseLightTheme" -Value $themeValue
          Set-ItemProperty -Path $themeKeyPath -Name "SystemUsesLightTheme" -Value $systemThemeValue
      } else {
        Write-Host "$mode theme is already set"
      }
}
function Set-WallPaper {
  param (
      [parameter(Mandatory=$true)]
      [string]$Image
      )
    Add-Type -TypeDefinition @" 
    using System; 
    using System.Runtime.InteropServices;
    public class Params
    { 
       [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
       public static extern int SystemParametersInfo (Int32 uAction, Int32 uParam, String lpvParam, Int32 fuWinIni);
    }
"@ 
    $fWinIni = 0x01 -bor 0x02
    $ret = [Params]::SystemParametersInfo(0x0014, 0, $Image, $fWinIni)
}
function Set-Config {
  if (Test-Path $windowsTerminalSettingsPath) {
    $isDarkThemeEnabled = Get-WindowsDarkThemeStatus
    $selectedColorScheme = $isDarkThemeEnabled ? $darkColorSchemeName : $lightColorSchemeName
    $currentBgPath = (Get-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name 'Wallpaper').Wallpaper
    $currentBgName = Split-Path -Path $currentBgPath -Leaf
    # set fzf theme
    $env:FZF_DEFAULT_OPTS=($isDarkThemeEnabled ? $darkFzf : $lightFzf)
    # Ensure the 'profiles' and 'defaults' properties exist in the JSON object
    if (-not $wtSettings.profiles) {$wtSettings.profiles = @{}}
    if (-not $wtSettings.profiles.defaults) {$wtSettings.profiles.defaults = @{}}
    $wtSettings.profiles.defaults.colorScheme = $selectedColorScheme
    $updatedJsonContent = $wtSettings | ConvertTo-Json -Depth 4
    $updatedJsonContent | Set-Content -Path $windowsTerminalSettingsPath -Encoding UTF8
    # Change the Windows background,ohmyposh based on theme
      if ($isDarkThemeEnabled) {
        oh-my-posh init pwsh --config $darkOhMyPosh | Invoke-Expression
        if ($currentBgPath -ne $darkBackgroundImagePath) {
          Set-WallPaper -Image $darkBackgroundImagePath
        } else {
          Write-Host("$currentBgName Background is already set")
        }
      } else {
        oh-my-posh init pwsh --config $lightOhMyPosh | Invoke-Expression
        if ($currentBgPath -ne $lightBackgroundImagePath) {
          Set-WallPaper -Image $lightBackgroundImagePath
        } else {
          Write-Host("$currentBgName Background is already set")
        }
      }
  } else {
    Write-Host "Windows Terminal settings.json not found. Make sure Windows Terminal is installed and run it at least once."
  }
}
function changeTheme {
  param (
      [Parameter(Mandatory=$true)]
      [ValidateSet('dark','light')]
      [string]$Theme
      )
        Set-WindowsTheme -mode $Theme
        Set-Config
}
# PSRadLine Options
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -Colors @{ "InlinePrediction" = "blue" }
## KeyBindgs
Set-PSReadLineKeyHandler -Key "ctrl+p" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "ctrl+n" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key "ALT+j" -Function BackwardChar
Set-PSReadLineKeyHandler -Key "ALT+l" -Function ForwardChar
Set-PSReadLineKeyHandler -Key "Ctrl+h" -Function BackwardWord
Set-PSReadLineKeyHandler -Key "Ctrl+l" -Function ForwardWord
# Modules
Import-Module -name Terminal-Icons
# Aliases
function vim {
  param (
      # find files using `fzf`
      [string]$path,
      [switch]$f
      ) 
    if (-not $f) {
      nvim $path
    } else {
      nvim $(fzf)
    }  
}
Set-Alias pt "~\scoop\apps\powertoys\0.71.0\PowerToys.exe"
# Utility Functions
# delete files and folders
function dlt {
  $numOfArgs = $args.Length
    $Faileds = @()
    $Success = @()
    for ($i=0; $i -lt $numOfArgs; $i++) {
      if (Test-Path $args[$i]) {
        Remove-Item -r -fo $args[$i]
          $Success+= $args[$i]
      } else {
        $Faileds+= $args[$i]
      }
    }
  if ($Faileds.length -eq 0 -and $Success.length -gt 0) {
    Write-Host "$($Success.length) removed successfuly"
  } elseif ($Faileds.length -gt 0 -and $Success.length -eq 0) {
    Write-Host "$($Faileds.length) files failed to removed"
      Write-Host "Failed Files: ('$Faileds')" -ForegroundColor 'red' 
  } elseif ($Faileds.length -eq 0 -and $Success.length -eq 0) {
    Write-Host "nothing removed"
  } else {
    Write-Host "$($Success.length) removed successfuly, but $($Faileds.length) failed to removed"
    Write-Host "Failed Files: ('$Faileds')" -ForegroundColor 'red' 
  }
}
# copy to clipboard
function cpy ($target, $o) {
  if (-not (Test-Path $target) -and $o) {
    $target | clip
    Write-Host "content copied"
  } elseif (Test-Path $target) {
    Get-Content $target | clip
    Write-Host "file content copied"
  }
  else {
    Write-Host "$target file does not exist" -ForegroundColor "red"
  }
}
# generate a typescript interface for an api or existing file using npm quicktype library
function getinterface ($target, $output, $getcontent) {
  if (Get-Command "quicktype" -ErrorAction SilentlyContinue) {
    if ($target) {
      if ($output) {
        quicktype $target --just-types --lang ts --out $output | clip
          Write-Host ("Interface saved in '{0}\{1}' file" -f $(Get-Location), $output)
      } else {
        quicktype $target --just-types --lang ts | clip
        Write-Host "interface copied"
      }
    } else {
      Write-Host "A target must be entered"
    }
  } else {
    Write-Host "you have to install the 'quicktype' library to run this command"
  }	
}
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
# clone epos directly by repo name
function cme($path) {
  $githubUsername = "kayuxcodes" # put your own
  if (Get-Command "git" -ErrorAction SilentlyContinue) {
    git clone git@github.com:${githubUsername}/${path}.git 
  } else {
    Write-Host 'you need to install git to run this command'
  }
}
if (-not $lazy) {
  Set-Config
  Set-Envs
  if (Get-Command "neofetch" -ErrorAction SilentlyContinue) {
    neofetch
  } else {
    Write-Host 'neofetch is not installed in your path'
  }
} else {
    Write-Host("loading script with lazy mod") -ForegroundColor DarkMagenta
    Set-Envs
}
