# 🌿 EcoProject: Raspberry Pi 4 Boshqaruv Tizimi

Ushbu qo'llanma **EcoProject Smart RVM** tizimini **Raspberry Pi 4** (2GB, 4GB yoki 8GB) da to'g'ri o'rnatish va ishga tushirish uchun mo'ljallangan.

---

## ⚡ 1. Raspberry Pi 4 ning Afzalliklari:
- **Oddiy 5V 3A (15W) blok yetadi:** Raspberry Pi 4 ga RPi 5 kabi qimmat 27W zaryadchik shart emas, standart Type-C 15W blok to'liq yetadi va tokdan o'chib qolmaydi.
- **Yengil Snapshot CV:** YOLOv8n modeli 416x416 o'lchamda sekundiga 2 kadr olib ishlaydi (~100ms), RPi 4 protsessorini ortiqcha qizdirmaydi.
- **ESP32 bilan barqaror USB Serial aloqasi:** RPi 4 dagi USB portlar orqali ESP32 (servolar va 30-LED WS2812B lenta) xatosiz boshqariladi.

---

## 🔌 2. Ulanish Sxemasi:
1. **USB Kamera** -> RPi 4 ning ko'k USB 3.0 portiga.
2. **ESP32 Platasi** -> RPi 4 ning qora USB 2.0 portiga.
3. **10-Dyumlik Ekran** -> Micro-HDMI 0 portiga va alohida 5V quvvatga.
4. **ESP32 ga** -> 2 ta servo (GPIO 18, 19) va WS2812B lenta (GPIO 4) tashqi 5V blokdan quvvatlanadi.

---

## 🚀 3. Raspberry Pi 4 da O'rnatish:

Raspberry Pi 4 terminalida:
```bash
cd ~/Desktop/eco/ecoproekt/rpi_rvm
git pull origin main
chmod +x *.sh
./setup_rpi4.sh
```

---

## 🖥️ 4. Ishga Tushirish:

Hozir ochish uchun:
```bash
./run_kiosk.sh
```

Raspberry Pi 4 har safar tokka ulanishi bilan o'zi avtomatik to'liq ekranda ochiladi!
