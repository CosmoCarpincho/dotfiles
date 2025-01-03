#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

#Navegadores
winget.exe install --id "Google.Chrome.EXE" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget.exe install --id "LibreWolf.LibreWolf" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget.exe install --id "Mozilla.Firefox" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force

#Para estudiar y leer
winget.exe install --id "Logseq.Logseq" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget.exe install --id "Obsidian.Obsidian" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget.exe install --id "Anki.Anki" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements --force
winget.exe install --id "calibre.calibre" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget install --id=JohnMacFarlane.Pandoc --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements

#Ofimatica
winget.exe install --id "TheDocumentFoundation.LibreOffice" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force

#Social
winget.exe install --id "Discord.Discord" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
# winget.exe install -e --id "WhatsApp.WhatsApp" # No esta mas
# Si ves la id de la tienda es algo asi como 9NKSQGP7F2NH entonces como el ID seguramente cambie voy a probar
# instalar con Whatsapp sin -e sin --id pero que se descarge de msstore. Igual siento que puede ser inseguro
winget.exe install "WhatsApp" --source msstore # Al ejecutar da el ID etc. para revisar antes de aceptar.
winget.exe install --id=Telegram.TelegramDesktop  -e

#Generales
winget.exe install --id "DeepL.DeepL" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget.exe install --id "OBSProject.OBSStudio" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget.exe install --id "VideoLAN.VLC" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget.exe install --id "CPUID.CPU-Z" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force

#Diseño
winget.exe install --id "Inkscape.Inkscape" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget.exe install --id "KDE.Krita" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
winget.exe install --id "Figma.Figma" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force

#Juegos
winget install -e --id Valve.Steam --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements

#Seguridad
winget.exe install --id "Sandboxie.Plus" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
# winget.exe install --id "PortSwigger.BurpSuite.Community" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
# winget.exe install --id "WiresharkFoundation.Wireshark" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force
# no winget mstore -> 
#winget.exe install -e --id "KeePassXCTeam.KeePassXC" --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force

#IDE
#Instalar manual para config
#winget.exe install -e --id "Microsoft.VisualStudioCode" --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force


#Programación

#TODO: 
#Instalar python, rust, NodeJs, etc ... pasa que al instalar LunarVim manual me instalo python y nodejs.

# Es necesario tambien para que ande LunarVim
# UCRT es la version universal (Universal C Runtime). Desde Windows 10 en adelante. (para Windows anteriores usar MSVCRT)
winget install --id 'MartinStorsjo.LLVM-MinGW.UCRT' --source winget

# par tener el comando man https://develmonk.com/2021/04/26/man-command-in-windows-possible/
winget install --id=MSYS2.MSYS2  -e
# Recordar ->
# Remove-Alias -Name man # pwsh tiene muchos alias que colisionan con los comandos.
# Agregar ruta de mssys2 a el path


# viejas constumbres :) ->
#winget.exe install --id=uutils.coreutils  -e

# Manual por config -> winget.exe install -e --id "Git.Git"
winget.exe install --id "SWI-Prolog.SWI-Prolog" --exact --source winget --accept-source-agreements --disable-interactivity --accept-package-agreements #--force


# Terminal
winget.exe install -e --id "Microsoft.PowerShell.Preview"
winget.exe install --id "JanDeDobbeleer.OhMyPosh" -s winget


$env:Path += ";C:\Users\Cosmo\AppData\Local\Programs\oh-my-posh\bin"

# Buenisimo! oh-my-posh tiene instalador de fuentes :)
oh-my-posh.exe font install "Meslo"
oh-my-posh.exe font install "Hack"
oh-my-posh.exe font install "FiraCode"

$themeOhMyPosh = 'tokyonight_storm.omp.json'

oh-my-posh.exe init pwsh --config "$env:POSH_THEMES_PATH\$themeOhMyPosh" | Invoke-Expression



# Iconos en powershell
# https://github.com/devblackops/Terminal-Icons
Install-Module -Name Terminal-Icons -Repository PSGallery

# Autocompletado
# Install-Module PSReadLine -Scope CurrentUser # ya viene por default

# Para que te de las opciones abajo (no me gusta tanto porque mueve la pantalla)
# Estas config van en $PROFILE
# Set-PSReadLineOption -PredictionViewStyle ListView
# para volver a la opcion de autocompletado
#Set-PSReadLineOption -EditMode Emacs

# Agregar al $PROFILE
$lineOhMyPosh = 'oh-my-posh.exe init pwsh --config "$env:POSH_THEMES_PATH\' + $themeOhMyPosh + ' | Invoke-Expression'


