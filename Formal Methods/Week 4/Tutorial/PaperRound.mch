/* PaperRound
 * Author: thusharapiyasekara
 * Creation date: 10/2/24
 */
MACHINE
    PaperRound
    
SETS
    HasPaperStrings = {House_has_papers, House_doesnt_have_papers};
    StopDeliveryStrings = {Removed_successfully, Not_in_the_set};
    DeliveryStates = {Paper_only, Magazine_only, Both_magazine_and_paper, No_deliveries};  // Magazine_only will be removed as per activity 3.5
    stopAllDeliveriesStrings = {The_house_will_no_longer_have_either_delivered, The_house_does_not_have_both_delivered}
CONSTANTS
    MaxNumberOfHouses
PROPERTIES
    MaxNumberOfHouses = 10
    
    VARIABLES
        houseNumbers,
        magazinesDeliveredHouses
    INVARIANT
        houseNumbers <: NATURAL1 &
        magazinesDeliveredHouses <: NATURAL1 &
        card(houseNumbers) < MaxNumberOfHouses
    INITIALISATION
        houseNumbers := {} ||
        magazinesDeliveredHouses := {}
    OPERATIONS
        addNewHouse(newHouse) =
            PRE
                newHouse : NATURAL1 & newHouse /: houseNumbers & card(houseNumbers) < MaxNumberOfHouses
            THEN
                houseNumbers := houseNumbers \/ {newHouse}
            END;
            
        numbHouses <-- howManyHouses=
            BEGIN
                numbHouses := card(houseNumbers)
            END;
            
        ans <-- getsPapers(houseNumber)=
            PRE
                houseNumber : houseNumbers
            THEN
                ans := 1
            END;
        
        cancelPapers(houseNumber) = 
            PRE
                houseNumber : houseNumbers
            THEN
                houseNumbers := houseNumbers - {houseNumber} ||
                magazinesDeliveredHouses := magazinesDeliveredHouses - {houseNumber}
            END;
            
            
///////// Week 3
        ans <-- firstHouse=
            PRE 
                houseNumbers /= {}
            THEN
                ans := min(houseNumbers)
            END;
            
        ans <-- lastHouse =
            PRE
                houseNumbers /= {}
            THEN
                ans := max(houseNumbers)
            END;
            
         ans <-- hasPaper(houseNumber) =
            PRE
                houseNumber : NATURAL1
            THEN
                IF(houseNumber : houseNumbers)
                THEN
                    ans := House_has_papers
                ELSE
                    ans := House_doesnt_have_papers
                END
            END;
        
        ans <-- stopDelivery(houseNumber) =
            PRE
                houseNumber : NATURAL1
            THEN
                IF(houseNumber : houseNumbers)
                THEN
                    houseNumbers := houseNumbers - {houseNumber} ||
                    ans := Removed_successfully
                ELSE
                    ans := Not_in_the_set
                END
            END;
            
            
            
//// 3.4
        deliverMagazine(houseNumber) =
            PRE
                houseNumber : NATURAL1 & houseNumber : houseNumbers & houseNumber /: magazinesDeliveredHouses 
            THEN
                magazinesDeliveredHouses := magazinesDeliveredHouses \/ {houseNumber}
            END;
            
        stopMagazine(houseNumber) =
            PRE
                houseNumber : magazinesDeliveredHouses
            THEN
                magazinesDeliveredHouses := magazinesDeliveredHouses - {houseNumber}
            END;
            
        ans <-- deleveries(houseNumber) =
            PRE
                houseNumber : NATURAL1
            THEN
                IF(houseNumber : houseNumbers)
                THEN
                    IF(houseNumber : magazinesDeliveredHouses)
                    THEN
                        ans := Both_magazine_and_paper
                    ELSE
                        ans := Paper_only
                    END
//                ELSIF(houseNumber : magazinesDeliveredHouses)
//                THEN
//                    ans := Magazine_only
                ELSE
                    ans := No_deliveries
                END
            END;
            
        ans <-- stopAllDeliveries(houseNumber) =
            PRE
                houseNumber : NATURAL1
            THEN
                IF(houseNumber : houseNumbers \/ magazinesDeliveredHouses)
                THEN
                    houseNumbers := houseNumbers - {houseNumber} ||
                    magazinesDeliveredHouses := magazinesDeliveredHouses - {houseNumber} ||
                    ans := The_house_will_no_longer_have_either_delivered
                ELSE
                    ans := The_house_does_not_have_both_delivered
                END
            END;
            
///// 3.5

///// 3.7
        ans <-- howManyMore =
            ans:= 10 - card(houseNumbers)            
END
