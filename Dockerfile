FROM ubuntu:16.04

RUN apt-get update

# install Python 3.6
RUN apt-get install -y build-essential python3-pip


COPY ./app /app
WORKDIR app
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

EXPOSE 9000
CMD ["python3", "manage.py", "collectstatic"]
CMD ["python3", "manage.py", "runserver", "0.0.0.0:9000"]