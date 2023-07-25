import os,openpyxl,re,numpy as np,datetime,time
from collections import Counter
from text2vec import Word2Vec
from hanziconv import HanziConv
from random import *
from .CluAPI import *
from Apps.models import Apps

word2ver_model = Word2Vec("w2v-light-tencent-chinese")
gate_clu = 0.99
gate_w2v = 0.9

def similar_compare(q1,list_q2):
    x = word2ver_model.encode(HanziConv.toSimplified(q1))
    score = 0.0
    for i in list_q2:
        y = word2ver_model.encode(HanziConv.toSimplified(i)).reshape(200, 1)
        temp_score = np.dot(x, y) / (np.linalg.norm(x) * np.linalg.norm(y))
        score = score + temp_score
    score = score / len(list_q2)
    return score


def SaveQAHistory(app_id, result, create_time):
    file_dir = './QAHistory/'
    if not os.path.isdir(file_dir):
        os.mkdir(file_dir)
    file_path = f"{file_dir}{app_id}-{create_time}.json"
    old_list = ReadQAHistory(file_path)
    old_list.append(result)
    app = Apps.objects.filter(app_name=app_id.split('-')[-1], ac=app_id.split('-')[0]).first()
    app.counter = app.counter + 1
    app.save(update_fields=['counter'])
    print(f'=====================    呼叫次數：{len(old_list)}    =======================')
    json_list = json.loads(str(old_list).replace("'", '"'))
    with open(file_path, 'w', encoding="utf-8") as file:
        json.dump(json_list, file, ensure_ascii=False, indent=3)


def ReadQAHistory(file_path):
    if os.path.exists(file_path):
        file_content = open(file_path, 'r',encoding="utf-8").read()
        if len(file_content) < 1:
            return []
        with open(file_path, 'r',encoding="utf-8") as output:
            return json.load(output)
    else:
        return []


