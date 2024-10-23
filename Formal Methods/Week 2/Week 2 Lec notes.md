### Tricky notations

> Z :- All nums from negative infinity to positive infinity
> NATURAL1 :- Starts with 1
> NATURAL :- Starts with 0

> succ(x) :- x++
> pred(x) :- x--

> card(A) :- number of elements in set A

### Other cases
- For set difference (A - B),
	- A should be a superset of B. Otherwise we cant do the operation.
### Subsets vs Strict Subsets
- If there is a chance(We dont know for sure) of subset being equal to a superset, it is a `subset`.
	- In this case subset could be equal to the superset.
- If there is no chance of subset being equal to its superset, then its a `strict subset`.

### Power Sets
- A set containing all the subsets of a given set.
	- This means power sets are a `set of sets`.
- It's cardinality can be calculated by,
	![[Pasted image 20241002144657.png]]
- For Example, 
	![[Pasted image 20241002144757.png]]

## Activity - pg 23
![[Pasted image 20241002151356.png]]
### 1.
	card(B) = 5
	C ∩ 1 .. 5 = {2,4}
	P(C) = {{},{2},{4},{6},{2,4},{2,6},{4,6},{2,4,6}}
	B ∪ C = {1,2,4,6,7,9,10}
	A - B = {2,3,5,6,8}
	∪{C,{1,3,5},{99}} = {1,2,3,4,,5,6,99}
### 2.
	{ x | x ∈ Z ∧ x ≤ 20 & x mod 2 = 0}
### 3.
	True statements,
		- 5 ∈ D
		- { 2, 4 } ∈ P(C)

