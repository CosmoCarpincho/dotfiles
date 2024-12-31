
oh-my-posh.exe init pwsh --config "$env:POSH_THEMES_PATH\tokyonight_storm.omp.json" | Invoke-Expression

Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionViewStyle ListView
# para volver ->
#Set-PSReadLineOption -EditMode Emacs

# tab y te muestra los comandos
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Generate the .oh-my-posh.nu file
# oh-my-posh.exe init nu --config "$env:POSH_THEMES_PATH\tokyonight_storm_nu.omp.json" | Invoke-Expression

Set-Alias lvim 'C:\Users\cosmo\.local\bin\lvim.ps1'
#Set-Alias -Name find -Value 'C:\Users\cosmo\AppData\Local\Programs\Git\usr\bin\find.exe'
Remove-Alias -Name man
Remove-Alias -Name cp
Remove-Alias -Name mv
Set-Alias -Name find -Value C:\msys64\usr\bin\find.exe
