import requests
import json

api_url = 'https://kinglylang.cognitiveservices.azure.com/language/'
api_ver = 'api-version=2023-04-15-preview'
key = '072e11190f934d9ea87b0a4e3e713e69'
headers_del_get = {"Ocp-Apim-Subscription-Key": key}
headers_patch = {"Content-Type": "application/merge-patch+json","Ocp-Apim-Subscription-Key": key}
headers_post_put =  {"Content-Type":"application/json","Ocp-Apim-Subscription-Key": key}

def addApp(app_name,desc):
    """
    Patch: 新增 or 更新 App (只能更新description)
    """

    url = api_url + f'authoring/analyze-conversations/projects/{app_name}?' + api_ver
    data = {
        "projectKind": "conversation",
        "settings": {
            "confidenceThreshold": 0.0
        },
        "projectName": app_name,
        "multilingual": True,
        "description": desc,
        "language": "zh-hant"
    }
    res = requests.patch(url=url, data=json.dumps(data), headers=headers_patch)
    return res.status_code

def deleteApp(user_id,app_name):
    """
    Delete: 刪除App
    """

    url = api_url + f'authoring/analyze-conversations/projects/{user_id}-{app_name}?' + api_ver
    res = requests.delete(url=url, headers=headers_del_get)
    return res.status_code

def getAppsList():
    """
    GET: 獲取 CLU App列表
    """

    url = api_url + 'authoring/analyze-conversations/projects/?' + api_ver
    res = requests.get(url=url, headers=headers_del_get)
    return res.text

def getAppInfo(user_id,app_name):
    """
    GET: 獲取 App 資訊
    """

    url = api_url + f'authoring/analyze-conversations/projects/{user_id}-{app_name}?' + api_ver
    res = requests.get(url=url, headers=headers_del_get).json()
    return res

def importApp(user_id,app_name):
    """
    POST: 將excel轉換成的json檔import至CLU
    """

    url = api_url + f'authoring/analyze-conversations/projects/{user_id}-{app_name}/:import?' + api_ver
    with open(f'./config/{user_id}_{app_name}/import.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
    res = requests.post(url=url, data=json.dumps(data), headers=headers_post_put)
    return res.status_code

def trainApp(user_id,app_name,train_name):
    """
    POST: 訓練 App
    """

    url = api_url + f'authoring/analyze-conversations/projects/{user_id}-{app_name}/:train?' + api_ver
    data = {
      "modelLabel": train_name,
      "trainingConfigVersion": "2022-09-01",
      "trainingMode": "advanced",
      "evaluationOptions": {
        "kind": "percentage",
        "trainingSplitPercentage": 85,
        "testingSplitPercentage": 15
      }
    }
    res = requests.post(url=url, data=json.dumps(data), headers=headers_post_put)
    return res

def getTrainStatus(user_id,app_name):
    """
    GET: 獲取 App 訓練狀態
    """

    url = api_url + f'authoring/analyze-conversations/projects/{user_id}-{app_name}/train/jobs?' + api_ver
    res = requests.get(url=url, headers=headers_del_get).json()
    return res


def deployApp(user_id,app_name,train_name,deploy_name):
    """
    POST: 發佈 App
    """

    url = api_url + f'authoring/analyze-conversations/projects/{user_id}-{app_name}/deployments/{deploy_name}?' + api_ver
    data = {
      "trainedModelLabel": train_name
    }
    res = requests.put(url=url, data=json.dumps(data), headers=headers_post_put)
    return res

def deployInfo(user_id,app_name,deploy_name):
    """
    GET: 獲取 Deploy App 資訊
    """

    url = api_url + f'authoring/analyze-conversations/projects/{user_id}-{app_name}/deployments/{deploy_name}?' + api_ver
    res = requests.get(url=url, headers=headers_del_get).json()
    return res


def predictApp(id,deploy_name,q):
    """
    Post: 獲取 App Intent 預
    """

    url = api_url + f':analyze-conversations?' + api_ver
    data = {
              "kind": "Conversation",
              "analysisInput": {
                "conversationItem": {
                  "id": "1",
                  "participantId": "1",
                  "text": q,
                  "language": "zh-cn",
                  "modality": "text"
                }
              },
              "parameters":{
                "projectName": id,
                "deploymentName": deploy_name,
                "stringIndexType": "TextElement_V8"
              }
    }
    res = requests.post(url=url, data=json.dumps(data), headers=headers_post_put)
    return res


