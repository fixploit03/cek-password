#!/bin/bash
#--------------------------------------------------------------------------------------------
# [cek_password.sh]
#--------------------------------------------------------------------------------------------
# Program Bash sederhana untuk mengecek apakah password Anda terdapat di Wordlist rockyou.txt
#--------------------------------------------------------------------------------------------
# Dibuat oleh : fixploit03
# Github      : https://github.com/fixploit03/cek-password/
#--------------------------------------------------------------------------------------------

# Mengandung 14 juta password
database_password="rockyou.txt"

echo ""
echo "==========================================================="
echo "Cek apakah password Anda apakah ada di Wordlist ${database_password}"
echo "==========================================================="
echo ""
read -p "Masukkan Password Anda: " password

if [[ $(cat "${database_password}" | grep -o "\b${password}\b" ) ]]; then
	echo ""
	echo "[-] Password Anda terdapat di Wordlist ${database_password}"
	exit 0
else
	echo ""
	echo "[+] Password Anda tidak terdapat di Wordlist ${database_password}"
	exit 0
fi

