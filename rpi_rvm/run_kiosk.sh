#!/bin/bash
# ==============================================================================
# EcoProject - RPi 5 Kiosk Rejimida Ishga Tushirish (Wayland & X11 Moslashuvchan)
# ==============================================================================

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

# Virtual muhitni faollashtirish
source venv/bin/activate

# 1. Serverni orqa fonda ishga tushirish
echo "🚀 EcoProject RVM Server ishga tushirilmoqda..."
python3 -m uvicorn server:app --host 0.0.0.0 --port 8000 &
SERVER_PID=$!

# Server yuklanishi uchun 4 soniya kutish
sleep 4

# 2. Sensorli ekranda kursor ko'rinmasligi uchun yashirish
unclutter -idle 0.5 -root &

# 3. Chromiumni RPi 5 Wayland/X11 to'liq ekranda ochish
echo "🖥️ EcoProject Kiosk ekranda ochilmoqda..."
chromium-browser \
  --kiosk \
  --noerrdialogs \
  --disable-infobars \
  --disable-session-crashed-bubble \
  --check-for-update-interval=31536000 \
  --autoplay-policy=no-user-gesture-required \
  --ozone-platform-hint=auto \
  http://127.0.0.1:8000

# Agar Chromium yopilsa, orqa fondagi serverni to'xtatish
kill $SERVER_PID
