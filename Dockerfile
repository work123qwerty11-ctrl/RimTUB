FROM python:3.11-slim

WORKDIR /app

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

# Удаляем файл сессии, если он вдруг остался старым, чтобы создать новый
RUN rm -f RimTUB.session

CMD ["python", "main.py"]
