FROM python:3.12.1-bookworm

WORKDIR /usr/src/app

# Prevents Python from buttering stdout and stderr (equivalent to 'python -u' option)
# ENV PYTHONUNBUFFERED 1
# requirements.txt is a list of items to be installed by pip when using pip install
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 4000

CMD ["gunicorn", "--bind", "0.0.0.0:4000", "app:app"]