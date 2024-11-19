/* *************************************************************
 * 6SENG005W Formal Methods
 * Machine:  Tube
 * Spec:     Week 09 Tutorial Sequences: 
 *           Part of the London Underground System around NCS
 * Author:   P Howells (howellp)
 * Modified: 11/11/2022
 ************************************************************ */
 
MACHINE Tube

  SETS
      
    LINE = { Bakerloo, Victoria, Northern, Circle } ;

    STATION = { 
                // Bakerloo
                Baker_Street, Regents_Park, Oxford_Circus, Piccadilly_Circus, Charing_Cross,
                // Circle
                Great_Portland_Street, Euston_Square,
                // Victoria
                Warren_Street,  
                // Northern
                Goodge_Street, Tottenham_Court_Road, Leicester_Square,
                UnknownStation
              } ;             
    
    JOURNEY_STATUS = { Journey_is_Empty, 
                       Journey_is_MaxLength, 
                       Journey_Only_Has_Start_station, 
                       Journey_Can_Be_Extended 
                     } ;
    
    REPORT = { Station_Added_To_Journey, 
               ERROR_Journey_is_MaxLength,
               Start_Station_Removed_From_Journey, 
               ERROR_Journey_Empty  
             }
    
    
   CONSTANTS
      MaxJourneyLength, JOURNEY, UNDEFINED_JOURNEY
    
    
  PROPERTIES
      MaxJourneyLength : NAT1  &  MaxJourneyLength = 7  
      &
      JOURNEY = iseq(STATION)    
      &
      UNDEFINED_JOURNEY : JOURNEY  &  UNDEFINED_JOURNEY = []            
              
    
    
  VARIABLES
      tube_journey

  INVARIANT
      tube_journey : JOURNEY  &  size( tube_journey ) <= MaxJourneyLength
      &
      UnknownStation /: ran( tube_journey )
    
  INITIALISATION
      tube_journey := UNDEFINED_JOURNEY
       
       
   /************************************************************/
   
   OPERATIONS
       
      
    report <-- AddNextStationToJourney( station ) =
        PRE 
            station : STATION  &  station /: ran( tube_journey ) 
            & station /= UnknownStation   &  report : REPORT
        THEN 
            IF ( size( tube_journey )  < MaxJourneyLength )
            THEN
                tube_journey  := tube_journey <- station  ||
                report        := Station_Added_To_Journey
            ELSE
                report := ERROR_Journey_is_MaxLength
            END 
        END ;



    report <-- RemoveStartStationFromJourney = 
        PRE 
            report : REPORT
        THEN 
            skip 
        END ;


    status <-- JourneyStatus =
        PRE 
            status : JOURNEY_STATUS    
        THEN 
            IF  ( tube_journey = UNDEFINED_JOURNEY )
            THEN
                 status := Journey_is_Empty 
            ELSIF 
                 ( size(tube_journey) = MaxJourneyLength ) 
            THEN
                 status := Journey_is_MaxLength
            ELSIF
                 ( size(tube_journey) = 1 ) 
            THEN
                 status := Journey_Only_Has_Start_station                  
             ELSE
                 status := Journey_Can_Be_Extended
            END 
        END 

       
END /* Tube */


