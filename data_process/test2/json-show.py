import json
import pprint
json_data = None
with open('output.jsonl', 'r') as f:
    data = f.read()
    json_data = json.loads(data)
# print(json_data)
pprint.pprint(json_data)
# json_formatted_str = json.dumps(json_data, indent=2)
# print(json_formatted_str)
# data = { "response": [ {"name" : "fred"}, {"name" : "tom"}]} # data is a dictionary
# data = json_data
# arr = data['response'] # arr is a list of dictionaries
# arr = data # arr is a list of dictionaries
# for i in arr:
# for i in data:
#     print('name', i['name']) # lookup the name value from each sub-dictionary
