/* Minefield
* Author: CJ
* Creation date: 11/9/24
*/

MACHINE Minefield
    
DEFINITIONS
    diff(xx, yy) == max({xx-yy, yy-xx}); // Because xx-yy and yy-xx are both possible and we need a positive value (0 or 1)
    adjacent(pp,qq) == (diff(prj1(NAT1, NAT1)(pp), prj1(NAT1, NAT1)(qq)) <= 1) & 
    (diff(prj2(NAT1, NAT1)(pp), prj2(NAT1, NAT1)(qq)) <= 1) // Here we must include the type NAT1 for both ordered pairs as Atelier B or Pro B (can't remember which) need the type
    
SETS
    RESPONSES = {Yes, No, Fail, Success}
    
CONSTANTS
    Grid, Mines
    
PROPERTIES
    Grid = (1..8)*(1..8) & Mines <: Grid & Mines = {(2,2),(1,5),(6,3),(4,7),(5,2)}
    
VARIABLES
    // All the guesses made so far, and the number of near misses
    guesses, nearMisses
    
INVARIANT
    guesses <: Grid & nearMisses : NAT
    
INITIALISATION
    guesses:={} || nearMisses:=0
    
OPERATIONS
    res <-- gameOver =
    BEGIN
        IF (guesses /\ Mines /= {})
        THEN
            res := Yes
        ELSE
            res := No
        END
    END;
    
    res <-- makeGuess(pp) = 
    PRE
        pp : Grid
    THEN
        IF (pp : guesses or guesses /\ Mines /= {})
        THEN
            res := Fail
        ELSE
            res := Success ||
            guesses := guesses \/ {pp} ||
            // We have to compare current position pp to all mine positions and see if it's adjacent
            IF (#(mm).(mm : Mines & adjacent(pp, mm)))
            THEN
                nearMisses := nearMisses + 1
            END
        END
    END    
END