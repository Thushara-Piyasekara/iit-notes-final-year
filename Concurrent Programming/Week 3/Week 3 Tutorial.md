6SENG006W Concurrent Programming
Week 03 Tutorial

FSP & LTSA II


Introduction
The aim of these tutorial exercises is to constructing & analyse simple FSP programs and executing them in LTSA.



Exercise 3.1
Using the CHANGE process from Week 02 Exercise 1.4 make the following modification:

Replace the recursive calls of CHANGE in its definition by STOP one at a time.
Animate the modified processes & compare their "new" behaviours to the original's.

Redo the list of process attributes from Week 02 Exercise 1.5 for this new process, making a note of anything differences you discover.

Can you explain them?




Exercise 3.2
Extend the Lecture 2 FSP DRINKS process & add more actions for other drinks, e.g. brown for hotchocolate.

Use the LTSA tool to analyse & animate it.




Exercise 3.3
Extend the Exercise 3.2 DRINKS process by allowing a customer to select to have their coffee with or without milk, i.e. either black or white.

Use the LTSA tool to analyse & animate it.




Exercise 3.4
Further extend the Exercise 3.3 DRINKS process by allowing a customer to select to have their coffee not only without or without milk but once they have decided on this, then to be able to choose to have sugar if they want.

Use the LTSA tool to analyse & animate it.




Exercise 3.5
Extend the Exercise 1.4 CHANGE process:

	CHANGE = ( fivep -> (   onep -> onep -> onep -> onep -> onep -> CHANGE

			      | twop -> twop -> onep -> CHANGE )  ).
by also offering change of three 1p's & a 2p.
Use the LTSA tool to analyse & animate it.

Question: Does this process behave as expected, or is something "strange" going on? If you thnk so, what is it & what is causing it?




Exercise 3.6
For each of the FSP processes defined in Exercises 3.1 - 3.4 draw the state machine diagram that corresponds to your FSP process.

The state machines, e.g. the LTS graphs, may be drawn either on paper or using a diagram drawing application, e.g. Draw.io available online at: https://app.diagrams.net/.

Once you have drawn it, you should check it using LTSA's Draw feature. Note that slight differences regarding the layout of the graph are irrelevant.

But the paths through the graphs should be the same, which can be checked by animating the process and check that it can perform the required actions, e.g. produce a trace that corresponds to the path through the LTS graphs.




Exercise 3.7
Copy some of the FSP processes from the Week 02 Lecture into LTSA & animate & analyse them to make sure you understand what they do & how they work.