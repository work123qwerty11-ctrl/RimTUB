FROM python:3.11-slim

# Эта строка заставляет Railway пересобрать образ полностью
ENV CACHE_BUST=1

WORKDIR /app_new

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

# Удаляем вообще все файлы с расширением .session в папке
RUN rm -rf *.session*

CMD ["python", "main.py"]
