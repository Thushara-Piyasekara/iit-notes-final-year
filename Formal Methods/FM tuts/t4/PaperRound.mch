/* PaperRound
 * Author: CJ
 * Creation date: 04/11/24
 */
 
MACHINE PaperRound

SETS
    ANSWER = {yes, no};
    HOUSE_PAPER_REMOVE_MSG = {house_removed_successfully, error_house_not_in_set}; // E 3.1
    HOUSE_DELIVERY_MSG = {paper, magazine, paper_and_magazine, nothing}; // E 3.4
    ALL_DELIVERY_STOP_MSG = {no_further_papers_or_magazines_will_be_delivered, error_neither_papers_nor_magazines_are_currently_being_delivered} // E 3.4

CONSTANTS
    maxPapers
    
PROPERTIES
    maxPapers : NAT1 & maxPapers = 10 // E 3.7
    
VARIABLES
    houseNumbers, magazines

INVARIANT
    houseNumbers <: NAT1 & 
    magazines <: NAT1 &
    ((houseNumbers \/ magazines) - houseNumbers) = {} & // E 3.5
    card(houseNumbers) <= maxPapers & // E 3.7
    card(magazines) <= maxPapers // 3.7

INITIALISATION
    houseNumbers, magazines := {}, {}

OPERATIONS
    addNewHouse(newHouse) =
    PRE
        newHouse : NAT1 & 
        newHouse /: houseNumbers & 
        card(houseNumbers) < maxPapers
    THEN
        houseNumbers := houseNumbers \/ {newHouse}
    END;

    numbHouses <-- howManyHouses =
    BEGIN
        numbHouses := card(houseNumbers)
    END;
    
    firstHouseNumber <-- firsthouse = // E 3.1
    PRE
        card(houseNumbers) > 0 // houseNumbers should not be empty - optional condition
    THEN
        firstHouseNumber := min(houseNumbers) // We can take min here as the first house number as the set will always be ordered in ascending order. If `houseNumbers` was a sequence, we could have used `first()`.
    END;
    
    lastHouseNumber <-- lasthouse = // E 3.1
    PRE
        card(houseNumbers) > 0
    THEN
        lastHouseNumber := max(houseNumbers) // We can take max here as the last house number as the set will always be ordered in ascending order. If `houseNumbers` was a sequence, we could have used `last()`.
    END;
    
    ans <-- haspaper(houseNumber) = // E 3.1
    PRE
        houseNumber : NAT1
    THEN
        IF (houseNumber : houseNumbers)
        THEN
           ans := yes
        ELSE
           ans := no
        END
    END;
    
    ans <-- stopdelivery(houseNumber) = // E 3.1 + E 3.5
    PRE
        houseNumber : NAT1
    THEN
        IF (houseNumber : houseNumbers)
        THEN
            houseNumbers := houseNumbers - {houseNumber} ||
            magazines := magazines - {houseNumber} || // E 3.5
            ans := house_removed_successfully
        ELSE
            ans := error_house_not_in_set
        END
    END;
    
    deliverMagazine(houseNumber) = // E 3.4 + E 3.5
    PRE
        houseNumber : houseNumbers & // E 3.5
        card(magazines) < maxPapers // E 3.7
    THEN
        magazines := magazines \/ {houseNumber}
    END;

    stopMagazine(houseNumber) = // E 3.4
    PRE
        houseNumber : magazines
    THEN
        magazines := magazines - {houseNumber}
    END;
    
    ans <-- deliveries(houseNumber) =  // E 3.4
    PRE
        houseNumber : NAT1
    THEN
        IF (houseNumber : houseNumbers & houseNumber : magazines)
        THEN
            ans := paper_and_magazine
        ELSIF (houseNumber : houseNumbers)
        THEN
            ans := paper
        ELSIF (houseNumber : magazines)
        THEN
            ans := magazine
        ELSE
            ans := nothing
        END
    END;
    
    ans <-- stopalldeliverys(houseNumber) = // E 3.4
    PRE
        houseNumber : NAT1
    THEN
        IF (houseNumber : houseNumbers & houseNumber: magazines)
        THEN
            houseNumbers := houseNumbers - {houseNumber} ||
            magazines := magazines - {houseNumber} ||
            ans := no_further_papers_or_magazines_will_be_delivered
        ELSE
            ans := error_neither_papers_nor_magazines_are_currently_being_delivered
        END
    END;

    ans <-- howmanymore = // E 3.7
    BEGIN
        ans := maxPapers - card(houseNumbers)
    END
            
END

/*
E 3.2 Test Table:
+---------------------------------------------------------------------------------------------------------------------------------------------------------+
| Test Case | Operation      | Parameter (houseNumber)  | Initial State (houseNumbers) | Expected Outcome                                                 |
|-----------|----------------|--------------------------|------------------------------|------------------------------------------------------------------|
| 1         | firstHouse     | N/A                      | {1, 3}                       | returns `1`. `houseset` remains unchanged.                       |
| 2         | lasthouse      | N/A                      | {1, 3}                       | returns `3`. `houseset` remains unchanged.                       |
| 3         | haspaper       | 3                        | {1, 3}                       | returns `yes`. `houseset` remains unchanged.                     |
| 4         | haspaper       | 2                        | {1, 3}                       | returns `no`. `houseset` remains unchanged.                      |
| 5         | stopdelivery   | 2                        | {1, 2, 3}                    | returns `house_removed_successfully`. `houseset` becomes {1, 3}. |
| 6         | stopdelivery   | 2                        | {1, 3}                       | returns `house_not_in_set`. `houseset` remains unchanged.        |
+---------------------------------------------------------------------------------------------------------------------------------------------------------+

E 3.6 Test Table (Test cases that caused errors):
+---------------------------------------------------------------------------------------------------------------------------------------------------------+
| Test Case | Operation        | Parameter (houseNumber)  | Initial State (houseNumbers, magazines) | Expected Outcome                                    |        
|-----------|------------------|--------------------------|-----------------------------------------|-----------------------------------------------------|
| 1         | deliverMagazine  | 1                        | {}, {1}                                 | Invariant violation. `magazines` becomes {1}.       |
| 2         | deliverMagazine  | 2                        | {}, {2}                                 | Invariant violation. `magazines` becomes {2}.       |
| 3         | deliverMagazine  | 3                        | {}, {3}                                 | Invariant violation. `magazines` becomes {3}.       |
| 4         | stopdelivery     | 2                        | {1, 2}, {1, 2}                          | Invariant violation. `housueNumbers` becomes {1}    |
+---------------------------------------------------------------------------------------------------------------------------------------------------------+
*/
