對話訓練平台專案說明

專案功能：
NLU王道對話訓練系統，採用對接Azure CLU訓練出個人專屬的Q&A對話機器人。輸入語句透過CLU取得相關意圖後，從回應規則裡隨機輸出一個針對意圖的回答。



####波點更新內容及更新流程:

------資料庫重整

0. mysql 資料表的檔案取代伺服器端的資料表

------中界層檢查權限

0. 新增檔案:Accounts.middleware 
1. 於urls.py需使用中界層之頁面加入 RoleMiddleware()
eg: path('manage/', RoleMiddleware(Accounts.views.AccountManageView.as_view()), name="manage"),

------API request次數限制

0. 安裝rest_framework'
1. setting.py 增加下方程式:
REST_FRAMEWORK = {
    'DEFAULT_THROTTLE_CLASSES': (
        'rest_framework.throttling.AnonRateThrottle',
    ),
    'DEFAULT_THROTTLE_RATES': {
        'anon': '5/second  ',
    }
}
2. view.py 當中加入下方程式:
from rest_framework.throttling import AnonRateThrottle
from rest_framework.decorators import api_view
3. 於使用之class 加入下方程式:
throttle_classes = [AnonRateThrottle]
4. 於使用之def 加入下方程式:
@api_view(['GET'])<---依照方式更改

####Ray更新內容及更新流程_20230725:

資料庫部份：

0. 將閒聊型的相關資料庫備份後移除出現有的資料庫
1. 針對登入、方案、帳號權限、app等相關資訊，調整或新增資料表

前端部份：

0. 增加各網頁顯示全域的變數title和歡迎詞
1. 修改優化各網頁，減少不必要的網頁，盡量統整於一個HTML檔中
2. 調整各網頁搭配資料庫的資料後的顯示內容
3. 增加左側導欄頁"任務報告"的功能，並解決其在不同使用者中會出現衝突的Bug
4. 增加忘記密碼和註冊完成後，驗證信的回應報告頁面，也增加修改密碼的頁面

後端部份：

0. 修改app.views程式碼，調整及刪除不必要功能，把部份功能函式轉移至app.tools
1. 根據各前端所需顯示頁面，調整後端程式碼
2. 驗證信寄出功能，token夾帶時間憑證和secret key增加其安全性
