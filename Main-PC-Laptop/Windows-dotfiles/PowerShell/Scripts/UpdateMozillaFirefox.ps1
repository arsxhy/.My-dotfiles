
<#PSScriptInfo

.VERSION 2.0.6

.GUID 6d9b52c5-9b60-48e1-a0c1-e5c62d5bb660

.AUTHOR Fabrice Sanga

.COMPANYNAME sangafabrice

.COPYRIGHT © 2022 SangaFabrice. All rights reserved.

.TAGS firefox update browser

.LICENSEURI https://github.com/sangafabrice/reg-cli/blob/main/LICENSE.md

.PROJECTURI https://github.com/sangafabrice/reg-cli/tree/firefox

.ICONURI https://rawcdn.githack.com/sangafabrice/reg-cli/fa46f4d6bb7df0d1d507d8a9f2d0e0f60f2bc454/icon.png

.EXTERNALMODULEDEPENDENCIES DownloadInfo,RegCli 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
Remove Select-NonEmptyObject from script.

.PRIVATEDATA

#>

#Requires -Module @{ModuleName = 'DownloadInfo'; ModuleVersion = '5.0.4'}
#Requires -Module @{ModuleName = 'RegCli'; ModuleVersion = '6.2.2'}

[CmdletBinding()]
Param (
    [ValidateNotNullOrEmpty()]
    [ValidateScript({ Test-InstallLocation $_ $PSScriptRoot })]
    [string]
    $InstallLocation = "${Env:ProgramData}\Firefox",
    [ValidateNotNullOrEmpty()]
    [ValidateScript({ Test-InstallerLocation $_ })]
    [string]
    $SaveTo = $PSScriptRoot
)

& {
    $NameLocation = "$InstallLocation\firefox.exe"
    Write-Verbose 'Retrieve install or update information...'
    $UpdateInfo =
        Try {
            Get-DownloadInfo -PropertyList @{
                RepositoryId = 'firefox'
                OSArch = Get-ExecutableType $NameLocation
                VersionDelim = $Null
            } -From Mozilla
        }
        Catch { }
    Try {
        $UpdateModule =
            Import-CommonScript chrome-installer |
            Import-Module -PassThru -Force -Verbose:$False
        @{
            UpdateInfo = $UpdateInfo
            NameLocation = $NameLocation
            SaveTo = $SaveTo
            SoftwareName = 'Firefox'
            UseTimestamp = $True
            TimestampType = 'SigningTime'
            Checksum = $UpdateInfo.Checksum
            Verbose = $VerbosePreference -ine 'SilentlyContinue'
        } | ForEach-Object { Invoke-CommonScript @_ }
    }
    Catch { }
    Finally { $UpdateModule | Remove-Module -Verbose:$False }
}

<#
.SYNOPSIS
    Updates Mozilla Firefox browser software.
.DESCRIPTION
    The script installs or updates Mozilla Firefox browser on Windows.
.NOTES
    Required: at least Powershell Core 7.
.PARAMETER InstallLocation
    Path to the installation directory.
    It is restricted to file system paths.
    It does not necessary exists.
    It defaults to %ProgramData%\MozillaFirefox.
.PARAMETER SaveTo
    Path to the directory of the downloaded installer.
    It is an existing file system path.
    It defaults to the script directory.
.EXAMPLE
    Get-ChildItem C:\ProgramData\MozillaFirefox -ErrorAction SilentlyContinue

    PS > .\UpdateMozillaFirefox.ps1 -InstallLocation C:\ProgramData\MozillaFirefox -SaveTo .

    PS > Get-ChildItem C:\ProgramData\MozillaFirefox | Select-Object Name -First 5
    Name
    ----
    browser
    defaults
    fonts
    gmp-clearkey
    uninstall

    PS > Get-ChildItem | Select-Object Name
    Name
    ----
    firefox_104.0.2.exe
    UpdateMozillaFirefox.ps1

    Install Mozilla Firefox browser to 'C:\ProgramData\MozillaFirefox' and save its setup installer to the current directory.
#>

