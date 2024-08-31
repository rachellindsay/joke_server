import receive_logs
from flask import Flask, jsonify
import mysql.connector
import json
import gunicorn
from werkzeug.middleware.proxy_fix import ProxyFix
import threading



# receive_logs.startConsumerThreads()
rabbitThread = threading.Thread(target=receive_logs.startConsumerThreads)
rabbitThread.start()

app = Flask(__name__)

app.wsgi_app = ProxyFix(
    app.wsgi_app, x_for=1, x_proto=1, x_host=1, x_prefix=1
)

@app.route("/stats/hello")
def index():
  print("Hello called")
  return "Hello World"

@app.get("/stats/getStats")
def getStats():
 
  print("getStats called")
  
  try:
    with mysql.connector.connect(
      host="db",
      user="root",
      password="example",
      database="stats_db"
    ) as connection:
      get_cat_stats = """
      SELECT COUNT(*) AS cat_jokes_told, DATE(time_stamp) as date_told
      FROM jokes_told
      WHERE category = 'cat'
      GROUP BY DATE(time_stamp) DESC
      """
      # jokes told by category by date for the last month (when, joke_id, logged_in, category)
      #   count
      #   category
      #   date
      # jokes submitted by date (by category) for the last month (when, who, category)
      # jokes told by date to logged in user, not logged in user
      #   
      
        
      with connection.cursor(dictionary=True) as cursor:
          cursor.execute(get_cat_stats, ())
          result = cursor.fetchall()
          return jsonify(result)
            
  except mysql.connector.Error as e:
    print(e)

# @app.get("/stats/getStatsByCategory")
# def getStatsByCategory(category):
 
#   print("getStatsByCategory called")
  
#   try:
#     with mysql.connector.connect(
#       host="db",
#       user="root",
#       password="example",
#       database="stats_db"
#     ) as connection:
#       get_stats_by_category = """
#       SELECT COUNT(*) AS jokes_told_by_category
#       FROM jokes_told
#       WHERE category = %s     
#       """
#       cat = (category, )
      
#       with connection.cursor(dictionary=True) as cursor:
#           cursor.execute(get_stats_by_category, cat);
#           result = cursor.fetchall()
#           return jsonify(result)
            
  # except mysql.connector.Error as e:
  #   print(e)

@app.get("/stats/getJokesToldTodayStats")
def getJokesToldTodayStats():
 
  print("getJokesToldTodayStats called")
  
  try:
    with mysql.connector.connect(
      host="db",
      user="root",
      password="example",
      database="stats_db"
    ) as connection:
      get_told_today_stats = """
      SELECT COUNT(*)
      FROM jokes_told
      WHERE DATE(time_stamp) = CURDATE();
      """
      
      with connection.cursor() as cursor:
          cursor.execute(get_told_today_stats, ())
          result = cursor.fetchall()
          return json.dumps(result)
            
  except mysql.connector.Error as e:
    print(e)

@app.get("/stats/getJokesToldByDate")
def getJokesToldByDate():
 
  print("getJokesToldByDate called")
  
  try:
    with mysql.connector.connect(
      host="db",
      user="root",
      password="example",
      database="stats_db"
    ) as connection:
      get_told_by_date = """
      SELECT COUNT(*) AS number_told, DATE(time_stamp) AS date_told
      FROM jokes_told
      GROUP BY DATE(time_stamp);
      """
      
      with connection.cursor() as cursor:
          cursor.execute(get_told_by_date, ())
          result = cursor.fetchall()
          return result
            
  except mysql.connector.Error as e:
    print(e)  

# if __name__ == "__main__":
#   app.run
  