pip install openai
python.exe -m pip install --upgrade pip
npm install openai

# https://platform.openai.com/account/api-keys

curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -H "OpenAI-Organization: org-T3F41uC6UNDVS4jzsgNw9OS5"

# python
import os
import openai
openai.organization = "org-T3F41uC6UNDVS4jzsgNw9OS5"
openai.api_key = os.getenv("OPENAI_API_KEY")
openai.Model.list()

curl https://api.openai.com/v1/models -H "Authorization: Bearer APIKEY" -H "OpenAI-Organization: Personal"

curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer APIKEY" \
  -H "Content-Type: application/json" \

curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer APIKEY" \
  -d '{
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'

