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

## Boolean Satisfiability
- To check if a given formula is satisfiable, we have to prove atleast one of the assignment of truth values makes the entire formula evaluates to true.
- We can do this easily by using a SAT algorithm like DPLL.

### DPLL

> (A∨¬B∨C)∧(¬A∨D)∧B∧(C∨¬D)

- Transform the formulas into CNF(Conjunctive Normal Form).
- Start with the simplest CNF and find the value that makes it true, in this case its `B = True`.
- Evaluate other CNFs using the found values.
- If there is atleast one combination of values that makes the whole faormula true. Thne it is satisfaiable.

### Solving SAT with DPLL Algorithm

The **DPLL (Davis-Putnam-Logemann-Loveland)** algorithm is a recursive backtracking procedure that solves SAT problems efficiently in many practical cases.

#### Steps of the DPLL Algorithm:
1. **Unit Propagation**:
   - If a clause contains only one literal (unit clause), the value of that literal is forced.
   - Example: If \( B \) is a unit clause, then \( B = \text{true} \).

2. **Pure Literal Elimination**:
   - If a variable appears with only one polarity (always positive or always negative) in the formula, assign a value that satisfies all its occurrences.
   - Example: If \( C \) appears only as \( C \), set \( C = \text{true} \).

3. **Decision Making**:
   - If no straightforward assignments are possible, pick a variable and assign it a truth value (e.g., \( A = \text{true} \)) and proceed.

4. **Backtracking**:
   - If an inconsistency is found, backtrack and try the opposite value for the last decision variable.

5. **Termination**:
   - If all variables are assigned without contradiction, the formula is **satisfiable**.
   - If all possibilities are exhausted, the formula is **unsatisfiable**.

## Predicate Logic Overview
- **Predicate Logic** extends propositional logic to handle statements about objects, numbers, sets, etc.
- **Atomic Formulas**: These are basic building blocks like comparisons (`s = t`, `s < t`) or set membership (`s ∈ A`).
- **Components**:
  - Variables of various types: integers, sets, etc.
  - Logical operators combined with arithmetic or set-theoretic expressions.

---

## Predicate Logic
- **Concept**: Predicate logic extends propositional logic by allowing statements about data using atomic formulas.
- **Atomic Formulas**: Include comparisons (`s = t`, `s < t`), set membership (`s ∈ A`), and more complex terms with operations like arithmetic and set theory.
- **Use Cases**:
  - Coding: Conditions in loops or conditional statements.
  - Specifications: Pre-conditions or invariants in formal methods.

## Predicate Logic and Predicates
- Predicate logic revolves around predicates that involve data.
- **Examples**:
  - Comparisons or set membership predicates are predefined.
  - Custom predicates can be defined, e.g., `isEven(nn) == (nn ∈ NAT & nn mod 2 = 0)`.

## Satisfiability in Predicate Logic
- **Challenge**: Satisfiability in predicate logic is more complex than propositional logic.
- Example:
  - `(x < y or x < z) & (y < x or y < z) & (z < x or z < y)`
  - A Boolean variable is assigned for each atomic formula, e.g., `P1` for `x < y`.
  - Propositional logic is applied, but atomic formulas have dependencies (e.g., `x < y` and `y < x` cannot both be true).

## Satisfiability Module Theories (SMT)
- **SMT Solvers**:
  - Combine general SAT solvers with theory solvers (e.g., for arithmetic or sets).
  - Check if combinations of truth values are realizable.
- **Process**:
  - Solve the propositional version of the problem.
  - Use theory solvers to validate or add constraints for conflicts.

## Quantifiers
- **Purpose**: Allow statements about all or some values of variables.
- **Types**:
  - **Existential (∃ or #)**: "There exists at least one."
  - **Universal (∀ or !)***: "For all."
- **Examples**:
  - ∃yy.(yy ∈ NAT & xx = yy * yy) (xx is a square).
  - ∀xx.(xx ∈ NAT => xx ≥ 0) (All natural numbers are non-negative).

## Examples of Quantifiers
- **Complex Statements**:
  - Total Function: ∀xx:AA, ∃yy:BB such that (xx, yy) ∈ ff.
  - Surjective Function: ∀yy:BB, ∃xx:AA such that (xx, yy) ∈ ff.

## Quantification Order
- Order of quantifiers affects meaning.
- Example:
  - ∀xx ∈ AA, ∃yy ∈ BB such that `xx mod yy = 0` means each `xx` has some `yy` dividing it.
  - ∃yy ∈ BB such that ∀xx ∈ AA, `xx mod yy = 0` means the same `yy` divides all `xx`.
  - These two statements are logically different.

## Combining Quantifiers
- **Injective Functions**:
  - ∀xx, yy ∈ AA, if `xx ≠ yy` then `f(xx) ≠ f(yy)`.
- **Arithmetic Examples**:
  - ∃xx, yy ∈ NAT, `xx^2 + yy^2 = 221` (221 as a sum of two squares).

## Predicate Logic and Sets
- Predicate logic can define set comprehensions.
- **Example**:
  - Define the composition of relations RR and SS:
    - `RR;SS = {pp | pp ∈ NAT × NAT & ∃yy. ((prj1(pp), yy) ∈ RR & (yy, prj2(pp)) ∈ SS)}`.

## Exercises
1. Define `pp ∈ NAT` as a prime number.
	- !(qq).(qq:NAT & qq > 1 & qq < pp => pp mod qq /= 0)
2. Express `ff: NAT → NAT` as strictly increasing.
	- !(xx,yy).(xx:NAT & yy:NAT => (xx < yy => ff(xx) < ff(yy)))
3. Define a set of sets `SS ⊆ POW(NAT)` as a partition where no two sets in `SS` share elements.
	- !(S1,S2).(S1:SS & S2:SS => (S1 /= S2 => S1 ∩ S2 = {})) & !(xx).(xx:NAT => #(S).(S:SS & xx:S))
4. Express that `ff: NAT × NAT → NAT` has inverses such that ∀xx ∈ NAT, ∃yy ∈ NAT, `ff(xx, yy) = 0`.
	- !(xx).(xx:NAT => #(yy).(yy:NAT & ff(xx,yy) = 0))
