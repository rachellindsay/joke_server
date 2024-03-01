import smtplib, ssl
import pika
# import load_dotenv
import os

# load_dotenv()


def main():
  connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='rabbitmq'))
  channel = connection.channel()

  channel.exchange_declare(exchange='submitted', exchange_type='fanout')

  result = channel.queue_declare(queue='', exclusive=True)
  queue_name = result.method.queue
  channel.queue_bind(exchange='submitted', queue=queue_name)

  def callback(ch, method, properties, body):
    print(f" [submitted] Joke submitted - send email", flush=True)

    port = 465 
    smtp_server = "smtp.gmail.com"
    password = os.getenv("EMAIL_PASSWORD")
    print("password: ", password)
    # "${EMAIL_PASSWORD}"
    # input("Type your password and press enter: ")
    sender_email = "rachellindsay.net@gmail.com"
    receiver_email = "racheljlindsay@gmail.com"
    message = """\
    Subject: Joke Submitted

    A new joke has been submitted and is pending approval."""

    # create a secure ssl context
    context = ssl.create_default_context()

    with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
      server.login(sender_email, password)
      server.sendmail(sender_email, receiver_email, message)

# gmail app password: xvlh lhii usvb loja
  
  
  channel.basic_consume(
    queue=queue_name, on_message_callback=callback, auto_ack=True)
  
  channel.start_consuming()

main()

