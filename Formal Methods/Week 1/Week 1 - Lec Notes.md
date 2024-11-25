- Formal methods are used to detect errors in software
- It is required for certain critical software.
- B methods are abstract and mathematical
- Different from UML 

TODOs 
- Install atelierB and prob

## B Abstract machine short notes
```
MACHINE
    PaperRound
    SETS
        HasPaperStrings = {House_has_papers, House_doesnt_have_papers};
        StopDeliveryStrings = {Removed_successfully, Not_in_the_set};
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
```

Take the above example,
### MACHINE
- Name of the abstract machine.
---
### SETS
- **Constant sets**. These dont change.
- We can declare string outputs of operations here.
- Each element should not have any spaces in between.
- Divided with `;` symbol.
### CONSTANTS
- **Non set constants** can be defined here.
- Only the name is defined in constants section.
- Divided with `,` symbol.
### PROPERTIES
- Defines the values of the **CONSTANTS**.
- Divided with `&` symbol.
- See,
	![[Lecture 1.pdf#page=14&rect=42,177,292,233|Lecture 1, p.14]]
--- 
### VARIABLES
- Defines the names of the variables. These could be sets or traditional variables.
- Divided with `,` symbol.
### INVARIANT
- Defines the type & properties of the variables.
- This is a single statement.
- Divided with `&` symbol.
### INITIALIZATION
- Uses assignment operator. **:=**
- Divided using `||` symbol.
- Or we can initialize everything as follows without using `||`,
	![[Lecture 2.pdf#page=52&rect=33,105,277,146|Lecture 2, p.45]]
---
### OPERATIONS
- Functions that can query or change the **VARIABLE** values.
- These can have input parameters,
```
 addNewHouse(newHouse) =
            PRE
                newHouse : NATURAL1 & newHouse /: houseNumbers & 
                card(houseNumbers) < MaxNumberOfHouses
            THEN
                houseNumbers := houseNumbers \/ {newHouse}
            END;
```
- Also return values,
```
ans <-- getsPapers(houseNumber)=
            PRE
                houseNumber : houseNumbers
            THEN
                ans := 1
            END;
```


## Abstract Machine Parameters
- This introduces **Sets, Constants and Constraints** for abstract machines.

### SETS and Constants as Machine parameters
- These are defined as inputs for the machine,
	![[Lecture Slides.pdf#page=22&rect=32,92,198,116|Lecture Slides, p.22]]
- **SETS** are always UPPER CASE. `GRADE` is a SET in the above example.
- **Constants** are lower case. `top, maxreg` are constants.

### CONSTRAINTS
- These are similar to **INVARIANTS**, but for machine parameters. 
	![[Lecture Slides.pdf#page=23&rect=33,152,191,178|Lecture Slides, p.23]]


## Summary of abstract machines
	
![[Lecture Slides.pdf#page=19&rect=23,25,330,225|Lecture Slides, p.19]]