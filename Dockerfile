FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Ставим всё необходимое
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

# Удаляем остатки старой базы данных перед запуском
RUN rm -f RimTUB.session RimTUB.session-journal

CMD ["python", "main.py"]
