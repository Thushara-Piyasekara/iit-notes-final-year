`||` notation can be used to define composite process.
```
TRAFFIC_LIGHT = (red -> orangeRed -> green -> orange -> TRAFFIC_LIGHT).

||JUNCTION = (TRAFFIC_LIGHT || TRAFFIC_LIGHT || TRAFFIC_LIGHT || TRAFFIC_LIGHT).
```
In this example,
> All Traffic lights are indicating the same lights at the same time. Just like a jump wired switch.
   **This is a bad traffic junction**

### Interleaving Processes

```
P = ( a1 -> a2 -> ... -> an -> STOP ). 
Q = ( b1 -> b2 -> ... -> bn -> STOP ).
```
This will give a trace tree as follows,
![[Pasted image 20241011100902.png]]
**In the trace tree, left side is always process P, and right side is always Q**
For more than 2 processes the branch numbering could be similar to above rule.

Trace tree of two recurring processes.
![[Pasted image 20241011101123.png]]
