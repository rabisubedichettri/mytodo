# base image
FROM alpine:3.14

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# create source code direcetoruy
RUN mkdir /code

# set work directory
WORKDIR /code

COPY . /code
RUN apk add py3-pip

# install dependencies
RUN pip3 install --upgrade pip 
RUN pip3 install -r requirements.txt

EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]