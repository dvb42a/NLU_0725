##對話訓練平台專案說明
####壹、專案功能：
&emsp;&emsp;LUIS_NLU王道對話訓練系統，任務型採用對接Azure LUIS 訓練 NLU 推論。輸入語句透過 LUIS 取得推論結果後，從回應規則庫過濾出最符合的回應組隨機輸出。
<br/>&emsp;&emsp;閒聊型採用相似度比對，將訓練的語句模板(語意推論模板)與輸入語句相似度計算，選擇最相似(得分最高)意圖推論為結果，並結合語句特徵擷取：主詞(你、我、他...)、動詞、疑問句型判斷、情緒詞與關鍵字，依據上述資訊再從回應模板庫篩選出適合的模板合成後輸出。

####貳、部署指令檔：
1. build_docker.sh：<br/>將專案打包成 docker image 。
    ```
    $ sh build_docker.sh
    ```
2. run_docker.sh：<br/>執行 docker container 。
    ```
    $ sh run_docker.sh
    ```

####參、部署流程：
0. 請將此專案目錄放置於欲部署之主機再執行以下步驟。
1. 執行前，**請先確認腳本參數**。
2. 執行 build_docker.sh 建立專案docker image。
3. 執行 run_docker.sh 建立docker container。
4. 指令 `$ docker ps` 確認剛執行的container有列出在清單中表示執行成功。

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

