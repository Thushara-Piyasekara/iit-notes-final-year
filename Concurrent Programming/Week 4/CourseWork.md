# Check Deadlocks
- go to `Check -> safety` to check deadlocks. 

- If we check the safety and progress of the following,
```
DRINKS = (red -> coffee -> DRINKS | blue -> tea -> STOP).
```

![[Pasted image 20241018091014.png]]

![[Pasted image 20241018090854.png]]

# Action Descriptions
> [!PDF|] [[DRINKS_FSP_PROCESS_FORM.pdf#page=2&selection=38,0,40,1|DRINKS_FSP_PROCESS_FORM, p.2]]
> > Vending machine’s red button pressed by a customer to select a coffee. 

Note the **tense** used to explain the representation of the action. If we dont use the correct tense we will not get marks.

# Diagram
- If we solve the question we can put the full diagram. If we dont solve the complete problem we can put a partially compiled diagram.

# LTS States
> [!PDF|] [[DRINKS_FSP_PROCESS_FORM.pdf#page=3&selection=25,0,38,1|DRINKS_FSP_PROCESS_FORM, p.3]]
> > Vending machine waiting for a customer to press one of its 2 buttons, red or blue.

- The starting state could change from answer to answer. 

# Trace Tree
- We have to draw this manually. 
![[DRINKS_FSP_PROCESS_FORM.pdf#page=4&rect=35,450,341,707|DRINKS_FSP_PROCESS_FORM, p.4]]