def excel_to_json(excel, user_id, app_name, desc, base):
    """
    Excel轉Json
    """
    path = f'./config/{user_id}_{app_name}/'
    if not os.path.exists(path):
        os.makedirs(path)
    entity_sheet_list = []
    utterance_sheet_list = []
    ans_sheet_list = []
    wb = openpyxl.load_workbook(excel)
    try:
        entity_sheet = wb["Entity"]
        utterance_sheet = wb["Utterance"]
        ans_sheet = wb["Ans"]
    except KeyError:
        return -1, [], []
    entity_sheet_list.append(entity_sheet)
    utterance_sheet_list.append(utterance_sheet)
    ans_sheet_list.append(ans_sheet)
    if int(base) > 0:
        be = openpyxl.load_workbook(f'{path}base.xlsx')
        be_entity_sheet = be["Entity"]
        be_utterance_sheet = be["Utterance"]
        be_ans_sheet = be["Ans"]
        entity_sheet_list.append(be_entity_sheet)
        utterance_sheet_list.append(be_utterance_sheet)
        ans_sheet_list.append(be_ans_sheet)
    intent_set = set()
    ans_intent_set = set()
    intent_utterance_list = []
    intent_json_list = []
    utterance_data = []
    entity_list = []
    entity_json_list = []
    ans_json_list = []
    intent_data = []
    entity_data = []
    entity_check = []
    utterance_set = set()

    #   處理entity標籤頁
    for sheet in entity_sheet_list:
        for entity_col in sheet.iter_cols(min_row=2):
            for cell in entity_col:
                if str(cell.value) != 'None':
                    entity_list.append(str(cell.value))
        counted = Counter(entity_list)
        same_enitiy = [x for x in counted if counted[x] > 1]
        if len(same_enitiy) > 0:
            return -2, same_enitiy, []
        for entity_col in sheet.iter_cols():
            col_data = []
            for cell in entity_col:
                if str(cell.value) != 'None':
                    col_data.append(str(cell.value).lower())
            if len(col_data) > 0:
                temp = {
                    "category": str(col_data[0]),
                    "compositionSetting": "combineComponents"
                }
                if temp not in entity_data:
                    entity_data.append(temp)
                    data = {'name': str(col_data[0])}
                    col_data.pop(0)
                    data.update({'key': col_data})
                    entity_check.append(data)
                else:
                    for i in entity_check:
                        if col_data[0] == i['name']:
                            for j in col_data:
                                if j not in i['key']:
                                    i['key'].append(j)

    #   處理utterance標籤頁
    for sheet in utterance_sheet_list:
        for row in sheet.rows:
            intent = str(row[0].value).strip().lower()
            TempString = re.sub("[？?]", "", str(row[1].value).lower())
            WordList = []
            utterance = ""

            #   將字串進行預處理
            for i in range(len(TempString)):
                try:
                    if i == len(TempString) - 1:
                        WordList.append(TempString[i])
                    if TempString[i] in " ":
                        if (('\u0041' <= TempString[i - 1] <= u'\u005a') or (
                                '\u0061' <= TempString[i - 1] <= u'\u007a')):
                            WordList.append(TempString[i])
                        elif ('\u4e00' <= TempString[i + 1] <= '\u9fa5') or (TempString[i + 1] in " "):
                            pass
                        else:
                            WordList.append(TempString[i])
                    elif ('\u4e00' <= TempString[i] <= '\u9fa5') and (
                            ('\u0041' <= TempString[i + 1] <= u'\u005a') or (
                            '\u0061' <= TempString[i + 1] <= u'\u007a')):
                        WordList.append(TempString[i])
                        WordList.append(" ")
                    elif (('\u0041' <= TempString[i] <= u'\u005a') or ('\u0061' <= TempString[i] <= u'\u007a')) and (
                            '\u4e00' <= TempString[i + 1] <= '\u9fa5'):
                        WordList.append(TempString[i])
                        WordList.append(" ")

                    else:
                        WordList.append(TempString[i])
                except IndexError:
                    pass
            for j in WordList:
                utterance = utterance + j
            temp_list = []

            if utterance not in utterance_set:
                if utterance not in "none":
                    utterance_json = {"text": utterance, "intent": intent}
                    for entity in entity_check:
                        for key in entity['key']:
                            match = re.search(key, utterance)
                            if match is not None:
                                start = match.start()
                                end = match.end() - 1
                                s = entity['name'] + "," + str(start) + "," + str(end)
                                if len(temp_list) == 0:
                                    temp_list.append(s)
                                elif s not in temp_list:
                                    temp_list.append(s)
                    if len(temp_list) > 1:
                        for i in range(len(temp_list)):
                            for j in range(i + 1, len(temp_list)):
                                try:
                                    if temp_list[i].split(",")[1] == temp_list[j].split(",")[1]:
                                        if temp_list[i].split(",")[2] > temp_list[j].split(",")[2]:
                                            temp_list.pop(j)
                                        elif temp_list[i].split(",")[2] < temp_list[j].split(",")[2]:
                                            temp_list.pop(i)
                                except IndexError:
                                    pass
                                try:
                                    if temp_list[i].split(",")[2] == temp_list[j].split(",")[2]:
                                        if temp_list[i].split(",")[1] > temp_list[j].split(",")[1]:
                                            temp_list.pop(i)
                                        elif temp_list[i].split(",")[1] < temp_list[j].split(",")[1]:
                                            temp_list.pop(j)
                                except IndexError:
                                    pass
                                try:
                                    if temp_list[i].split(",")[1] == temp_list[j].split(",")[2]:
                                        temp_list.pop(i)
                                except IndexError:
                                    pass
                    json_list = []
                    for j in range(len(temp_list)):
                        temp = {
                            "category": temp_list[j].split(",")[0],
                            "offset": int(temp_list[j].split(",")[1]),
                            "length": int(temp_list[j].split(",")[2]) - int(temp_list[j].split(",")[1]) + 1,
                        }
                        json_list.append(temp)
                    utterance_json.update({"entities": json_list})
                    utterance_data.append(utterance_json)
                    utterance_set.add(utterance)

            #   處理entity.json
            entity_temp_list = []
            for i in utterance_json["entities"]:
                if len(entity_list) == 0:
                    entity_list.append(i["category"])
                entity_temp_list.append(utterance_json["text"])
                if len(entity_json_list) == 0:
                    temp = {
                        "name": i["category"],
                        "utterance": entity_temp_list
                    }
                    entity_json_list.append(temp)
                    entity_temp_list = []
                elif len(entity_json_list) > 0:
                    if i["category"] in entity_list:
                        for j in range(len(entity_json_list)):
                            if i["category"] in entity_json_list[j]["name"]:
                                if utterance_json["text"] not in entity_json_list[j]["utterance"]:
                                    entity_json_list[j]["utterance"].append(utterance_json["text"])
                    if i["category"] not in entity_list:
                        temp = {
                            "name": i["category"],
                            "utterance": entity_temp_list
                        }
                        entity_json_list.append(temp)
                        entity_list.append(i["category"])
                entity_temp_list = []

            #   處理intent.json
            if len(intent_json_list) == 0:
                intent_utterance_list.append(utterance)
                intent_set.add(intent)
                temp = {"category": "None", "category": intent}
                temp_json = {"name": "None", "utterance": []}
                intent_data.append(temp)
                intent_json_list.append(temp_json)
                intent_json_list.append({'name': intent, 'utterance': intent_utterance_list})
            else:
                if intent in intent_set:
                    for j in range(len(intent_json_list)):
                        if intent_json_list[j]['name'] == intent:
                            if utterance not in intent_json_list[j]['utterance']:
                                intent_json_list[j]['utterance'].append(utterance)
                else:
                    if intent not in "none":
                        intent_set.add(intent)
                        intent_utterance_list = []
                        temp = {"category": intent}
                        intent_data.append(temp)
                        intent_utterance_list.append(utterance)
                        intent_json_list.append({'name': intent, 'utterance': intent_utterance_list})

    #   處理ans標籤頁
    for sheet in ans_sheet_list:
        for row in sheet.rows:
            temp = []
            json_temp = {}
            for c in list(row):
                temp.append(str(c.value))
            intent = temp.pop(0)
            temp = list(filter(lambda x: x != "None", temp))
            if intent not in ans_intent_set:
                if intent in "None":
                    ans_intent_set.add(str(intent).strip())
                else:
                    ans_intent_set.add(str(intent).strip().lower())
                json_temp = {"name": intent, "ans": temp}
                ans_json_list.append(json_temp)
            else:
                for i in range(len(ans_json_list)):
                    if ans_json_list[i]['name'] == intent:
                        temp = list(set(ans_json_list[i]['ans']) | set(temp))
                        json_temp = {"name": intent, "ans": temp}
                        ans_json_list[i].update(json_temp)

    # 找出各自缺少的元素
    missing_elements_intent_list = list(intent_set - ans_intent_set)
    missing_elements_ans_intent_list = list(ans_intent_set - intent_set)

    # 输出结果
    if len(missing_elements_intent_list) > 0:
        print("ans_intent_list缺少元素: ", missing_elements_intent_list)
    else:
        print("ans_intent_list没有缺失元素")
    missing_elements_ans_intent_list.remove("None")
    if len(missing_elements_ans_intent_list) > 0:
        print("intent_list缺少元素: ", missing_elements_ans_intent_list)
    else:
        print("intent_list没有缺失元素")

    #   存json檔
    projectName = f'{user_id}-{app_name}'
    data_json = {
        "projectFileVersion": "2023-04-15-preview",
        "stringIndexType": "Utf16CodeUnit",
        "metadata": {
            "projectKind": "Conversation",
            "projectName": projectName,
            "multilingual": True,
            "description": desc,
            "language": "zh-hant"
        },
        "assets": {
            "projectKind": "Conversation",
            "intents": intent_data,
            "entities": entity_data,
            "utterances": utterance_data
        }
    }
    with open(f'{path}import.json', 'w', encoding='utf-8') as f:
        json.dump(data_json, f, ensure_ascii=False, indent=3)
    with open(f'{path}temp_intent.json', 'w', encoding='utf-8') as f:
        json.dump(intent_json_list, f, ensure_ascii=False, indent=3)
    with open(f'{path}temp_entity.json', 'w', encoding='utf-8') as f:
        json.dump(entity_json_list, f, ensure_ascii=False, indent=3)
    with open(f'{path}temp_ans.json', 'w', encoding='utf-8') as f:
        json.dump(ans_json_list, f, ensure_ascii=False, indent=3)
    return len(utterance_data), missing_elements_intent_list, missing_elements_ans_intent_list


