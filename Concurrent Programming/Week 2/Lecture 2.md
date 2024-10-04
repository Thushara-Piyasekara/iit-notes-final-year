>FSP guide :- https://www.doc.ic.ac.uk/~jnm/LTSdocumention/FSP-notation.html


### LTS 
![[Pasted image 20241004085540.png]]

For concurrent programs to work properly we have to identify the following,
- Processes that can be done at the same time.
	- These process are usually isolated from each other. And does not overlap I/Os
- Processes that affect each other.
	- Playing 2 songs at the same time will end up corrupting each other.

### Activity - Traffic Light

Write the FSP for a traffic light,
```
TRAFFIC_LIGHT = (red -> redOrange -> green -> orange -> TRAFFIC_LIGHT).
```


#### Action Choice
- Used to handle `if-else` scenarios.
- Denoted witj `|` (pipe) symbol between two actions.
	- ( x -> P | y -> Q )
#### Non Deterministic Choice

```
COIN = (toss -> heads -> COIN |toss -> tails -> COIN).
```

When two choice actions has the same name, one of the choices will be taken randomly.


### Activity 2
Reverse engineer the FSP,
![[Pasted image 20241004104012.png]]

```
DRINKS = (blue -> tea -> DRINKS | red -> coffee -> DRINKS).
```

### Alphabet

TODO Look into this

### Trace of a process

```
P1 = ( a -> b -> c -> STOP ) . 
P2 = ( a -> b -> c -> P2 ) .
```
![[Pasted image 20241004110317.png]]

- Triangle symbol means the process loops back
![[Pasted image 20241004111155.png]]
> Is trace set the power set of actions??
> **NO. Trace sets are always linked**

#### Traffic Light Trace
![[Pasted image 20241004112810.png]]
```
TRAFFIC_LIGHT = (red -> orangeRed -> green -> orange -> TRAFFIC_LIGHT)
```

```
traces (TRAFFIC_LIGHT) ={<>, <red>, <red, orangeRed>, <red, orangeRed, green>, <red, orangeRed, green, orange>, <red, orangeRed, green, orange, red>, ...}
```



