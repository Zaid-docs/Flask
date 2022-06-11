FROM FROM nikolaik/python-nodejs:python3.9-nodejs18
ARG DEBIAN_FRONTEND=noninteractive 
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git curl python3-pip ffmpeg -y
RUN pip3 install -U pip
RUN python3 -m pip install --upgrade pip
ARG USER=root
USER $USER
RUN python3 -m venv venv
WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt
COPY start.sh start.sh
COPY app.py app.py

EXPOSE 5000
RUN chmod +x /app/start.sh
ENTRYPOINT ["./start.sh"]
