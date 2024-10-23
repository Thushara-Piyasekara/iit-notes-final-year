# Functions
>If one or more source set elements map with exactly one target set element, the relation is a function.

- If we assign all the source elements to target set elements, it is a **total function**. In total functions `source set == domain set`. [[TODO]] lookup domain set. There could be target set elements without relations.
- If we assign only a part of the elements, it is a **partial function**.

![[lecture05.pdf#page=5&rect=46,20,199,245|lecture05, p.5]]

- Arrays/Sequences are functions,
	- The source set indicates the index of the array.
	- The target set indicates the value of each index.
	- This relation could be a total or partial function.
# Function Classes

## Injective Functions
- Every target element relates to at most one source element.
- Range of the relation has no duplicates.
## Surjective Functions
- Every target element has a relation with one or more source elements.
- Target set == range.
- One target element can have more than one relation.

## Bijective Functions
- Has both bijective and injective properties.
- All injective total functions are Bijective??

# Notaions
![[lecture05.pdf#page=7&rect=2,52,156,226|lecture05, p.7]]

# Function Domain and Range
- `dom(f)` : set of all source elements that has relation.
- `ran(f)` : set of all target set that has a relation.

> [!PDF|] [[lecture05.pdf#page=9&selection=32,0,38,34|lecture05, p.9]]
>  - total if dom(f) is the entire source set 
>  - surjective if ran(f) is the entire target set

### Inverse of a function
- Inverse of a function is usually not a function.
### Composition of a function
- Always a function.
- if both f and g are toatal/injective/surjective, so is f;g.
### Identity of a function
- Identity relations are always total bijective functions.
- [[TODO]] check identity relations.

![[lecture05.pdf#page=11&rect=27,37,328,235|lecture05, p.11]]

# Modifying Functions

- [[TODO]]

# Exercise

- owner : CAR <-> PERSON
	- Every car has a owner person. But not every person has a car.
	- A car cannot have multiple owners. But a person can have multiple cars.
		- total
		- not injective
		- not surjective
- child : PERSON <-> PERSON
	- Source and target sets are both the same.
	- Which one is parent set and which one is child??
		- Source element is a `child` of target element.
	- One source element could have more than one target elements.
		- Both parents
	- Therefore this is not a function.
- child~ :  PERSON <-> PERSON 
	- [[TODO]]
- mother : PERSON <-> PERSON
	- Every person has a mother.
	- But every person is not a mother.
	- [[TODO]]

# Equivalence Relations
> if a relation is reflexive, symmetric and transitive, that relation is a equivalence relation.

### Reflexive
- Every element is equivalent to itself.
- Looks like a mirror.
### Symmetric
- If (x,y):R then (y,x):R.

### Transitive
- [[TODO]]

[[TODO]] Draw the sets for above relations. 

![[lecture05.pdf#page=17&rect=10,35,346,104|lecture05, p.17]]

