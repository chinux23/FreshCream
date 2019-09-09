FROM tiangolo/uvicorn-gunicorn:python3.7

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app

ENV PORT 80

ENTRYPOINT uvicorn --proxy-headers --host 0.0.0.0 --port ${PORT} main:app
