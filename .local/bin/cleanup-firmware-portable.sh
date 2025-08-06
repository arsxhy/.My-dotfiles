#!/bin/sh

# cleanup-firmware-portable.sh (v2)
# Versi portabel yang telah disempurnakan.
# - Memperbaiki tampilan warna dengan `printf`.
# - Menambahkan pengecekan agar tidak menampilkan error "target not found".
#   Aman untuk dibagikan dan dijalankan berkali-kali.

set -e

# --- Variabel Warna (ANSI Escape Codes) ---
C_RESET='\033[0m'
C_BOLD='\033[1m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'

# --- DAFTAR PAKET ---
packages_to_remove="linux-firmware linux-firmware-broadcom linux-firmware-intel linux-firmware-mediatek linux-firmware-nvidia linux-firmware-qcom"
packages_to_keep="linux-firmware-amdgpu linux-firmware-atheros linux-firmware-other linux-firmware-radeon linux-firmware-realtek linux-firmware-whence"

# --- LOGIKA SKRIP ---

# FIX: Menggunakan `printf` untuk kompatibilitas warna yang lebih baik
printf "%b\n" "${C_BLUE}Skrip ini akan membersihkan paket linux-firmware (Versi Portabel).${C_RESET}"
printf "%b\n" "${C_YELLOW}--------------------------------------------------------------${C_RESET}"
printf "%b\n" "${C_BOLD}${C_RED}PAKET BERIKUT AKAN DIHAPUS (jika ditemukan):${C_RESET}"
for pkg in $packages_to_remove; do
	printf -- "- %s\n" "$pkg"
done
printf "\n"
printf "%b\n" "${C_BOLD}${C_GREEN}PAKET BERIKUT AKAN DIPASTIKAN ADA:${C_RESET}"
for pkg in $packages_to_keep; do
	printf -- "- %s\n" "$pkg"
done
printf "%b\n" "${C_YELLOW}--------------------------------------------------------------${C_RESET}"

# Meminta konfirmasi
printf "%b" "${C_BOLD}${C_YELLOW}Lanjutkan proses ini? [y/N]: ${C_RESET}"
read -r response

case "$response" in
[yY][eE][sS] | [yY])
	# Lanjutkan
	;;
*)
	printf "\n%b\n" "${C_RED}Proses dibatalkan.${C_RESET}"
	exit 0
	;;
esac

# --- EKSEKUSI CERDAS ---

# FIX: Cek dulu paket mana saja yang benar-benar ter-install
# sebelum mencoba menghapusnya.
final_packages_to_remove=""
printf "\n%b\n" "${C_BLUE}--> Mengecek paket yang ter-install...${C_RESET}"
for pkg in $packages_to_remove; do
	# `pacman -Q` akan error jika paket tidak ada, kita manfaatkan itu.
	if pacman -Q "$pkg" >/dev/null 2>&1; then
		printf "%b\n" "    [DITEMUKAN] $pkg akan dihapus."
		final_packages_to_remove="$final_packages_to_remove $pkg"
	fi
done

# Hanya jalankan `pacman -Rns` jika ada paket yang perlu dihapus
if [ -n "$final_packages_to_remove" ]; then
	printf "\n%b\n" "${C_BLUE}--> Menjalankan penghapusan paket...${C_RESET}"
	sudo pacman -Rns --noconfirm $final_packages_to_remove
else
	printf "\n%b\n" "${C_GREEN}--> Tidak ada paket dari daftar hapus yang perlu dibersihkan.${C_RESET}"
fi

printf "\n%b\n" "${C_BLUE}--> Memastikan paket yang dibutuhkan ter-install...${C_RESET}"
sudo pacman -S --needed --noconfirm $packages_to_keep

printf "\n%b\n" "${C_BOLD}${C_GREEN}Pembersihan firmware selesai!${C_RESET}"

exit 0
