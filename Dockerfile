# 以`python3.7` 為基礎映像
FROM python:3.7

# 建立工作目錄
RUN mkdir /app

# 目前目錄位置/app
WORKDIR /app

# 程式碼加入/app
ADD . /app

# pip安裝依賴包
RUN pip install -r requirements.txt

# 暴露端口
EXPOSE 5500

# 啟動指令
CMD python3 /app/manage.py runserver 0.0.0.0:5500