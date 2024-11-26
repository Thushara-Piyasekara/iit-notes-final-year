/* *************************************************************
 * 6SENG005W Formal Methods
 * Machine:  Family.mch
 * Spec:     Family - Week 05 Tutorial: Functions
 ************************************************************ */
 
 
MACHINE  Family
    
  SETS
    PEOPLE = { Grandad, Paul, Jim, Mary, Ian, Jack, Jill, Jane, Bill, Joe } ;
    
    SEX =  { Male, Female } ;
          
    REPORT =  { Success,                   Error_NotAFamilyMember,       
	            Error_MalesCantHaveBabies, Error_AlreadyUsedName  } ;

    ANSWER =   { Yes, No}
    
  CONSTANTS
    PASSPORT_NUMBERS

  PROPERTIES
    PASSPORT_NUMBERS = NAT1

  
  VARIABLES
    family,
    age,
    sex 
  
  INVARIANT
    family  <: PEOPLE     &
    age : PEOPLE +-> NAT   &  dom(age) = family  &
    sex : PEOPLE +-> SEX   &  dom(sex) = family          
    

  INITIALISATION
       family := { Grandad, Paul, Mary, Jim, Jane, Jill }  
    ||
       age    := { Grandad |-> 100, Paul |-> 41, Jim |-> 15, 
                   Jane |-> 11,     Mary |-> 40, Jill |-> 4 }  
    ||
       sex    := { Paul |-> Male,   Mary |-> Female, Jim |-> Male,
                   Jane |-> Female, Jill |-> Female, Grandad |-> Male }  
  
  
  OPERATIONS
    
    report <-- HadBirthday( person ) =
               PRE
                   person : PEOPLE
               THEN
                   IF   ( person : family )
                   THEN
                         age    := age <+ { person |-> (age(person) + 1) }  ||
                         report := Success
                   ELSE 
                         /* ( person /: family ) */
                         report := Error_NotAFamilyMember
                   END
               END ;
              
              
    report <-- PersonDies( person ) =
              TO DO
                      
                      
    report <-- HadABaby( mother, baby, babysex ) =
              TO DO
                      
   
    answer <-- DoesAFamilyMemberHaveThisSex( ss ) =
              TO DO
 

END  /* Family */
