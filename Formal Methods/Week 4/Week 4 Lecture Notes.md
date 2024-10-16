# Relations
- We can have relations between sets. This is made with relations between different elements.
- Elements connected like this is called ordered pairs. The order of ordered pairs matter.
```
PEOPLE = {ben, ann, jane}
COLOURS = {red, green, blue}
FAVOURITE_COLOURS = {(ben, red), (ann, green)}
```

- We can see these kind of relations in databases.
- We can show the above `FAVOURITE_COLOURS` as follows,
```
PEOPLE x COLOURS = {(ben, red), (ann, green)}
```

### Relations in B
- Relation between two sets can be shown in B as follows,
```
FavouriteColours : People <-> Colours 
```
- Relation between elements are as follows,
```
FavouriteColours = {ben |-> red, ann |-> green}
```
- Above notation is called maplets. ProB accepts the `(ben, red)` notation. But Atelier B does not.
#### Source & Target Sets
- Source set is People set and target set is the colours set.
#### Domain & Range Sets
- Domain and the Range sets of the above example,
```
dom(FavouriteColours) = {ben, ann}
range(FavouriteColours) = {red, green}
```
#### Inverse Set
- Inverse set is the reverse order of the maplets.
```
InverseFavouriteColours = {(red, ben), (green, ann)}
```
#### Projections of a relation
- We can use projection to extract elements of an ordered pair,
```
prj1(ben |-> red) = ben
prj2(ben |-> red) = red
```
#### Selecting subsets
[[TODO]]

#### Modifying Relations
- We can use `override` operation to modify the relations.
```
FavouriteColours <+ {ben |-> blue, ann |-> red}
```
- This will modify the original relations of ben and ann with the given new ones.

#### Relational Algebra
- We can have the following relationships,
	- One to One
	- Many to Many
	- One to Many
	- Many to One
- [[TODO]] Check Identity Relations

#### Composition
```
R : A<->B 
S : B<->C
```
- Composition can be defined with `;` symbol,
```
R;S : A<->C
```

![[Pasted image 20241016151427.png]]
```
Letter;Colour = {(a,red), (b, blue), (c, green), (e, purple)}
```

#### Inverse 
- In inverse relations the arrow direction of the original pairs gets reversed.
![[Pasted image 20241016151746.png]]
