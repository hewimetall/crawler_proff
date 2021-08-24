FROM public.ecr.aws/lambda/python:3.8

COPY ./ ./app
COPY ./requirements.txt ./requirements.txt
RUN pip install --upgrade pip
RUN pip install -r ./requirements.txt
CMD ["main.app.handler"]