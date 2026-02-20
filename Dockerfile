FROM python:3.10-slim

# Устанавливаем системные пакеты, чтобы библиотеки могли собраться
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Удаляем проблемный файл с хэшами
RUN rm -f requirements.txt

# Обновляем pip и ставим все нужные библиотеки одной командой
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir \
    flask \
    tgcrypto \
    pyrogram==2.0.106 \
    py-tgcalls \
    coloredlogs \
    colorlog \
    tg-crypto-mod \
    aiohttp \
    aiofiles \
    requests \
    Pillow

# Запуск бота
CMD ["python", "main.py"]
