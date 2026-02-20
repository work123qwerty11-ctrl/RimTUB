FROM python:3.10-slim
WORKDIR /app
COPY . .
# Устанавливаем всё вручную, игнорируя зависимости и хэши
RUN pip install --no-cache-dir pyrogram tgcrypto flask
RUN pip install --no-cache-dir --no-deps -r requirements.txt
CMD ["python", "main.py"]
