FROM ubuntu

WORKDIR /

COPY . .

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt install -y python3-pip 
RUN pip install --upgrade pip
RUN pip install wheel gunicorn
RUN pip install -r req.txt


ENV SECRET_KEY=imcwd#l$k21^_jq-#xva&6klhujblaa8u9k#!ia*!le6c-+@^%
ENV DB_NAME=railway
ENV DB_USER=postgres
ENV DB_PASSWORD=wk1naQqfIp2nu1TpSGvg
ENV DB_HOST=containers-us-west-87.railway.app
ENV DB_PORT=7424
ENV DEBUG=1
ENV ALLOWED_HOSTS=127.0.0.1,

CMD gunicorn --bin 0.0.0.0:8000 config.wsgi:application



