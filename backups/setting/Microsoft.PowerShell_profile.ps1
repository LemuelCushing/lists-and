# Import module from previous step
Import-Module -Name posh-git

function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    if (Test-Administrator) {  # Use different username if elevated
        Write-Host "(Elevated) " -NoNewline -ForegroundColor White
    }

    Write-Host "$ENV:USERNAME@" -NoNewline -ForegroundColor DarkYellow
    Write-Host "$ENV:COMPUTERNAME" -NoNewline -ForegroundColor Magenta

    if ($s -ne $null) {  # color for PSSessions
        Write-Host " (`$s: " -NoNewline -ForegroundColor DarkGray
        Write-Host "$($s.Name)" -NoNewline -ForegroundColor Yellow
        Write-Host ") " -NoNewline -ForegroundColor DarkGray
    }

    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\','\\'), "~") -NoNewline -ForegroundColor Blue
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
    Write-Host " : " -NoNewline -ForegroundColor DarkGray

    $global:LASTEXITCODE = $realLASTEXITCODE

    Write-VcsStatus

    Write-Host ""

  $dir = $(get-location).ProviderPath
  # Write-Host -NoNewline -ForegroundColor Yellow $dir
  # You may use ANSI or direct ConEmuC call
  if ($env:ConEmuBaseDir -ne $null) {
  # Write-Host -NoNewline (([char]27) + "]9;9;`"" + $dir + "`"" + ([char]27) + "\")
  & ConEmuC.exe -StoreCWD "$dir"
  }

    return "> "
}

$ScriptPath = Split-Path -parent $PSCommandPath
. "$ScriptPath\Get-ChildItem-Color\Get-ChildItem-Color.ps1"

function RefreshPSEnv {
	$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + 
[System.Environment]::GetEnvironmentVariable("Path","User")
}

Set-Alias l Get-ChildItem-Color -option AllScope
Set-Alias ls Get-ChildItem-Format-Wide -option AllScope
Set-Alias dir Get-ChildItem-Color -option AllScope -Force
Set-Alias python2 C:\Python27\python.exe

