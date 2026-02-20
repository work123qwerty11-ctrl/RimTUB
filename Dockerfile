FROM python:3.10-slim
WORKDIR /app
COPY . .

# Удаляем файл, который мешает жить
RUN rm requirements.txt

# Устанавливаем библиотеки вручную
RUN pip install --no-cache-dir pyrogram tgcrypto flask tg-crypto-mod py-tgcalls[tgcrypto]

# Если боту нужны еще какие-то библиотеки, добавь их названия через пробел выше

CMD ["python", "main.py"]
