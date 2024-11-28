/* PaperRound
 * Author: CJ
 * Creation date: 10/5/24
 */
 
MACHINE PaperRound
    
VARIABLES
    houseNumbers

INVARIANT
    houseNumbers <: NAT1

INITIALISATION
    houseNumbers := {}

OPERATIONS
    addNewHouse(newHouse) =
    PRE
        newHouse : NAT1 & newHouse /: houseNumbers
    THEN
        houseNumbers := houseNumbers \/ {newHouse}
    END;

    numbHouses <-- howManyHouses =
    BEGIN
        numbHouses := card(houseNumbers)
    END;
    
    ans <-- getsPapers(houseNumber) = // E 1.6
    PRE 
        houseNumber : NAT1 & houseNumber : houseNumbers
    THEN
        ans := 1
    END;
    
    cancelPapers(houseNumber) = // E 1.7
    PRE
        houseNumber : NAT1 & houseNumber : houseNumbers
    THEN
        houseNumbers := houseNumbers - {houseNumber}
    END
    
END