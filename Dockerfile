FROM python:latest
WORKDIR /app
COPY . /app
COPY ./requirements.txt ./requirements.txt
RUN pip install --upgrade pip && pip install -r ./requirements.txt
EXPOSE 6565
CMD ["uvicorn", "main:app", "--host", "127.0.0.1", "--port", "6565"]
#CMD ["uvicorn", "app.main:app", "--uds", "/run/crawler/crawler.sock"]
