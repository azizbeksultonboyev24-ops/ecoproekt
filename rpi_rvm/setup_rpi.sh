#!/bin/bash
# ==============================================================================
# EcoProject - Raspberry Pi 4 / 5 Umumiy O'rnatish Skripti
# ==============================================================================

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

chmod +x setup_rpi4.sh setup_rpi5.sh run_kiosk.sh install_autostart_rpi.sh

# Agar RPi 4 bo'lsa setup_rpi4.sh ni chaqiradi
./setup_rpi4.sh
