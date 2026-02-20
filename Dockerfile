FROM python:3.10-slim

# Устанавливаем системные пакеты (нужны для сборки некоторых модулей)
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Удаляем файл с хэшами, который портил нам жизнь
RUN rm -f requirements.txt

# Ставим все библиотеки разом. Я добавил 'coloredlogs' и 'tg-crypto-mod' (через GitHub)
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir \
    flask \
    tgcrypto \
    pyrogram==2.0.106 \
    py-tgcalls \
    coloredlogs \
    colorlog \
    aiohttp \
    aiofiles \
    requests \
    Pillow \
    python-dotenv \
    https://github.com/KurimuzonAkuma/pyrogram/archive/v2.1.21.zip

# Запуск бота
CMD ["python", "main.py"]
