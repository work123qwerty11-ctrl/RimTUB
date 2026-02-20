FROM python:3.10-slim

# Ставим всё необходимое для сборки тяжелых библиотек
RUN apt-get update && apt-get install -y git build-essential python3-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Чистим хвосты
RUN rm -f requirements.txt

# Ставим по очереди. Если на какой-то строке упадет — мы узнаем виновника
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir flask
RUN pip install --no-cache-dir tgcrypto
RUN pip install --no-cache-dir pyrogram==2.0.106
RUN pip install --no-cache-dir py-tgcalls

CMD ["python", "main.py"]
