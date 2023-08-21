FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    nginx

COPY . /basic-flask-app
WORKDIR /app
COPY requirements.txt /app
RUN pip3 install -r requirements.txt

COPY nginx.conf /etc/nginx/sites-available/python-app
EXPOSE 80
CMD service nginx start && python3 app.py


