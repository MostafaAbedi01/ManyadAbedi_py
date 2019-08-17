FROM ubuntu:16.04
ENV TZ=Asia/Tehran
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

RUN apt-get update
# adding custom MS repository
RUN apt-get install -y software-properties-common nano \
					   curl apt-transport-https debconf-utils locales tzdata



# install Python 3.6
RUN apt-get install -y build-essential python3-pip


RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && echo "LANG=en_US.UTF-8" > /etc/locale.conf && locale-gen en_US.UTF-8
#    && rm -rf /var/lib/apt/lists/*

COPY ./ /app
WORKDIR app
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

EXPOSE 1397
CMD ["python3", "manage.py", "collectstatic"]
CMD ["python3", "manage.py", "runserver", "0.0.0.0:1397"]

