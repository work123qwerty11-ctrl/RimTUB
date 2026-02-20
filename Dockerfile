FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Установка всех библиотек разом
RUN pip install --no-cache-dir \
    pyrogram==2.0.106 \
    TgCrypto \
    pytimeparse \
    coloredlogs \
    humanfriendly \
    beautifulsoup4 \
    googletrans==4.0.0-rc1 \
    python-weather \
    pyTelegramBotAPI \
    aiohttp \
    pillow \
    convopyro \
    g4f \
    pyaes \
    pycryptodome \
    aiofiles \
    aiosqlite \
    APScheduler

COPY . .

# Команда очистки старых файлов перед запуском
RUN rm -f RimTUB.session RimTUB.session-journal

CMD ["python", "main.py"]
