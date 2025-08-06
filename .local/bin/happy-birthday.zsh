#!/usr/bin/zsh

# =======================================================
# Project: Hadiah Digital buat Hiyori
# Dibuat pada 28 Juni, karena hari ini spesial.
# Semoga dia (dan aku) suka.
# =======================================================

# --- Bagian yang bisa dioprek-oprek ---

# Tempat koleksi foto-foto terbaik Hiyori.
DIREKTORI_GAMBAR="$HOME/Pictures/Noragami Wallpaper/Hiyori"

# Atur kecepatan animasi. Biar pas feel-nya.
DELAY_KETIK=0.07
DELAY_REVEAL=0.1


# --- Kumpulan 'Sihir' buat Pertunjukannya ---

# Biar tanggalnya ga salah. Penting ini.
zmodload zsh/datetime
strftime -s TANGGAL_HARI_INI "%d %B %Y"

# Sebuah pengingat kecil...
PESAN_KEDUA="It's been 7 wonderful years."

# Efek ketikan klasik. Satu huruf, satu rasa.
animasi_ketik() {
    local teks="$1"
    for char in ${(s::)teks}; do
        printf "%s" "$char"
        sleep $DELAY_KETIK
    done
    printf "\n"
}

# The main event! Bikin ucapan selamat super gede.
tampilkan_ucapan_ascii() {
    # Sempet drama dikit gara-gara tulisannya kepotong,
    # tapi akhirnya pake -S -t (smush & termwidth) beres juga. Mantap.
    local ucapan_ascii
    ucapan_ascii=$(toilet -f smmono12 -S -t --metal -- "Happy Birthday Hiyori!")

    # Masukin ke array per baris. Zsh keren emang.
    local -a baris_ucapan=("${(@f)ucapan_ascii}")

    # Tunjukin hasilnya pelan-pelan, baris per baris...
    print ""
    for baris in $baris_ucapan; do
        echo "$baris"
        sleep $DELAY_REVEAL
    done
    print ""
}

# --- Oke, kita mulai pertunjukannya! ---

# Layar bersih, hati tenang.
clear

# 1. Nyari kado terindahnya Hiyori...
print -P "%B%F{cyan}Mencari foto terbaik Hiyori...%b%f"
local gambar_terbaru=($DIREKTORI_GAMBAR/*.(jpg|jpeg|png)(N.om[1]))

# Kalo fotonya ga ada, batalin pestanya. Gabisa.
if [[ -z "$gambar_terbaru" ]]; then
    print -P "%B%F{red}Duh, fotonya Hiyori ga ketemu...%b%f"
    print "Coba cek lagi di '$DIREKTORI_GAMBAR'."
    exit 1
fi
print -P "%B%F{green}Dapet! Ini dia fotonya: $gambar_terbaru%b%f\n"
sleep 1.5

# 2. Ngitung ukuran terminal biar gambarnya ga kegedean atau kekecilan.
local size_arg
if [[ -n "$COLUMNS" && -n "$LINES" && "$COLUMNS" -gt 4 && "$LINES" -gt 10 ]]; then
    local width=$((COLUMNS - 4))
    local height=$((LINES - 10))
    size_arg="${width}x${height}"
else
    # Jaga-jaga kalo terminalnya lagi ngaco, pake ukuran aman.
    size_arg="80x35"
    print -P "%B%F{yellow}Terminalnya aneh, pake ukuran default aja deh..%b%f"
fi

# 3. Mengubah foto jadi mahakarya ASCII.
chafa --size "$size_arg" --fill block -c full "$gambar_terbaru"
print

# 4. Sedikit kata-kata pembuka...
animasi_ketik "$PESAN_KEDUA"
animasi_ketik "Tepat hari ini, $TANGGAL_HARI_INI"
sleep 1

# 5. GRAND FINALE!
tampilkan_ucapan_ascii

# Momen penutup...
print -P "\n%B%F{green}Mission accomplished. Happy birthday, my dear Hiyori!%b%f\n"
