# syntax=docker/dockerfile:1

FROM python:3.14.0a1-alpine3.20

WORKDIR hello_world

COPY hello-world-requirements.txt hello-world-requirements.txt
RUN pip3 install --upgrade pip && pip install --no-cache-dir -r hello-world-requirements.txt
COPY hello_world.py .
COPY hello_world.config .
EXPOSE 5000
CMD [ "python3", "-m" , "flask", "--app", "hello_world", "run", "--host=0.0.0.0", "--port=5000"]
