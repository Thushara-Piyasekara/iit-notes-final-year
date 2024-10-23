![[Pasted image 20241023102516.png]]


![[Pasted image 20241023102223.png]]


```
MACHINE

noughtsAndCrosses

SETS

Players = {Noughts, Crosses};

Results = {Success, Failure};

Outcomes = {Noughts_Win, Crosses_Win, Draw, Ongoing_Game}

CONSTANTS

Grid, winningSubsets

PROPERTIES

Grid = (1..3)*(1..3) &

winningSubsets <: POW(Grid) &

winningSubsets = { {1}*(1..3), {2}*(1..3), {3}*(1..3),

(1..3)*{1}, (1..3)*{2}, (1..3)*{3},

id(1..3), {1|->3, 2|->2, 3|->1}}

VARIABLES

noughts, crosses, currentOutcome, turn

INVARIANT

noughts <: Grid &

crosses <: Grid &

noughts /\ crosses = {} &

currentOutcome <: Outcomes &

turn <: Players

INITIALISATION

noughts := {} || crosses := {} || currentOutcome := {Ongoing_Game} || turn := {}

OPERATIONS

  

res <-- placeNought(pp) =

PRE

pp : Grid

THEN

IF

pp : noughts \/ crosses

THEN

res := Failure

ELSE

noughts := noughts \/ { pp } ||

res := Success

END

END;

  

  

res <-- placeCross(pp) =

PRE

pp : Grid

THEN

IF

pp : noughts \/ crosses

THEN

res := Failure

ELSE

crosses := crosses \/ { pp } ||

res := Success

END

END;

res <-- placeSymbol(pp) =

PRE

pp :Grid

THEN

IF (pp : noughts \/ crosses & currentOutcome : {Ongoing_Game})

THEN

res := Failure

ELSIF (turn : {Noughts})

THEN

noughts := noughts \/ {pp} ||

res := Success

ELSE

crosses := crosses \/ { pp } ||

res := Success

END

END

  

  

END
```