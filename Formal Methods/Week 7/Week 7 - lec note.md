# Lecture 7: Sequences

## Introduction to Sequences
- **Sets and Limitations**: 
  - Sets do not account for:
    - Position of elements.
    - Duplicate values.
    - Specific ordering.
  - Example:
    - `{0, 1, 2, 5, 23, 99}` is equivalent to `{1, 99, 5, 2, 23, 0}`.
  - A **sequence** is required when these distinctions matter.

---

## Defining Sequences
- **Sequence Notation**:
  - A sequence is a list of values enclosed in square brackets.
  - Example: `Colours = {red, yellow, green}`, a sequence could be `[red, green, red, red]`.
  - An empty sequence is denoted as `[]`.
- **Special Subsets**:
  - `seq1(S)`: Non-empty sequences.
  - `iseq(S)`: Injective (non-repeating) sequences.

- **Mathematical Definition**:
  - Sequences are functions indexed by natural numbers.
  - A sequence is a function `f: NAT1+ -> S` where `dom(f)` is an initial segment `1..n` of `NAT1`.
  - Formally:
    ```
    seq(S) = {f | f: NAT1+ -> S & dom(f) = 1..card(f)}
    ```

---

## Working with Sequences: Access
- **Accessing Elements**:
  - Use indexing: If `colSequence = [red, green, green, blue, red]`, then:
    - `colSequence(1) = red`
    - `colSequence(4) = blue`
  - `first(seq)` and `last(seq)` retrieve the first and last elements:
    - Example: `first([2,3,5]) = 2`, `last([2,3,5]) = 5`.
  - Not defined for the empty sequence `[]`.

---

## Working with Sequences: Truncation
- **Operations**:
  - `front(seq)`: Removes the last element.
    - Example: `front([2,3,5,7,11]) = [2,3,5,7]`.
  - `tail(seq)`: Removes the first element.
    - Example: `tail([2,3,5,7,11]) = [3,5,7,11]`.
- **Definitions**:
  - `front(seq)`: Restrict sequence by removing the last index.
  - `tail(seq)`: Apply a shift to the indices.

---

## Working with Sequences: Insertion
- **Operations**:
  - `x -> seq`: Insert `x` at the start of `seq`.
  - `seq <- y`: Insert `y` at the end of `seq`.
  - Relationships:
    - `seq = front(seq) <- last(seq)`
    - `seq = first(seq) -> tail(seq)`

---

## Sequence Example: Stack
- **Operations**:
  - `Push`: Adds an element to the stack.
  - `Pop`: Removes and returns the top element (non-empty stacks only).
  - `IsEmpty`: Checks if the stack is empty.
- **Implementation**:
  - **Initialization**:
    - `stack := []`
  - **Push Operation**:
    ```b
    push(num) =
    PRE num : NAT THEN
        stack := stack <- num
    END;
    ```
  - **Pop Operation**:
    ```b
    res <-- pop =
    PRE stack /= [] THEN
        stack := front(stack)
        res := last(stack)
    END;
    ```

---

## Combining and Splitting Sequences
- **Concatenation**:
  - Operator `ˆ` combines two sequences.
  - Example: `[1,3,5] ˆ [2,4,5] = [1,3,5,2,4,5]`.

- **Splitting**:
  - Operators `/|\` and `\|/` split sequences at position `n`.
    - `/|\ n`: First `n` elements.
    - `\|/ n`: Remaining elements.
  - Example:
    - For `c = [red, orange, yellow, green, blue]`:
      - `c /|\ 2 = [red, orange]`
      - `c \|/ 2 = [yellow, green, blue]`.

---

## Modifying Sequences
- **Insertion**:
  - Insert value at position `n`:
    - Example: Insert `3` into `[1,2,4,5]`:
      - `((seq /|\ 2) <- 3) ˆ (seq \|/ 2) = [1,2,3,4,5]`.
- **Removal**:
  - Remove element at position `n`:
    - Example: Remove the 4th entry from `[1,2,3,4,5]`:
      - `(seq /|\ 3) ˆ (seq \|/ 4) = [1,2,3,5]`.

---

## Filtering Sequences
- **Filtering Elements**:
  - Retain elements that satisfy a condition.
  - Example: Filter odd numbers from `[1,2,3,4,3]`:
    - Result: `[1,3,3]`.
- **Implementation**:
  - Identify indices of elements to keep.
  - Construct a new sequence from selected indices.

---

## Advanced Topics
- **ProB Usage**:
  - Advanced sequence manipulation like filtering and custom definitions can be done using ProB.

---
