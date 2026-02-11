# Playwright'ın her şey dahil resmi imajını kullanıyoruz (Hataları kökten çözer)
FROM mcr.microsoft.com/playwright/python:v1.41.0-jammy

# Çalışma dizini
WORKDIR /app

# Sistem paketlerini güncelle
RUN apt-get update && apt-get install -y \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

# Gereksinimleri kopyala ve kur
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kodları kopyala
COPY . .

# Botu başlat
CMD ["python", "main.py"]
