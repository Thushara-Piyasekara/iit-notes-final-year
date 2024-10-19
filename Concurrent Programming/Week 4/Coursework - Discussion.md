---
share_link: https://share.note.sx/snxfwl96#7OuO8kv+I/HxPPU+MinLsCxQIaht565mYpmZRG2ofvI
share_updated: 2024-10-18T21:46:28+05:30
---
> Check `Concurrent Programming/Coursework/courseworkTemp.lts`

# Non Composition Analysis (Primitive)
## FSP Process Attributes
- Comment out the composite process to get the correct answers.
- Number of states can be achieved with `Supertrace`.

## Check Deadlocks
- go to `Check -> safety` to check deadlocks. 

- If we check the safety and progress of the following,
```
DRINKS = (red -> coffee -> DRINKS | blue -> tea -> STOP).
```

![[Pasted image 20241018091014.png]]

![[Pasted image 20241018090854.png]]

## Action Descriptions
> [!PDF|] [[DRINKS_FSP_PROCESS_FORM.pdf#page=2&selection=38,0,40,1|DRINKS_FSP_PROCESS_FORM, p.2]]
> > Vending machine’s red button pressed by a customer to select a coffee. 

Note the **tense** used to explain the representation of the action. If we dont use the correct tense we will not get marks.

## Diagram
- If we solve the question we can put the full diagram. If we dont solve the complete problem we can put a partially compiled diagram.

## LTS States
> [!PDF|] [[DRINKS_FSP_PROCESS_FORM.pdf#page=3&selection=25,0,38,1|DRINKS_FSP_PROCESS_FORM, p.3]]
> > Vending machine waiting for a customer to press one of its 2 buttons, red or blue.

- The starting state could change from answer to answer. 

## Trace Tree
- We have to draw this manually. 
![[DRINKS_FSP_PROCESS_FORM.pdf#page=4&rect=35,450,341,707|DRINKS_FSP_PROCESS_FORM, p.4]]

#  Composition Analysis

## Process Attributes

> [!PDF|] [[Drinks_Vending_Machine_FSP_COMPOSITION_FORM.pdf#page=1&selection=51,0,57,16|Drinks_Vending_Machine_FSP_COMPOSITION_FORM, p.1]]
> > { cc.blue, cc.choose_coffee, cc.coffee, cc.drink_coffee, cc.pickup_coffee, cc.red, cc.tea, tc.blue, tc.choose_tea, tc.coffee, tc.drink_tea, tc.pickup_tea, tc.red, tc.tea }

- The alphabet is longer for composite process

> [!PDF|] [[Drinks_Vending_Machine_FSP_COMPOSITION_FORM.pdf#page=1&selection=69,0,69,12|Drinks_Vending_Machine_FSP_COMPOSITION_FORM, p.1]]
> > 25 (0 .. 24)
> 

- We can get the no of states from `Check -> SuperTrace`
![[Pasted image 20241018093226.png]]

## Combined Sub-processes
![[Drinks_Vending_Machine_FSP_COMPOSITION_FORM.pdf#page=2&rect=49,199,547,261|Drinks_Vending_Machine_FSP_COMPOSITION_FORM, p.2]]
- We can have `a.customer` , `b.customer` here as well.

## Analysis of Combined Process Actions
- We can do this only if we complete the problem.
![[Drinks_Vending_Machine_FSP_COMPOSITION_FORM.pdf#page=3&rect=49,282,549,372|Drinks_Vending_Machine_FSP_COMPOSITION_FORM, p.3]]
- All possible combinations in the composite process should be noted.
![[Drinks_Vending_Machine_FSP_COMPOSITION_FORM.pdf#page=3&rect=47,132,557,223|Drinks_Vending_Machine_FSP_COMPOSITION_FORM, p.3]]
- We can block chosen synchronous actions by introducing a dummy alphabets with the same name,
![[Pasted image 20241018094934.png]]
- In the above example `TEA_CUSTOMER` has two dummy alphabets preventing it from accessing `COFFEE_CUSTOMER`'s actions.
- We can streamline this better with the following,
![[Pasted image 20241018095451.png]]
- In the above example we used `VMActions` to prevent different customers from accessing each others actions.

## Parallel Composition Structure Diagram

![[Drinks_Vending_Machine_FSP_COMPOSITION_FORM.pdf#page=5&rect=76,541,541,652|Drinks_Vending_Machine_FSP_COMPOSITION_FORM, p.5]]
- Process names should be inside the box.
- For each alphabet use a circle.
- Connect the synchronized actions (circles).





