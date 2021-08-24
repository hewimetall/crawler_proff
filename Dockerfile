FROM public.ecr.aws/lambda/python:3.8
WORKDIR /app
COPY . ./app
COPY ./requirements.txt ./requirements.txt
RUN pip install --upgrade pip && pip install -r ./requirements.txt
#CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "6565"]
CMD ["uvicorn", "main:app", "--uds", "/run/crawler.sock"]