/* NoughtsCrosses
 * Author: CJ
 * Creation date: 10/26/24
 */

MACHINE 
	NoughtsCrosses
SETS
	Players = {Noughts, Crosses};
	Results = {Success, Failure};
	Outcomes = {Noughts_Win, Crosses_Win, Draw, Ongoing}
	
CONSTANTS
	Grid, winningSubsets
	
PROPERTIES
	Grid = (1..3)*(1..3) &
	winningSubsets <: POW(Grid) &
	winningSubsets = {{1}*(1..3), {2}*(1..3), {3}*(1..3), // Rows
			         (1..3)*{1}, (1..3)*{2}, (1..3)*{3}, // Columns
			         id(1..3), // Main diagonal
			         {1|->3, 2|->2, 3|->1}} // Off diagonal
VARIABLES
	noughts, crosses, currentOutcome, turn
	
INVARIANT
	noughts <: Grid & 
	crosses <: Grid & 
	noughts /\ crosses = {} & 
	currentOutcome : Outcomes & 
	turn : Players
	
INITIALISATION
	noughts := {} || crosses := {} || currentOutcome := Ongoing || turn :: Players // Here, `turn` should be one of the items in the Players set. But we can't manually initialize the value. Therefore, we can use the 'Becomes member' operator (::). With this operator, turn can be initialized with any of the items in the `Players` set (check in ProB).
OPERATIONS
	res <-- placeSymbol(pp) = 
	PRE
	    pp : Grid
	THEN
	    IF (pp : noughts \/ crosses or currentOutcome /= Ongoing)
	    THEN
	        res := Failure
	    ELSE
	        res := Success ||
	        
	        // Place current player's symbol
	        IF (turn = Noughts)
	        THEN
	            noughts := noughts \/ {pp} ||
	            turn := Crosses
	        ELSE
	            crosses := crosses \/ {pp} ||
	            turn := Noughts
	        END ||
	        
	        // Update current outcome
            // We need to have `noughts \/ {pp}` here even though we have updated noughts above.
            // Because here that update is not visible. THIS IS BECAUSE OF PARALLEL EXECUTION:
            // "When operations of included machines are combined in parallel, they are acting on
            // different state spaces and so the set of variables that they update will be disjoint."
	        IF (POW(noughts \/ {pp}) /\ winningSubsets /= {}) 
	        THEN
	            currentOutcome := Noughts_Win
	        ELSIF (POW(crosses \/ {pp}) /\ winningSubsets /= {})
	        THEN
	            currentOutcome := Crosses_Win
	        ELSIF (card(crosses \/ noughts \/ {pp}) = card(Grid))
	        THEN
	            currentOutcome := Draw
	        ELSE
	            currentOutcome := Ongoing
	        END     
	    END
	END;
	
	reset = 
	BEGIN
	    noughts := {} || crosses := {} || currentOutcome := Ongoing || turn :: Players
	END
END




