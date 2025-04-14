status(lost).

!go_around.

+!go_around : status(lost) <-
    move(random);
    .print("I will look for other agents");
    !go_around.
-!go_around : status(lost) <-
    !go_around.
-!go_around : not(status(lost)) <- true.
/* TODO: handle the rescuing scenario */

+?follow(Dir, Response)[source(Sender)] <-
  .print("I will follow ", Sender, " in direction ", Dir);
  Response = ok.

