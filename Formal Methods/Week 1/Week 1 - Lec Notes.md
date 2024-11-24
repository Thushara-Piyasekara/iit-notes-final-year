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
### VARIABLES
- Defines the names of the variables. These could be sets or traditional variables.
- Divided with `,` symbol.
### INVARIANT
- Defines the type & properties of the variables.
- This is a single statement.
- Divided with `&` symbol.
- 




![[Lecture Slides.pdf#page=19&rect=23,25,330,225|Lecture Slides, p.19]]