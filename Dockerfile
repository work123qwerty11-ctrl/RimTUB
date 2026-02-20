FROM python:3.10-slim
WORKDIR /app
COPY . .
RUN rm requirements.txt
RUN pip install --no-cache-dir pyrogram tgcrypto flask tg-crypto-mod py-tgcalls[tgcrypto]
CMD ["python", "main.py"]
