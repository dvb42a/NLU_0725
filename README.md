##對話訓練平台專案說明

####壹、專案功能：
&emsp;&emsp;NLU王道對話訓練系統，任務型採用對接Azure CLU 訓練 NLU 推論。輸入語句透過 CLU 取得推論結果後，從回應規則庫過濾出最符合的回應組隨機輸出。

####貳、部署指令檔：

####參、部署流程：

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

