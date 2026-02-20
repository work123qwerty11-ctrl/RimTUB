FROM python:3.10-slim

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Удаляем проблемный файл
RUN rm -f requirements.txt

# Ставим пакеты. Я добавил coloredlogs и прямую ссылку на Pyrogram
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir \
    flask \
    tgcrypto \
    py-tgcalls \
    coloredlogs \
    colorlog \
    aiohttp \
    aiofiles \
    requests \
    Pillow \
    python-dotenv \
    https://github.com/KurimuzonAkuma/pyrogram/archive/v2.1.21.zip

CMD ["python", "main.py"]
