/* *************************************************************
 * 6SENG005W Formal Methods
 * Machine:  Week 02 Example
 * Spec:     
 * Author:   P Howells (howellp)
 * Created:  Monday, 2 October 2022
 * Modified: 02/10/2022
 ************************************************************ */

MACHINE Sets

  SETS
    PEOPLE ;

    ANSWER     = { yes, no } ;

    CURSOR_KEY = { Up_Key, Down_Key, Left_Key, Right_Key } ;

    DIRECTION  = { North, South, East, West }

  CONSTANTS
    Jim, Sue

  PROPERTIES
    Jim : PEOPLE 
    & 
    Sue : PEOPLE 
    & 
    Jim /= Sue

  VARIABLES
    dirs , keys , pointing

  INVARIANT
    dirs <: DIRECTION  
    & 
    keys <: CURSOR_KEY 
    & 
    pointing : dirs


  INITIALISATION
    dirs, keys, pointing  
          :=  { North, South }, { Up_Key, Down_Key }, North

/* 
  OPERATIONS

    Add operations here 
*/


END  /* Sets */


