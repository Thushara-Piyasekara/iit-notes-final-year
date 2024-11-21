## Propositional Logic
**Satisfiable formulas** :-  Atleast one value satisfies it (at least one truth table entry is *true*).
**Valid formuals** :- The truth table is always *true*.

## Evaluating Formulas
- Evaluation is done recursively.
- Make sure to follow precedence when applying operations.
# Precedence Order (Highest to Lowest)

1. **Parentheses (`()`):**
   - **Highest precedence**: Anything inside parentheses is evaluated first.
   - **Example:** In `(A ∨ B) ∧ C`, `A ∨ B` is evaluated first because it is within parentheses.

2. **Negation (`¬`, "NOT"):**
   - Negation is evaluated next after parentheses.
   - **Example:** In `¬A ∧ B`, `¬A` is evaluated first.

3. **Conjunction (`∧`, "AND"):**
   - Logical AND is evaluated after negation.
   - **Example:** In `A ∧ B ∨ C`, `A ∧ B` is evaluated first.

4. **Disjunction (`∨`, "OR"):**
   - Logical OR is evaluated after conjunction.
   - **Example:** In `A ∨ B ⇒ C`, `A ∨ B` is evaluated before `⇒`.

5. **Implication (`⇒`, "IMPLIES"):**
   - Logical implication is evaluated after conjunction and disjunction.
   - **Example:** In `A ∨ B ⇒ C ∧ D`, `C ∧ D` and `A ∨ B` are evaluated before `⇒`.

6. **Bi-conditional (`⇔`, "IFF"):**
   - Logical equivalence (bi-conditional) has the lowest precedence.
   - **Example:** In `A ∨ B ⇔ C ∧ D`, evaluate `A ∨ B` and `C ∧ D` first, then apply `⇔`.

### Implies => explanation
In case of A => B,
We assume if A is True, then B should also be true. Then we eliminate the impossible scenarios.	![[Pasted image 20241121122145.png]]
> Only A = True and B = False evaluates to A => B = False.

### Bi-Conditional explanation
- A is true if and only if B is true.
- The bi-conditional A⇔B is true when: 
	- Both A and B are True or,
	- Both A and B are False.
![[Pasted image 20241121122817.png]]

