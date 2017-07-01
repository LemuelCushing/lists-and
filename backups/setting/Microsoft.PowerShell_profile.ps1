# Import module from previous step
Import-Module -Name posh-git
Import-Module oh-my-posh

# function Test-Administrator {
#     $user = [Security.Principal.WindowsIdentity]::GetCurrent();
#     (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
# }

# function prompt {
#     $realLASTEXITCODE = $LASTEXITCODE

#     Write-Host

#     # Reset color, which can be messed up by Enable-GitColors
#     $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

#     if (Test-Administrator) {  # Use different username if elevated
#         Write-Host "(Elevated) " -NoNewline -ForegroundColor White
#     }

#     Write-Host "$ENV:USERNAME@" -NoNewline -ForegroundColor DarkYellow
#     Write-Host "$ENV:COMPUTERNAME" -NoNewline -ForegroundColor Magenta

#     if ($s -ne $null) {  # color for PSSessions
#         Write-Host " (`$s: " -NoNewline -ForegroundColor DarkGray
#         Write-Host "$($s.Name)" -NoNewline -ForegroundColor Yellow
#         Write-Host ") " -NoNewline -ForegroundColor DarkGray
#     }

#     Write-Host " : " -NoNewline -ForegroundColor DarkGray
#     Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\','\\'), "~") -NoNewline -ForegroundColor Blue
#     Write-Host " : " -NoNewline -ForegroundColor DarkGray
#     Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
#     Write-Host " : " -NoNewline -ForegroundColor DarkGray

#     $global:LASTEXITCODE = $realLASTEXITCODE

#     Write-VcsStatus

#     Write-Host ""

#   $dir = $(get-location).ProviderPath
#   # Write-Host -NoNewline -ForegroundColor Yellow $dir
#   # You may use ANSI or direct ConEmuC call
#   if ($env:ConEmuBaseDir -ne $null) {
#   # Write-Host -NoNewline (([char]27) + "]9;9;`"" + $dir + "`"" + ([char]27) + "\")
#   & ConEmuC.exe -StoreCWD "$dir"
#   }

#     return "> "
# }

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

# function elevate-process
# {
#         $file, [string]$arguments = $args;
#         $psi = new-object System.Diagnostics.ProcessStartInfo $file;
#         $psi.Arguments = $arguments;
#         $psi.Verb = "runas";
#         $psi.WorkingDirectory = get-location;
#         [System.Diagnostics.Process]::Start($psi);
# }
 
# set-alias sudo elevate-process;

Set-Alias sudo elevate
set-theme Agnoster

function alias-edit {
    notepad C:\Users\Lemuel Cushing\OneDrive\Docs\Personal\lists-and\backups\aliases.csv
}

function ps-info {
    Get-Variable profile | Format-List
}
# Set-Alias ps-info ps-info-func

function ps-edit-cfg-np {
     notepad "C:\Users\Lemuel Cushing\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"    
}
# Set-Alias ps-edit-cfg-np ps-edit-config-func

function ps-edit-config-code {
    code "C:\Users\Lemuel Cushing\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"    
}
# Set-Alias ps-edit-cfg-code ps-edit-config-code-func

function scihub {
        python2 C:\Software\scihub.py\scihub\scihub.py
    }
function scihub-dl {
        python2 C:\Software\scihub.py\scihub\scihub.py -v -d
    }
function scihub-help {
        python2 C:\Software\scihub.py\scihub\scihub.py -h
    }

function alias-table {
    $file = "C:\Users\Lemuel Cushing\OneDrive\Docs\Personal\lists-and\backups\aliases.csv"
    $csv = Import-Csv $file | sort Alias
    $csv | Format-Table
}

function alias-list {
    $file = "C:\Users\Lemuel Cushing\OneDrive\Docs\Personal\lists-and\backups\aliases.csv"
    $csv = Import-Csv $file | sort Alias
    
    for ($i = 0; $i -lt $csv.Count; $i++) {
        if($i % 2 -eq 0 ) {$color = 'DarkYellow' 
                            $bgColor = 'DarkBlue'} 
                        else {$color = 'Green' 
                            $bgColor = 'DarkRed'}
        Write-Host -BackgroundColor $bgColor -ForegroundColor $color "Alias:" -NoNewline
        Write-Host -ForegroundColor $color " "$csv[$i].Alias
        Write-Host -BackgroundColor $bgColor -ForegroundColor $color "Note:" -NoNewline
        Write-Host -ForegroundColor $color " "$csv[$i].Note 
        Write-Host -BackgroundColor $bgColor -ForegroundColor $color "Command:" -NoNewline
        Write-Host -ForegroundColor $color " "$csv[$i].Command 
    # "`n"
    }
}
 
