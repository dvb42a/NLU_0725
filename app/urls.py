from django.urls import path
import app.views

app_name = "app"

# 頁面
urlpatterns = [
    # Apps 列表頁面
    path('', app.views.Dashboard.as_view(), name="dashboard"),
    # 任務 App 詳細資訊頁面
    path('manage/info/', app.views.app_info_view, name="manage_info"),
    # 任務意圖列表頁面
    path('task/build/intent/', app.views.app_intent, name="intent"),
    # 任務意圖語句列表頁面
    path('task/build/intent/utterance/', app.views.intent_utterance, name="intent_utter"),
    # 任務關鍵字類別列表頁面
    path('task/build/entity/', app.views.app_entity, name="entity"),
    # 任務關鍵字類別語句列表頁面
    path('task/build/entity/utterance/', app.views.entity_utterance, name="entity_utter"),
    # 任務意圖回應列表頁面
    path('task/ans/rules/', app.views.ans_rules, name="rules"),
    # QA 測試聊天室頁面
    path('test/qa/chat/', app.views.TestQAPage.as_view(), name="test_chat"),
    # QA 對話紀錄
    path('test/qa/log/', app.views.qa_log, name="qa_log"),  # (v2.1)
    # 前端嵌入聊天室
    path('kingly/chatbox/', app.views.ChatBox.as_view()),
]

# 功能
urlpatterns += [
    # 任務 App 建立
    path('task/create/', app.views.creat_app, name="task_app_create"),
    # 任務 App 刪除
    path('task/delete/', app.views.delete_app, name="task_app_delete"),
    # 任務 App 訓練
    path('task/train/', app.views.train_app, name="train"),
    # 任務 App 訓練事件追蹤
    path('task/train/event/', app.views.train_event, name="train_event"),
    # 任務 APP 描述更新
    path('task/manage/info/update/appDescription/', app.views.update_app_description, name="info_update_app_desc"),
    # 任務 API 發布
    path('task/manage/info/publish/', app.views.app_publish, name="app_publish"),
    # 任務訓練語句匯入
    path('task/input/intent/utterance/', app.views.upload_excel2json, name="upload_excel_json"),
    # 任務基本包匯入
    path('task/input/intent/base/', app.views.upload_base2excel, name="upload_base_excel"),
    # 任務匯入檢查
    path('task/input/intent/checkbase/', app.views.check_base, name="check_base"),
    # 請求處理進度條
    path('app/show/progress/', app.views.show_progress, name="input_progress_bar"),
    # 平台頁面用 QA API
    path('test/api/getans/', app.views.send_q_to_bot, name="test_chat_api"),
]
