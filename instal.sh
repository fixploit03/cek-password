#!/bin/bash
#--------------------------------------------------------------------------------------------
# [cek_password.sh]
#--------------------------------------------------------------------------------------------
# Program Bash sederhana untuk mengecek apakah password Anda terdapat di Wordlist rockyou.txt
#--------------------------------------------------------------------------------------------
# Dibuat oleh : fixploit03
# Github      : https://github.com/fixploit03/cek-password/
#--------------------------------------------------------------------------------------------


if [[ $EUID -ne 0 ]]; then
	echo "[-] Script ini harus dijalankan sebagai root."
	exit 1
fi

read -p "[#] Apakah Anda ingin menginstal cek-password [Y/n]: " n

if [[ "${n}" == "y" || "${n}" == "Y" ]]; then
	if ! ping -c 1 8.8.8.8 >> /dev/null 2>&1; then
		echo "[-] Anda tidak memiliki koneksi internet. Pastikan Anda memiliki koneksi internet untuk menginstal cek-password."
		exit 1
	fi
	if ! command -v wget >> /dev/null 2>&1; then
		echo "[-] wget belum terinstal."
		echo "[*] Menginstal wget..."
		sleep 3
		apt-get install wget -y
		if [[ $? -ne 0 ]]; then
			echo "[-] wget gagal diinstal."
			exit 1
		else
			echo "[+] wget berhasil diinstal."
		fi
	fi
	echo "[*] Mendownload Wordlist rockyou.txt..."
	sleep 3
	url_rockyou="https://github.com/praetorian-inc/Hob0Rules/raw/refs/heads/master/wordlists/rockyou.txt.gz"
	wget "${url_rockyou}"
	if [[ $? -ne 0 ]]; then
	        echo "[-] Wordlist rockyou.txt gagal didownload."
	        exit 1
	else
	        echo "[+] Wordlist rockyou.txt berhasil didownload."
	fi
	gzip -d rockyou.txt.gz
	chmod +x cek-password.sh
	echo "[+] cek-password berhasil diinstal."
	echo "[+] Ketikkan './cek-password.sh' untuk menjalankannya."
elif [[ "${n}" == "n" || "${n}" == "N" ]]; then
	echo "[*] Semoga harimu menyenangkan ^_^"
	exit 0
else
	echo "[-] Nasukkan tidak valid. Harap masukkan 'Y/n'."
	exit 1
fi

