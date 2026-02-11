# Python imajını kullan
FROM python:3.11-slim

# Gerekli sistem paketlerini ve Playwright bağımlılıklarını kur
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Çalışma dizinini oluştur
WORKDIR /app

# Gereksinimleri kopyala ve kur
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Playwright tarayıcılarını kur (Hata veren kısım burasıydı)
RUN playwright install chromium
RUN playwright install-deps chromium

# Kodun geri kalanını kopyala
COPY . .

# Botu başlat
CMD ["python", "main.py"]
