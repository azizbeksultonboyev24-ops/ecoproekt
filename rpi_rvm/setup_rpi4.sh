#!/bin/bash
# ==============================================================================
# EcoProject - Raspberry Pi 4 Avtomatik O'rnatish Skripti (Bookworm / Bullseye / Trixie)
# ==============================================================================

set -e

echo "🚀 [1/6] Raspberry Pi 4 paketlar ro'yxati yangilanmoqda..."
sudo apt update

echo "📦 [2/6] RPi 4 tizim kutubxonalari va drayverlari o'rnatilmoqda..."
# RPi 4 uchun grafik, brauzer va Python drayverlari
sudo apt install -y python3-pip python3-venv python3-gpiozero libgl1 unclutter chromium 2>/dev/null || \
sudo apt install -y python3-pip python3-venv python3-gpiozero libgl1 unclutter chromium-browser 2>/dev/null || \
sudo apt install -y python3-pip python3-venv python3-gpiozero chromium

echo "🐍 [3/6] Python Virtual Muhit (venv) yaratilmoqda..."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

# --system-site-packages orqali RPi apparat drayverlari ulanadi
python3 -m venv venv --system-site-packages
source venv/bin/activate

echo "⚡ [4/6] Python kutubxonalari o'rnatilmoqda..."
pip install --upgrade pip

# Keraksiz va zararlangan nvidia fayllarini o'chirish (RPi 4 da faqat ARM CPU bor)
rm -rf venv/lib/python*/site-packages/nvidia* 2>/dev/null || true

# RPi 4 ARM64 uchun yengil va toza CPU PyTorch
echo "📦 Yengil ARM64 CPU PyTorch o'rnatilmoqda..."
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu --no-cache-dir || \
pip install torch torchvision --no-cache-dir

pip install -r requirements.txt

# Qaytadan nvidia papkasi kelsa darhol tozalash
rm -rf venv/lib/python*/site-packages/nvidia* 2>/dev/null || true

echo "🧠 [5/6] YOLOv8n modeli keshga yuklanmoqda..."
python3 -c "from ultralytics import YOLO; YOLO('yolov8n.pt')"

echo "🖥️ [6/6] Ish stoli yorlig'i va tokka ulanganda avtomatik yonish sozlanmoqda..."
chmod +x setup_rpi4.sh setup_rpi5.sh setup_rpi.sh run_kiosk.sh install_autostart_rpi.sh
./install_autostart_rpi.sh

echo "=============================================================================="
echo "🎉 RASPBERRY PI 4 GA HAMMASI MUVAFFAQIYATLI O'RNATILDI!"
echo "Raspberry Pi 4 endi har safar tokka ulanganda avtomatik to'liq ekranda yonadi."
echo "Hozir ishga tushirish uchun: ./run_kiosk.sh"
echo "=============================================================================="
