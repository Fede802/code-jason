/* TODO */
/* Initial beliefs and rules */
//by default = turn(me)[source(self)]
turn(other).
other(ping).

/* Initial goals */

/* Plans */

+!send_pong : turn(me) & other(Receiver) <-
  -+turn(other);
  !sendMessageTo(ball, Receiver).

//reacting to addition of ball believe
+ball[source(Sender)] : .print(Sender) & turn(other) & other(Sender) <-
  -+turn(me);
  -ball[source(Sender)];
  .print("Received ball from ", Sender);
  .print("Responding Pong");
  !send_pong.
  //alternatively, we could use the following line to send the message to the sender of the ball
  //-+turn(other);
  //!sendMessageTo(ball, Sender).

+!sendMessageTo(Message, Receiver) <-
  .print("Sending ", Message, " to ", Receiver);
  .send(Receiver, tell, Message).