FROM python:3.12.1-bookworm

WORKDIR /usr/src/app

ENV PYTHONUNBUFFERED 1


# install Python dependencies located in requirements file
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD gunicorn --bind 0.0.0.0:4000 app:app