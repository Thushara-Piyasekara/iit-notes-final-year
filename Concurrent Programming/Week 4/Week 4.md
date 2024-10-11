### Shared vs Non-Shared Actions
- Non-Shared actions have unique actions for all the processes.
- Shared actions have one or more common actions in the processes.
The alphabet diagram doesn't have a intersection in Non-Shared processes,
![[Pasted image 20241011102056.png]]
- Synchronous - Shared actions
- Asynchronous - non-shared actions

### Synchronous Actions
```
BILL = ( play -> meet -> STOP ).
BEN = ( work -> meet -> STOP ).
||BILL_BEN = ( BILL || BEN ).
```
Since meet action is shared, both processes will wait till both finish the meet action.
![[Pasted image 20241011103005.png]]

![[Pasted image 20241011103016.png]]
**There is no two *meet* actions. Both process do it at the same time.**

#### Version 2

```
MAKERv2 = ( make -> ready -> used -> MAKERv2 ).
USERv2 = ( ready -> use -> used -> USERv2 ).
|| MAKER_USERv2 = ( MAKERv2 || USERv2 ).
```

Two sync actions are used here. It is called a **Handshake**.
Here, the Maker waits till the User has used the result. This way Maker doesnt overproduce.

### LTS Labeling
[[TODO]]
### LTS Relabaling
[[TODO]]


[[TOOD]] Homework sync bank acc with career wife. Then sync bank with husband
