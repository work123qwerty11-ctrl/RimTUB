import asyncio
import logging, coloredlogs
import os
from sys import argv

# Настройка логирования
logger = logging.getLogger('RimTUB')

# Импортируем конфиги
try:
    from config import API_ID, API_HASH, PHONES, PLAY_SOUND, BOT_TOKEN, LOGGING_LEVEL
except ImportError:
    # Заглушка, если конфиг не подтянулся
    API_ID, API_HASH, PHONES, PLAY_SOUND, BOT_TOKEN, LOGGING_LEVEL = None, None, [], False, None, 20

logger.setLevel(LOGGING_LEVEL or 20)
coloredlogs.install(logger=logger, level=logger.level,
    fmt='%(asctime)s %(name)s %(levelname)s: %(message)s'
)

if __name__ == '__main__':
    logger.info("Запускаюсь...")

from pyrogram import idle
from pyrogram.enums.parse_mode import ParseMode
from utils import get_script_directory, ModifyPyrogramClient
from telebot.async_telebot import AsyncTeleBot 

version = '1.7'
clients = []

def start():
    # Проверка BOT_TOKEN перед запуском
    if not BOT_TOKEN or ":" not in BOT_TOKEN:
        logger.error("ОШИБКА: BOT_TOKEN не установлен или неверный в Variables Railway!")
        return

    bot = AsyncTeleBot(BOT_TOKEN, 'html')
    
    # Запуск polling в отдельном таске
    loop = asyncio.get_event_loop()
    loop.create_task(bot.polling(none_stop=True))
    
    for i, PHONE in enumerate(PHONES):
        account_logger = logging.getLogger(f'RimTUB [{i}]')
        account_logger.setLevel(LOGGING_LEVEL or 20)
        coloredlogs.install(logger=account_logger, level=logger.level,
            fmt='%(asctime)s %(name)s %(levelname)s: %(message)s'
        )
        
        # ВАЖНО: Мы меняем имя сессии на RimTUB_v2_new, чтобы убить ошибку sqlite3
        session_name = f"RimTUB_v2_new_{i}"
        
        cl = ModifyPyrogramClient(
            name=session_name,
            api_id=API_ID,
            api_hash=API_HASH,
            phone_number=PHONE,
            app_version="1.7",
            lang_code="ru",
            plugins=dict(root='plugins'),
            workdir=get_script_directory(),
            hide_password=True,
            parse_mode=ParseMode.HTML,
            sleep_threshold=30,
            num=i,
            logger=account_logger,
            bot=bot
        )

        try:
            cl.start()
            clients.append(cl)
        except Exception as e:
            logger.error(f"Не удалось запустить клиент {i}: {e}")

    logger.info("\n\n- RimTUB Запущен и готов к работе! -\n")

    try:
        idle()
    finally:
        for cl in clients:
            cl.stop()

if __name__ == '__main__':
    start()
