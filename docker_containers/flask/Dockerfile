FROM python:3.12.1-bookworm

WORKDIR /usr/src/app

COPY . .
# install Python dependencies located in requirements file
RUN pip install --no-cache-dir -r requirements.txt

# EXPOSE 4000

# CMD [ "flask" , "run" ]
CMD gunicorn --bind 0.0.0.0:4000 app:app