/* TODO */

/* Initial goals */
!start(1, 10).

/* Plans */


+!start(N, M) : N < M <-
	!on_step(N);
	!start(N + 1, M).
	
+!start(N, M) <- !on_step(N).

+!on_step(N): N mod 2 = 0 <-
	.print("hello world ", N, " even").

+!on_step(N) <-
    .print("hello world ", N, " odd").    