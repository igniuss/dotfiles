Install-PackageProvider -Name "NuGet" -Force
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

irm asheroto.com/winget | iex

function Update-Environment-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

function Push-User-Path($userPath) {
    $path = [Environment]::GetEnvironmentVariable('Path', 'User')
    $newpath = "$userPath;$path"
    [Environment]::SetEnvironmentVariable("Path", $newpath, 'User')
    Update-Environment-Path
}


# Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Update-Environment-Path

choco install firacode --yes # See https://www.youtube.com/watch?v=KI6m_B1f8jc

# Utils
Get-Command -Module Microsoft.PowerShell.Archive

winget install -e --id Git.Git
winget install -e --id SaaSGroup.Tower
winget install -e --id GitHub.GitHubDesktop

Update-Environment-Path

git config --global core.editor "code --wait"
git config --global init.defaultBranch main

# Aliases
git config --global alias.pom 'pull origin main'
git config --global alias.last 'log -1 HEAD'
git config --global alias.ls "log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=short --graph"
git config --global alias.standup "log --since yesterday --author $(git config user.email) --pretty=short"
git config --global alias.ammend "commit -a --amend"
git config --global alias.everything "! git pull && git submodule update --init --recursive"
git config --global alias.aliases "config --get-regexp alias"


# PowerShell Tooling for Git
Install-Module posh-git -Force -Scope CurrentUser
Install-Module oh-my-posh -Force -Scope CurrentUser
Set-Prompt
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Add-Content $PROFILE "`nImport-Module posh-git`nImport-Module oh-my-posh`nSet-PoshPrompt pararussel"


# Font to support PowerShell Tooling:
git clone https://github.com/ryanoasis/nerd-fonts.git  --depth 1
cd nerd-fonts
.\install.ps1
cd ..\
Write-Output 'Update windows terminal font: "fontFace": "MesloLGM NF"'

# Node
winget install -e --id OpenJS.NodeJS
Update-Environment-Path
npm install --global --production npm-windows-upgrade
npm-windows-upgrade --npm-version latest

# Hyper-V required for docker and other things
Enable-WindowsOptionalFeature -Online -FeatureName:Microsoft-Hyper-V -All -NoRestart

# Software
winget install -e --id Google.Chrome
winget install -e --id Mozilla.Firefox
winget install -e --id VideoLAN.VLC
winget install -e --id Valve.Steam
winget install -e --id Discord.Discord
winget install -e --id Obsidian.Obsidian


winget install -e --id Docker.DockerDesktop
winget install -e --id Unity.UnityHub
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Microsoft.DotNet.SDK.5
winget install -e --id Microsoft.DotNet.SDK.6
winget install -e --id Microsoft.DotNet.SDK.7
winget install -e --id Microsoft.WindowsTerminal
Update-Environment-Path

bash.exe vscode-extensions.sh
wsl --install
Write-Output "Finished!🚀"