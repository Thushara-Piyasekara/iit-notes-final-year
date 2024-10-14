6SENG006W Concurrent Programming
Week 04 Tutorial

FSP & LTSA III


Introduction
The aim of these tutorial exercises is to analyse & design simple FSP programs using FSP Design & Analysis Forms. And animate & analyse them in LTSA tool.



Exercise 4.1
Complete a FSP Design & Analysis Form for each of the following processes from Week 02 Tutorial:


COINTOSS
PERSON
DRINKS (Ex 2.4 version only)
CHANGE (Ex 2.5 version only)
NOTES:

See the example FSP Composition Form (in the FSP Inofmration folder) for the Drinks_Vending_Machine_FSP_Composition_Form.pdf for the DRINKS, COFFEE_CUSTOMER, TEA_CUSTOMER processes.

We have not covered all the material required to complete all the sections of the Forms yet, so complete as much as you can; & after we have covered the remaining material you can complete them.




Exercise 4.2
The following two processes TOSS1 & TOSS2 both model the tossing of a coin.


TOSS1 = (   toss -> heads -> TOSS1
          | toss -> tails -> TOSS1
        ).

TOSS2 = (   toss -> (   heads -> TOSS2
                      | tails -> TOSS2 )
        ).
Compare them by considering their attributes as described in a FSP Description Form. What attributes are the same & what differences are there?

In relation to their behaviours when animated:


Are they the same?

What happens if they are combined in parallel?
|| TOSS_12 = ( TOSS1 || TOSS2 ).


|| TOSS_11 = ( TOSS1 || TOSS1 ).


|| TOSS_22 = ( TOSS2 || TOSS2 ).


Finally, can you draw any conclusions from this analysis?

What happens if you try these three examples:


|| TOSS_1111 = ( TOSS1 || TOSS1 || TOSS1 || TOSS1 ) .

|| TOSS_2222 = ( TOSS2 || TOSS2 || TOSS2 || TOSS2 ) .

|| TOSS_1222 = ( TOSS1 || TOSS2 || TOSS2 || TOSS2 ) .




Exercise 4.3
Using a FSP Design & Analysis Form & the LTSA tool analyse & animate the following processes:

const MAXINT = 1
range INT    = 0..MAXINT

X = Y[ 0 ] ,

Y[ i : INT ] =  (   a[ i ]      -> Y[ i ] 
		  | b[j : INT ] -> Y[ j ] 
		) .

What does it represent? (Hint: you have use at least one of these in almost every program you have ever written.)
What happens if you change the value of MAXINT from "1" in its definition to a larger number, e.g. 2, 5, 10, 20?

What would more meaningful names be for the two actions "a" & "b"?




Exercise 4.4
Using a FSP Design & Analysis Form & the LTSA tool, develop a processes to model a simple Bank Account.

Create the BankAccount process that allows customers to read & write the account balance.




Exercise 4.5
For each of the following processes from Lecture 2:

    TRAFFICLIGHT

    FAULTY

    P1 - P6

    BUFF

    BUFF3

    BUFF( N = 3 )

    SUM

    COUNT

    COUNTDOWN
Copy & load them into the LTSA tool & analyse & animate them.



Exercise 4.6
Using the above processes from Exercise 4.5, that make use of constants, ranges & parameters, modify them by using larger values.

What happens to them in terms of states & FMS graphs?

