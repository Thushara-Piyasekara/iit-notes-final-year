- Sets are separated by a semi colon (;)
```
SETS
HasPaperStrings = {House_has_papers, House_doesnt_have_papers};
StopDeliveryStrings = {Was_delivered_successfully, Not_in_the_set}
```
- Variables are separated by a comma (,)
```
	VARIABLES
	houseNumbers, houseNames
```
- Multiple lines can be executed with the parallel operator (||)
```
IF(houseNumber : houseNumbers)

THEN

houseNumbers := houseNumbers - {houseNumber} ||

ans := Removed_successfully
```
- Initialization can be done in two ways,
```
INITIALISATION
	houseNumbers := {} ||
	magazinesDeliveredHouses := {}
```

```
INITIALISATION
	houseNumbers, magazinesDeliveredHouses := {}, {}