def redefine_utter(user_id, app_name):
    """
        重新定義語句
        """
    uttr_list = []
    new_utter_list = []
    s = -1
    file = f'./config/{user_id}_{app_name}/import.json'
    with open(file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    for i in data["assets"]["utterances"]:
        i["entities"] = sorted(i["entities"], key=lambda x: x["offset"])
        for k, j in enumerate(i["entities"]):
            if j["offset"] != 0 and s < 0:
                temp = {"category": None, "part_text": i["text"][0:j["offset"]]}
                uttr_list.append(temp)
                s = j["offset"] + j["length"]
                temp = {"category": j["category"], "part_text": i["text"][j["offset"]:s]}
                uttr_list.append(temp)
            else:
                if j["offset"] != s and s > 0 and j["offset"] >= s:
                    temp = {"category": None, "part_text": i["text"][s:j["offset"]]}
                    uttr_list.append(temp)
                    s = j["offset"] + j["length"]
                    temp = {"category": j["category"], "part_text": i["text"][j["offset"]:s]}
                    uttr_list.append(temp)
                    if s != len(i["text"]) and k == len(i["entities"]) - 1:
                        temp = {"category": None, "part_text": i["text"][s:]}
                        uttr_list.append(temp)
                else:
                    if j["offset"] >= s:
                        s = j["offset"] + j["length"]
                        temp = {"category": j["category"], "part_text": i["text"][j["offset"]:s]}
                        uttr_list.append(temp)
                        if s != len(i["text"]) and k == len(i["entities"]) - 1:
                            temp = {"category": None, "part_text": i["text"][s:]}
                            uttr_list.append(temp)
                    elif k == len(i["entities"]) - 1 and j["offset"] != s:
                        temp = {"category": None, "part_text": i["text"][s:]}
                        uttr_list.append(temp)
        if len(uttr_list) == 0:
            temp = {"category": None, "part_text": i["text"]}
            uttr_list.append(temp)
        # print(uttr_list)
        new_temp = {"intent": i["intent"], "utterance": uttr_list}
        new_utter_list.append(new_temp)
        uttr_list = []
        s = -1
    uttr_file = f'./config/{user_id}_{app_name}/utterance.json'
    with open(uttr_file, 'w', encoding='utf-8') as f:
        json.dump(new_utter_list, f, ensure_ascii=False, indent=3)


def check_qnot(s):
    """
    處理單、雙引號
    """
    s = s.replace("'","%20")
    s = s.replace('"', '%21')
    return s


def check_similar(q, app_id, intent):
    config_id = app_id.replace('-','_')
    with open( f'./config/{config_id}/intent.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
        for i in data:
            if i['name'] in intent:
                similar_list = sample(i['utterance'], 2)
                score = similar_compare(q,similar_list)
                print(q, similar_list)
                print(score)
                return score


def predictCLU(time_start ,app_id, deploy_name, q):
    res = predictApp(app_id, deploy_name, q)
    print(str(round((time.time() - time_start), 2)))
    if res.status_code == 200:
        clu_json = json.loads(res.text)
        top_score = clu_json['result']['prediction']['intents'][0]['confidenceScore']
        if top_score < gate_clu:
            top_intent = clu_intent = "None"
        else:
            clu_intent = clu_json['result']['prediction']['topIntent']
            similar_score = check_similar(q, app_id, clu_intent)
            if top_score > gate_w2v:
                top_intent = clu_intent
            elif similar_score > gate_w2v:
                top_intent = clu_intent
            else:
                top_intent = "None"
        print(str(round((time.time() - time_start), 2)))
        entities = clu_json['result']['prediction']['entities']
        entities_data = []
        for i in entities:
            entity = i['text']
            entity_category = i['category']
            entities_data.append({
                'entity': entity,
                'entity_category': entity_category
            })
        new_app_id = app_id.replace("-","_")
        ans_json = f'./config/{new_app_id}/ans.json'
        if not os.path.isfile(ans_json):
            ans = '找不到任何意圖回應檔!'
        else:
            with open(f'{ans_json}', 'r', encoding='utf-8') as f:
                data = json.load(f)
            for i in data:
                if i['name'] in top_intent:
                    ans = choice(i['ans'])
                    break
                else:
                    ans = "回應檔中找不到相關意圖"
        run_time = str(round((time.time() - time_start), 2))
        time_start = datetime.datetime.fromtimestamp(time_start).strftime("%Y-%m-%d %H:%M:%S")
        result = {
            'q': check_qnot(q),
            'clu_intent':clu_intent,
            'intent': check_qnot(top_intent),
            'score': str(top_score)[:4],
            'ans': check_qnot(ans),
            'entities': entities_data,
            'run_time': f"{run_time} 秒",
            'ask_time': time_start
        }
        # print("LUIS result:\n", json.dumps(result, indent=4, ensure_ascii=False))
        res = getAppInfo(app_id.split("-")[0],app_id.split("-")[1])
        dt = datetime.datetime.strptime(res['createdDateTime'], "%Y-%m-%dT%H:%M:%SZ")
        create_time = str((dt + datetime.timedelta(hours=8)).strftime("%Y%m%d%H%M"))[2:]
        SaveQAHistory(app_id, result, create_time)
        return result
    else:
        time_start = datetime.datetime.fromtimestamp(time_start).strftime("%Y-%m-%d %H:%M:%S")
        result = {
            'ans': 'error',
            'ask_time': time_start
        }
        return result