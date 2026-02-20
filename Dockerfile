FROM python:3.10-slim

# Устанавливаем системные зависимости для компиляции библиотек
RUN apt-get update && apt-get install -y git build-essential && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Удаляем проблемный файл
RUN rm -f requirements.txt

# Обновляем pip и ставим библиотеки по одной, чтобы видеть, где затык
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir pyrogram tgcrypto flask tg-crypto-mod py-tgcalls

CMD ["python", "main.py"]
