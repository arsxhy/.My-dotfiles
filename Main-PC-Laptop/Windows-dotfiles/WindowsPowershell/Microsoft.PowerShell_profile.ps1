
# Konfigurasi PSReadLine untuk Windows PowerShell 5.1
# yang Menyediakan dukungan untuk line editing dan keybinding.

# Import PSReadLine
Import-Module PSReadLine

# Keybinding untuk Readline Emacs
Set-PSReadLineKeyHandler -Chord Ctrl+p -Function PreviousHistory
Set-PSReadLineKeyHandler -Chord Ctrl+n -Function NextHistory
Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar
Set-PSReadLineKeyHandler -Chord Ctrl+b -Function BackwardChar
Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine

# Keybinding untuk maju dan mundur satu kata
Set-PSReadLineKeyHandler -Chord Alt+f -Function ForwardWord
Set-PSReadLineKeyHandler -Chord Alt+b -Function BackwardWord

# Keybinding untuk Undo
Set-PSReadLineKeyHandler -Chord Ctrl+/ -Function Undo

# Custom Script Folder
$env:PATH += ";C:\Users\acer8\Documents\WindowsPowerShell\Scripts"

# Konfigurasi Alias Perintah
Set-Alias -Name btop -Value "btop4win.exe"
Set-Alias -Name vim -Value nvim

# Remove alias default bawaan
if (Test-Path Alias:ls) {
    Remove-Item Alias:ls
}

# Function PowerShell Tambahan (WIP)
function yt-mp3 {
    yt-dlp -P "C:\Users\acer8\Music\Downloaded" --color=auto --extract-audio --audio-format mp3 --audio-quality 0 --embed-metadata --progress $args
}

function tp-cmd-alias {
    cd "C:\Users\acer8\Documents\CMD\aliases"
}

function ls {
    lsd -la1hF $args
}

# Menjalankan fastfetch saat PowerShell dibuka
fastfetch
Invoke-Expression (&scoop-search --hook)

