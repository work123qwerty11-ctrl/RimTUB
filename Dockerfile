FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Устанавливаем ВООБЩЕ ВСЁ разом
RUN pip install --no-cache-dir \
    pygram==2.0.106 \
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
    aiofiles \
    aiosqlite \
    APScheduler \
    pydantic \
    requests

COPY . .

CMD ["python", "main.py"]
