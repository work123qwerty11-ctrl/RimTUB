FROM python:3.11-slim

# Устанавливаем системные зависимости для работы с медиа и сборки модулей
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Удаляем старый файл зависимостей, чтобы избежать ошибок с хэшами
RUN rm -f requirements.txt

# Устанавливаем ВСЕ необходимые модули одной командой
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

# Команда запуска
CMD ["python", "main.py"]
