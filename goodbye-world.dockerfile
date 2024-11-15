# syntax=docker/dockerfile:1

FROM python:3.14.0a1-alpine3.20

WORKDIR goodbye_world

COPY goodbye-world-requirements.txt goodbye-world-requirements.txt
RUN pip3 install --upgrade pip && pip install --no-cache-dir -r goodbye-world-requirements.txt
COPY goodbye_world.py .
COPY goodbye_world.config .
EXPOSE 5000
CMD [ "python3", "-m" , "flask", "--app", "goodbye_world", "run", "--host=0.0.0.0", "--port=5000"]
