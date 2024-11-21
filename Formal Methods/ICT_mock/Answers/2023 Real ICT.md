![[paper_IIT_2023_without_answers.pdf#page=1&rect=63,191,575,408|paper_IIT_2023_without_answers, p.1]]

# Question 1
a. RedVegetables /\ YellowVegetables = {Pepper}
b. RedVegetables - YellowVegetables = {Beet, Radish} 
c. card(RedVegetables \/ YellowVegetables) = 4
d. card({RedVegetables, YellowVegetables}) = 2
e. POW(YellowVegetables) = {{}, {Beet}, {Pumpkin}, {Beet, Pumpkin}}

# Question 2
![[paper_IIT_2023_without_answers.pdf#page=2&rect=62,224,565,450|paper_IIT_2023_without_answers, p.2]]
a. A is a subset of B OR B is a subset of A.
	False OR False 
		False

b. For all n such that if n is an element of A, then n + 1 is an element in B.
	True.

c. For at least one n such that if n is an element of B and n is greater than 7.
	True. (n = 9)

d. For all n such that if n is an element of A, and for at least one m such that m is an element of B, then m is greater than n.
	True.

e. For at least one n such that if n is an element of A, and for all m such that m is and element of B, then m is greater than n.
		False (m = 1)

# Question 3
![[paper_IIT_2023_without_answers.pdf#page=3&rect=64,391,585,700|paper_IIT_2023_without_answers, p.3]]
a. It is a partial function (Apple and Grape does not any relations). It is injective and Surjective. 
b. dom(inedible) = {Banana, Cherry, Avacado}
c. inedible~ = {(Peel, Banana), (Pit, Cherry), (Pulp, Avacado)}
d. (inedible~ ; colours) = {(Peel, Yellow), (Pit, Red), (Pulp, Green)}
e. `colors[{Apple}] = {Green, Red, Yellow}`
# Question 4
a. Y ^ X = [1,5,2,8,2,3]
b. rev(X) =  [3,2,8]
c. Y /|\ 2 = [1,5]
d. X <- 5 = [8,2,3,5]
e. tail(Y) = [1,5]
# Question 5
![[paper_IIT_2023_without_answers.pdf#page=4&rect=66,546,550,702|paper_IIT_2023_without_answers, p.4]]

```
MACHINE committee

SETS
	COMMITTEE = {Anne, Marry, Jack, Peter, Marlon}

INVARIANT
	dislikes : COMMITTEE <-> COMMITTEE = {Marry -> Anne, Marry -> Jack, Peter -> Marlon}
	
```

![[2023_ICT_MCH.jpeg]]