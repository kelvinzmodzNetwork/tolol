# Menghapus file lama jika ada
rm -rf ngrok ngrok.zip ng.sh > /dev/null 2>&1

# Menampilkan pesan unduhan ngrok
echo "======================="
echo "Downloading ngrok"
echo "======================="

# Mengunduh file ngrok versi Linux
wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok.zip > /dev/null 2>&1
chmod +x ngrok

# Mengatur token ngrok secara otomatis
./ngrok authtoken 2kcmfWVB2gbx6Y2RCbmWlm7pAWT_6ziewSatgRwMU3Nf4Qfdi

# Membersihkan layar dan menampilkan pilihan region ngrok
clear
echo "======================="
echo "Choose ngrok region"
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
read -p "Choose ngrok region: " CRP

# Menjalankan ngrok di region yang dipilih pada port 3388
./ngrok tcp --region "$CRP" 3388 > /dev/null 2>&1 &

# Memberikan jeda waktu agar ngrok siap
sleep 5

# Menampilkan pesan instalasi RDP
echo "===================================="
echo "Installing RDP"
echo "===================================="
docker pull danielguerra/ubuntu-xrdp > /dev/null 2>&1

# Membersihkan layar dan menampilkan info RDP
clear
echo "===================================="
echo "Starting RDP"
echo "===================================="
echo "Username: ubuntu"
echo "Password: ubuntu"
echo "RDP Address:"
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:\/\/([^"]*).*/\1/p'
echo "===================================="
echo "Don't close this tab to keep RDP running"
echo "Wait 2 minutes to finish the setup then use the RDP address"
echo "===================================="

# Menjalankan container RDP
docker run --rm -p 3388:3389 danielguerra/ubuntu-xrdp > /dev/null 2>&1
