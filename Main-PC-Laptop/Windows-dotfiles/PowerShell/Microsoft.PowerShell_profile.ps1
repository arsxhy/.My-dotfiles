
# Konfigurasi PSReadLine untuk PowerShell
# yang Menyediakan dukungan untuk line editing dan keybinding.

# Import PSReadLine
Import-Module PSReadLine

# Keybinding untuk Readline Emacs
Set-PSReadLineKeyHandler -Key Ctrl+p -Function PreviousHistory
Set-PSReadLineKeyHandler -Key Ctrl+n -Function NextHistory
Set-PSReadLineKeyHandler -Key Ctrl+f -Function ForwardChar
Set-PSReadLineKeyHandler -Key Ctrl+b -Function BackwardChar
Set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine

# Keybinding untuk maju dan mundur satu kata
Set-PSReadLineKeyHandler -Key Alt+f -Function ForwardWord
Set-PSReadLineKeyHandler -Key Alt+b -Function BackwardWord

# Keybinding untuk Undo
Set-PSReadLineKeyHandler -Key Ctrl+/ -Function Undo

# Custom Script Folder
$env:PATH += ";C:\Users\acer8\Documents\PowerShell\Scripts"

# Konfigurasi Alias Perintah
Set-Alias -Name btop -Value "btop4win.exe"
Set-Alias -Name vim -Value nvim

# Remove alias default bawaan
Remove-Item Alias:ls

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
