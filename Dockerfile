FROM python:3.11-slim

# Системные зависимости для сборки и работы с медиа
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Удаляем файл с хэшами, который мешал сборке
RUN rm -f requirements.txt

# Устанавливаем ВСЕ необходимые библиотеки разом
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
    aiosqlite \
    sqlalchemy \
    typing-extensions \
    pyTelegramBotAPI \
    convopyro \
    https://github.com/KurimuzonAkuma/pyrogram/archive/v2.1.21.zip

CMD ["python", "main.py"]
