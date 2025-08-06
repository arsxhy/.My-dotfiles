#!/usr/bin/env zsh

# cleanup-firmware.zsh (v7)
# Versi "Mix & Match"
# - Menggunakan `autoload colors` Zsh untuk sebagian besar UI.
# - Menggunakan `printf` manual khusus untuk pesan "Proses dibatalkan".

emulate zsh -o pipefail -o errexit
autoload -Uz colors && colors

# --- Variabel Warna Manual (Hanya untuk Pesan Pembatalan) ---
# Kita definisikan hanya yang kita butuhkan untuk blok `else`.
C_RESET_MANUAL='\e[0m'
C_RED_MANUAL='\e[1;31m'

# --- Variabel Utama ---
local -a packages_to_remove_candidates=(
    "linux-firmware"
    "linux-firmware-broadcom"
    "linux-firmware-intel"
    "linux-firmware-mediatek"
    "linux-firmware-nvidia"
    "linux-firmware-qcom"
)
local -a packages_to_keep=(
    "linux-firmware-amdgpu"
    "linux-firmware-atheros"
    "linux-firmware-other"
    "linux-firmware-radeon"
    "linux-firmware-realtek"
    "linux-firmware-whence"
)

# --- Logika Utama ---
(){
    # 1. Tampilkan informasi awal (menggunakan fitur Zsh)
    print -P "%F{cyan}Skrip ini akan membersihkan paket linux-firmware (Versi Zsh).%f"
    print -P "%F{yellow}-------------------------------------------------------------%f"
    print -P "%B%F{red}TARGET PAKET YANG AKAN DIHAPUS (jika ter-install):%b%f"
    print -l -- ${packages_to_remove_candidates} | sed 's/^/  - /'
    print ""
    print -P "%B%F{green}PAKET BERIKUT AKAN DIPASTIKAN ADA:%b%f"
    print -l -- ${packages_to_keep} | sed 's/^/  - /'
    print -P "%F{yellow}-------------------------------------------------------------%f"

    # 2. Minta konfirmasi (menggunakan fitur Zsh, tapi dengan metode andal)
    print -nP -- "%B%F{yellow}Lanjutkan proses ini? [y/N]: %b%f "
    read response

    # 3. EKSEKUSI BERDASARKAN KONDISI
    case "$response" in
        [yY][eE][sS]|[yY])
            # --- BLOK EKSEKUSI 'YA' (menggunakan fitur Zsh) ---
            print -P "\n%F{blue}--> Mengecek paket yang benar-benar ter-install...%f"

            local -a installed_packages=("${(@f)$(pacman -Qq)}")
            local -a final_packages_to_remove=("${(@)packages_to_remove_candidates:*installed_packages}")

            if (( ${#final_packages_to_remove[@]} > 0 )); then
                print -P "%F{red}Paket berikut ditemukan dan akan dihapus:%f"
                print -l -- ${final_packages_to_remove} | sed 's/^/  - /'

                print -P "\n%F{blue}--> Menjalankan penghapusan paket...%f"
                sudo pacman -Rns --noconfirm -- "${final_packages_to_remove[@]}"
            else
                print -P "%F{green}--> Tidak ada paket dari daftar hapus yang perlu dibersihkan. Semuanya sudah rapi!%f"
            fi

            print -P "\n%F{blue}--> Memastikan paket yang dibutuhkan ter-install...%f"
            sudo pacman -S --needed --noconfirm -- "${packages_to_keep[@]}"

            print -P "\n%B%F{green}Pembersihan firmware selesai!%b%f"
            ;;
        *)
            # --- BLOK EKSEKUSI 'TIDAK' (menggunakan printf sesuai permintaan) ---
            printf "\n%b\n" "${C_RED_MANUAL}Proses dibatalkan.${C_RESET_MANUAL}"
            ;;
    esac

} "$@"

exit 0
