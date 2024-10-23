- ASSERTIONS clause is added after the INITIALISATION clause 
```
ASSERTIONS 
	EE \/ FF <: { aa, bb, cc, dd, ee, ff, gg }; 
	EE /\ GG = {};
	FF /\ GG = { aa }
```

