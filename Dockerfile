FROM python:3.10.2

WORKDIR /usr/src

COPY requirements.txt .

RUN python -m venv venv

RUN venv/bin/pip install pip -U
RUN venv/bin/pip install --no-cache-dir -r requirements.txt

RUN apt-get update && apt-get -y install curl nano

COPY . .

# CMD ["/usr/src/venv/bin/uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]