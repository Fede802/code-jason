status(lost).

!go_around.

+!go_around : neighbour(_) <- true.
+!go_around : status(lost) <-
    .print("I am lost AAAAAAAAAAAAAA");
    move(random);
    .print("I will look for other agents AAAAAAAAAAAAA");
    !go_around.
-!go_around : status(lost) <- !go_around.
-!go_around : not(status(lost)) <- true.
/* TODO: handle the rescuing scenario */

+?follow(Dir, Response)[source(Sender)] <-
  -+status(found);
  .print("I will follow ", Sender, " in direction ", Dir);
  !go_behind;
  .print("I am behind ", Sender);
  Response = ok.

+next_move(Dir, Response)[source(Sender)] <-
  move(Dir);
  Response = ok.

+!go_behind : neighbour(forward_right) | neighbour(backward_right) <-
    .print("I will go to the right");
    move(left);
    rotate(left).

+!go_behind : neighbour(forward_left) | neighbour(backward_left) <-
    .print("I will go to the left");
    move(right);
    rotate(right).

+!go_behind : neighbour(forward) <- true.
+!go_behind : neighbour(backward) <- rotate(right); rotate(right).
+!go_behind : neighbour(left) <- rotate(right).
+!go_behind : neighbour(right) <- rotate(left).
+!go_behind <- true.





