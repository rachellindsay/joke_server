from flask import Flask
# import mysql.connector
# import json
import gunicorn
from werkzeug.middleware.proxy_fix import ProxyFix

app = Flask(__name__)

app.wsgi_app = ProxyFix(
    app.wsgi_app, x_for=1, x_proto=1, x_host=1, x_prefix=1
)

@app.route("/flask/hello")
def index():
  return "Hello World"

# @app.get("/flask/getStats")
# def getStats():
#   try:
#     with mysql.connector.connect(
#       host="db",
#       user="root",
#       password="example",
#       database="stats_db"
#     ) as connection:
#       get_stats = """
#       SELECT COUNT (*)
#       FROM jokes_told
#       WHERE category = cat;
#       """
        
#       with connection.cursor() as cursor:
#           cursor.executemany(get_stats)
#           result = cursor.fetchall()
#           print(result)
            
#   except mysql.connector.Error as e:
    # print(e)

if __name__ == "__main__":
  app.run