# Set-Alias alias-list alias-list-func
# Set-Alias alias-table alias-list-func("table")
Set-Alias pip27 C:\Python27\Scripts\pip2.7.exe
Set-Alias pip2 C:\Python27\Scripts\pip2.exe

function dict {
    param (
        [string]$term
    )
    python "C:\Users\Lemuel Cushing\AppData\Local\Programs\Python\Python35\Lib\site-packages\define\define.py" $term
}

function thesaurus {
    param (
        [string]$term
    )
    python "C:\Users\Lemuel Cushing\AppData\Local\Programs\Python\Python35\Lib\site-packages\define\define.py" -t $term
}

function docs {
    cd "C:\Users\Lemuel Cushing\OneDrive\Docs"
}
function sandbox-local {
    cd "C:\Users\Lemuel Cushing\Documents\CodingTuts"
}
function papers {
    docs
    cd ".\Papers"
}
function sandbox-onedrive {
    docs
    cd ".\Sandbox"
}

function polish-uprising-presentation {
    papers
    cd ".\PolishUprisingSeminar2016-7\Presentation\reveal.js"
}

function polish-uprising-presentation-serve {
    papers
    cd ".\PolishUprisingSeminar2016-7\Presentation\reveal.js"
    grunt serve
}

function lists {
    docs 
    cd ".\Personal\lists-and\"
}
# Load Jump-Location profile
# Import-Module 'C:\Users\Lemuel Cushing\Documents\WindowsPowerShell\Modules\Jump.Location\Jump.Location.psd1'

function camelize ($string) {
    if(-Not (Test-Path alias:c)){ 
        Set-Alias -Name c -Value camelize -Scope global
        Write-Output "Alias created for session: 'c' instead of 'camelize'"}
    $output = New-Object System.Collections.ArrayList
    $string = $string -replace "[`"`\/*?'<>|,]",""
    $string = $string.Split(":")
    foreach ($part in $string) {
        $output.Add((string camelcase $part))
    }
    $output = $output -join "-"
    Microsoft.PowerShell.Management\Set-Clipboard $output
    Write-Output $output
}
# camelize("why don't you go: The working of a deranged loser")
function humanize ($string) {
    $output = string humanize $string
    Microsoft.PowerShell.Management\Set-Clipboard $output
    Write-Output $output
}

function Add-Series ($series) {
try
{
     Push-Location
     Set-Location "C:\Users\Lemuel Cushing\OneDrive\Docs\Personal\lists-and"
     git pull
     if (!$series) {
        $series = Get-Clipboard
     }
     Add-Content .\lists\series.md $series
     Write-Output "$series added"
     if ($series -match "^\[.*\]") {
        $series = $series -replace "\[(.*?)(\s-\sWikipedia)?\]\(.*\)",'$1'
     }
     git add-commit -m "Series: $series" 
     git push
}
catch
{
    $ErrorMessage = $_.Exception.Message
    Write-Output "The error message was $ErrorMessage"
}
finally
{
     Pop-Location
}

} 

function Add-Movie ($movie) {
try
{
     Push-Location
     Set-Location "C:\Users\Lemuel Cushing\OneDrive\Docs\Personal\lists-and"
     git pull
     if (!$movie) {
        $movie = Get-Clipboard
     }
     Add-Content .\lists\movies.md $movie
     Write-Output "$movie added"
     if ($movie -match "^\[.*\]") {
        $movie = $movie -replace "\[(.*?)(\s-\sWikipedia)?\]\(.*\)",'$1'
     }
     git add-commit -m "movie: $movie" 
     git push
}
catch
{
    $ErrorMessage = $_.Exception.Message
    Write-Output "The error message was $ErrorMessage"
}
finally
{
     Pop-Location
}

} 