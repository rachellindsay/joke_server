// to be written - handle sending rabbitmq messages
const amqp = require("amqplib/callback_api");

const rabbit = function rabbit(msgObj, exchange) {
  msg = JSON.stringify(msgObj);
  amqp.connect("amqp://rabbitmq", function (error0, connection) {
    if (error0) {
      throw error0;
    }
    connection.createChannel(function (error1, channel) {
      if (error1) {
        throw error1;
      }

      channel.assertExchange(exchange, "fanout", {
        durable: false,
      });
      // publish sends to named exchanges, first parameter name of exchange, empty string as second parameter means that we are not sending to any specific queue - only sending to exchange named in first parameter
      // queue names are only important when there are specific consumers - not important when sending to all
      channel.publish(exchange, "", Buffer.from(msg));
      console.log(exchange, " [x] Sent %s", msg);
    });

    setTimeout(function () {
      connection.close();
    }, 500);
  });
};

module.exports = {
  rabbit,
};
