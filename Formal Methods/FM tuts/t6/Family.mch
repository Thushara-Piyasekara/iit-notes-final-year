/* Family
* Author: CJ
* Creation date: 11/12/24
*/

MACHINE  Family
    
SETS
    PEOPLE = {Grandad, Paul, Jim, Mary, Ian, Jack, Jill, Jane, Bill, Joe};
    SEX = {Male, Female};   
    REPORT = {Success, Error_NotAFamilyMember, Error_MalesCantHaveBabies, Error_AlreadyUsedName, 
              Error_PassportNumberAlreadyBeingUsed, Error_NoExistingPassportToRenew, Error_MotherTooYoung};
    ANSWER = {Yes, No};
    HAS_CHILDREN_RESPONSES = {yes, no, DoNotKnow} // E 6.9
    
CONSTANTS
    PASSPORT_NUMBERS, MINIMUM_MOTHER_AGE
    
PROPERTIES
    PASSPORT_NUMBERS = NAT1 &
    MINIMUM_MOTHER_AGE = 18
    
VARIABLES
    family, age, sex, passportNumber, parentOf, myMum
    
INVARIANT
    family <: PEOPLE &
    age : PEOPLE +-> NAT & dom(age) = family &
    sex : PEOPLE +-> SEX & dom(sex) = family &
    passportNumber : PEOPLE +-> PASSPORT_NUMBERS & // E 6.4. Here we can't explicitly define the domain as family because there can be family members without a passport.
    parentOf : family <-> family & // E 6.7
    // E 6.8
    // `myMum` is a partial function as though every person should have a Mum, for some their Mum might not be alive. 
    // It's not injective as there can be Mums with many children.
    // It's not surjective as there can be family members without children.
    // It's not bijective as there can be family members without children.
    myMum : family +-> family
    
INITIALISATION
    family := {Grandad, Paul, Mary, Jim, Jane, Jill}  ||
    age := {Grandad |-> 100, Paul |-> 41, Jim |-> 15, Jane |-> 11, Mary |-> 40, Jill |-> 4}  ||
    sex := {Paul |-> Male, Mary |-> Female, Jim |-> Male, Jane |-> Female, Jill |-> Female, Grandad |-> Male} ||
    passportNumber := {Paul |-> 25242117, Mary |-> 38492812, Jim |-> 28988194, Jane |-> 43028275, Jill |-> 43028275, Grandad |-> 13516194} ||  // E 6.4
    parentOf := {Grandad |-> Paul, Grandad |-> Mary, Paul |-> Jim, Mary |-> Jane, Mary |-> Jill} || // E 6.7
    myMum := {Jane |-> Mary, Jill |-> Mary} // E 6.8
    
OPERATIONS
    report <-- HadBirthday(person) =
    PRE
        person : PEOPLE
    THEN
        IF (person : family)
        THEN
            age := age <+ {person |-> (age(person) + 1)}  ||
            report := Success
        ELSE 
            report := Error_NotAFamilyMember
        END
    END;
    
    report <-- PersonDies(person) =
    PRE
        person : PEOPLE
    THEN
        IF (person : family)
        THEN
            family := family - {person} ||
            age := {person} <<| age || // Domain subtraction to remove person from the function
            sex := {person} <<| sex ||
            
            // E 6.7
            IF (person : dom(parentOf) & person : ran(parentOf))
            THEN
                parentOf := ({person} <<| parentOf) |>> {person} // Remove person from both domain and range of the relation
            ELSIF (person : dom(parentOf))
            THEN
                parentOf := {person} <<| parentOf
            ELSIF (person : ran(parentOf))
            THEN
                parentOf := parentOf |>> {person}
            END ||
            
            // E 6.8
            IF (person : dom(myMum) & person : ran(myMum))
            THEN
                myMum := ({person} <<| myMum) |>> {person} // Remove person from both domain and range of the relation
            ELSIF (person : dom(myMum))
            THEN
                myMum := {person} <<| myMum
            ELSIF (person : ran(myMum))
            THEN
                myMum := myMum |>> {person}
            END || 
            
            report := Success
        ELSE
            report := Error_NotAFamilyMember
        END
    END;
    
    report <-- HadABaby(mother, baby, babysex) =
    PRE
        mother : PEOPLE & baby : PEOPLE & babysex : SEX
    THEN
        IF (mother : family & sex(mother) = Female & age(mother) >= MINIMUM_MOTHER_AGE & baby /: family)
        THEN
            family := family \/ {baby} ||
            age := age \/ {baby |-> 0} ||
            sex := sex \/ {baby |-> babysex} ||
            parentOf := parentOf \/ {mother |-> baby} || // E 6.7
            myMum := myMum \/ {baby |-> mother} || // E 6.8
            report := Success
        ELSIF (mother /: family)
        THEN
            report := Error_NotAFamilyMember
        ELSIF (sex(mother) = Male)
        THEN
            report := Error_MalesCantHaveBabies
        ELSIF (age(mother) < MINIMUM_MOTHER_AGE)
        THEN
            report := Error_MotherTooYoung
        ELSE
            report := Error_AlreadyUsedName
        END
    END;
    
    answer <-- DoesAFamilyMemberHaveThisSex(ss) =
    PRE
        ss : SEX
    THEN
        IF (ss : ran(sex))
        THEN
            answer := Yes
        ELSE
            answer := No
        END
    END;
    
    report <-- FirstPassport(person, passportNum) = // E 6.5
    PRE
        person : PEOPLE &
        passportNum : PASSPORT_NUMBERS &
        person /: dom(passportNumber) // This is for getting their FIRST passport. So if a person already has a passport this op should not be available.
    THEN
        IF (person : family & passportNum /: ran(passportNumber))
        THEN
            passportNumber := passportNumber \/ {person |-> passportNum} ||
            report := Success
        ELSIF (person /: family)
        THEN
            report := Error_NotAFamilyMember
        ELSE
            report := Error_PassportNumberAlreadyBeingUsed
        END
    END;
    
    report <-- RenewPassport(person, newPassportNumber) = // E 6.6
    PRE
        person : PEOPLE &
        newPassportNumber : PASSPORT_NUMBERS
    THEN
        IF (person : family & person : dom(passportNumber) & newPassportNumber /: ran(passportNumber)) // Person is a family member, person already has a passport to renew, new passport number is not already being used by another family member
        THEN
            passportNumber := passportNumber <+ {person |-> newPassportNumber} ||
            report := Success
        ELSIF (person /: family)
        THEN
            report := Error_NotAFamilyMember
        ELSIF (person /: dom(passportNumber))
        THEN
            report := Error_NoExistingPassportToRenew
        ELSE
            report := Error_PassportNumberAlreadyBeingUsed
        END
    END;
    
    res <-- HasChildren(person) =
    PRE
        person : PEOPLE
    THEN
        IF (person : family & person : dom(parentOf))
        THEN
            res := yes
        ELSIF (person /: dom(parentOf))
        THEN
            res := no
        ELSE
            res := DoNotKnow
        END
    END    
END
