FROM public.ecr.aws/lambda/python:3.8
WORKDIR /app
COPY . ./app
COPY ./requirements.txt ./requirements.txt
RUN pip install --upgrade pip
RUN pip install -r ./requirements.txt
EXPOSE 5000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "443"]