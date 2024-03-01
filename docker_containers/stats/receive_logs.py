import pika
import threading 
import json
import mysql.connector 

# exchanges: told, submitted

def threadTold():
  connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='rabbitmq'))
  channel = connection.channel()


  channel.exchange_declare(exchange='told', exchange_type='fanout')

  result = channel.queue_declare(queue='', exclusive=True)
  queue_name = result.method.queue
  channel.queue_bind(exchange='told', queue=queue_name)

  def callback(ch, method, properties, body):
    print(f" [told] {body.decode()}", flush=True)
    toldJoke = json.loads(body.decode())
    print(toldJoke)
    
    try:
      with mysql.connector.connect(
        host="db",
        user="root",
        password="example",
        database="stats_db"
    ) as connection:
        insert_told_joke = """
        INSERT INTO jokes_told
        (joke_id, logged_in, category)
        VALUES ( %s, %s, %s )
        """
        record = [
          (toldJoke['id'], toldJoke['isLoggedIn'],toldJoke['category'])
        ]
        with connection.cursor() as cursor:
          cursor.executemany(insert_told_joke, record)
          connection.commit()
    except mysql.connector.Error as e:
      print(e)
       

    # connect to db
    # 'jokes_told' table: joke_id, logged_in, category
    # 'jokes_submitted' table: when, who, category

  channel.basic_consume(
    queue=queue_name, on_message_callback=callback, auto_ack=True)
  
  channel.start_consuming()

def threadSubmitted():
  connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='rabbitmq'))
  channel = connection.channel()


  channel.exchange_declare(exchange='submitted', exchange_type='fanout')

  result = channel.queue_declare(queue='', exclusive=True)
  queue_name = result.method.queue
  channel.queue_bind(exchange='submitted', queue=queue_name)

  def callback(ch, method, properties, body):
    print(f" [submitted] {body.decode()}", flush=True)
    submittedJoke = json.loads(body.decode())
    print(submittedJoke)

    try:
      with mysql.connector.connect(
        host="db",
        user="root",
        password="example",
        database="stats_db"
    ) as connection:
        insert_submitted_joke = """
        INSERT INTO jokes_submitted
        (category, who)
        VALUES ( %s, %s )
        """
        record = [
          (submittedJoke['category'], submittedJoke['who'])
        ]
        with connection.cursor() as cursor:
          cursor.executemany(insert_submitted_joke, record)
          connection.commit()

    except mysql.connector.Error as e:
      print(e)

  channel.basic_consume(
    queue=queue_name, on_message_callback=callback, auto_ack=True)
  
  channel.start_consuming()

def main():
  toldThread = threading.Thread(target=threadTold )
  submittedThread = threading.Thread(target=threadSubmitted)

  toldThread.start()
  submittedThread.start()

  toldThread.join()
  submittedThread.join()

main()