if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}
# Verifica si la línea ya existe en el archivo para evitar duplicados
if (-not (Get-Content -Path $PROFILE | Select-String -Pattern [regex]::Escape($lineOhMyPosh))) {
    Add-Content -Path $PROFILE -Value $lineOhMyPosh
    Write-Host "Línea agregada al archivo de perfil exitosamente." -ForegroundColor Green
} else {
    Write-Host "La línea ya existe en el archivo de perfil." -ForegroundColor Yellow
}

AddContent -Path $PROFILE -Value 'Import-Module Terminal-Icons'
AddContent -Path $PROFILE -Value 'Set-PSReadLineOption -PredictionViewStyle ListView'

# Para Yazi se necesita la terminal de windows (>= v1.22.2702.0) para ver imagenes - instalar manual desde git
#Invoke .... "https://github.com/microsoft/terminal/releases/download/v1.21.3231.0/Microsoft.WindowsTerminal_1.21.3231.0_x64.zip"

winget.exe install sxyazi.yazi
# Install the optional dependencies (recommended):
winget.exe install Gyan.FFmpeg jqlang.jq sharkdp.fd BurntSushi.ripgrep.MSVC junegunn.fzf ajeetdsouza.zoxide ImageMagick.ImageMagick # 7zip.7zip
#falta poppler instalar con scope

winget.exe install nushell


# Instalar scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install poppler

# Programas
#scoop bucket add extras # Chrome, Logseq, Obsidian,etc 
#scoop bucket add versions # neovim
#scoop bucket add main # 7zip mejor instalar manual

#scoop install main/7zip
#scoop install extras/googlechrome
#scoop install extras/logseq
#scoop install extras/obsidian
#scoop install extras/zotero
#scoop install extras/anki
#scoop install versions/neovim-nightlyscoo


#terminal fuentes
function instalarFuentes {
    # TODO: !!!
    # FUNCIONA PERO TERMINAR QUE ENTRE POR PARAMETROS LAS URL DE LAS FUENTES
    # Siempre con admin
    # Aca hay buena info:
    # https://stackoverflow.com/questions/77829662/a-powershell-script-to-install-fonts-on-windows-11
    # https://www.reddit.com/r/Action1/comments/1g0hbs5/powershell_script_to_install_fonts/
    # https://www.jordanmalcolm.com/deploying-windows-10-fonts-at-scale/

    # New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name
    $fontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip"

    $tempPath = "$env:TEMP\NerdFont.zip"
    $extractPath = "$env:TEMP\NerdFont"

    $fontsFolder = "$env:WINDIR\Fonts" #TODO: crear validador

    if (!(Test-Path -Path $fontsFolder)) {
        Write-Host "No existe la ruta de FUENTES default de Windows"
        return 
    }

    Write-Host "Descargando la fuente desde $fontUrl..."
    Invoke-WebRequest -Uri $fontUrl -OutFile $tempPath

    # Crear carpeta temporal para extraer los archivos
    if (!(Test-Path -Path $extractPath)) {
        New-Item -ItemType Directory -Path $extractPath | Out-Null
    }

    # Extraer la fuente
    Write-Host "Extrayendo los archivos..."
    Expand-Archive -Path $tempPath -DestinationPath $extractPath -Force

    # Buscar archivos .ttf y copiarlos a la carpeta de fuentes
    Write-Host "Instalando fuentes..."
    $fontList = Get-ChildItem -Path $extractPath -Filter "*.ttf"
    
    foreach ($font in $fontList) {
        Write-Host "Installing font -" $font.BaseName
        Copy-Item -Path $font.FullName -Destination $fontsFolder 
        New-ItemProperty -Name $font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $font.name
    }

    # Limpiar archivos temporales
    Write-Host "Limpieza de archivos temporales..."
    Remove-Item -Path $tempPath -Force
    Remove-Item -Path $extractPath -Recurse -Force

    Write-Host "¡Instalación completada! Configura la fuente en tu terminal."

}

function installarWhatsappInstalador {

$tempInstaller = "$env:TEMP\WhatsAppInstaller.appinstaller"

#TODO: esto tendria que pasarlo por parametro
$url = "https://get.microsoft.com/installer/download/9NKSQGP7F2NH?cid=website_cta_psi"

Write-Host "Descargando instalador de WhatsApp..." -ForegroundColor Green
Invoke-WebRequest -Uri $url -OutFile $tempInstaller

# como usar el instalador????

Remove-Item $tempInstaller -Force

Write-Host "Instalación completada." -ForegroundColor Green

}


##### NUEVOS ACOMODAR

winget search --id sharkdp.bat --source winget
winget search --id "Oracle.VirtualBox" --source winget


#### Completions PowerShell TODO: HACER VALIDACIONES
mkdir ~/.completions
Copy-Item -Path ./.completions/ ~/
