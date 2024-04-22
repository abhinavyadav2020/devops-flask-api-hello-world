FROM python:3.8-slim-buster
RUN mkdir pong
WORKDIR /pong
COPY * /pong
RUN pip3 install -r requirements.txt
CMD ["python3", "hello.py"]  
