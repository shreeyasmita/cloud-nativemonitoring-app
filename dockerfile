FROM python:3.10-slim-bullseye

WORKDIR /app


COPY requirements.txt .
RUN apt-get update && apt-get install -y gcc python3-dev
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .


ENV FLASK_APP=monitoring.py
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000", "--no-debugger", "--no-reload"]
