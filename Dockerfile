FROM python:latest

COPY ./app /app
WORKDIR app
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

ENTRYPOINT [ "python3" ]
CMD ["manage.py"]
