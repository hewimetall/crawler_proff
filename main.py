import json
import re
from collections import Counter
from typing import Optional
from fastapi import FastAPI,Header,Response
import uvicorn

from template import template


def check(ua:str):
    with open('crawler-user-agents.json') as f:
        json_data = json.load(f)
    
    for entry in json_data:
        if re.search(entry['pattern'], ua):
            if re.search(r'\woogle',entry['pattern']):
                return False
            elif re.search(r'\wandex',entry['pattern']):
                return True


app = FastAPI()

@app.get("/{all_path:path}")
def read_root(all_path:str,user_agent: Optional[str] = Header(None)):
    status_code = 429
    if check(user_agent):
        status_code = 429
    else:
        status_code = 503
    return Response(content=template, media_type="text/html",status_code=status_code)

