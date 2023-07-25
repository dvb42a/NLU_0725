from random import Random
from django.utils import timezone
import hashlib
import time


# 生成隨機碼
def token_generate(length=12):
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    chars_len = len(chars) - 1
    random = Random()
    random_str = ''
    for i in range(length):
        random_str += chars[random.randint(0, chars_len)]

    create_token = str(timezone.now().strftime("%Y%m%dT%H%M%S_")) + random_str
    return create_token


def my_uuid(salt=""):
    m = hashlib.md5()
    data = str(time.time()) + str(salt)
    m.update(data.encode("utf-8"))
    h = m.hexdigest()
    return h
