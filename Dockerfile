FROM python:3.11-slim

# Меняем папку на /bot, чтобы сбросить все старые привязки
WORKDIR /bot

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

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

# Принудительно удаляем всё, что похоже на старые сессии
RUN rm -f *.session*

CMD ["python", "main.py"]
