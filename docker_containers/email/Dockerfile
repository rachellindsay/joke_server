FROM python:3.12.1-bookworm

WORKDIR /usr/src/app
# requirements.txt is a list of items to be installed by pip when using pip install
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "send_email.py"]
