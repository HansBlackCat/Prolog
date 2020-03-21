# Cp3 Recursion

## Definition

### Ex1 Eating

**Recursive case**

```
is_digesting(X,Y) :- just_ate(X,Y).
is_digesting(X,Y) :-
    just_ate(X,Z),
    is_digesting(Z,Y).

just_ate(mosquito,blood(john)).
just_ate(frog,mosquito).
just_ate(stork,frog).
```

How `is_digesting` works

>**X** -just_ate-> **Y**\
**X** -just_ate-> **Z1** -just_ate-> **Y**\
**X** -just_ate-> **Z1** -just_ate-> **Z2** -just_ate-> **Y**\
**X** -just_ate-> **Z1** -just_ate-> **Z2** -just_ate-> **Z3** -just_ate-> ... -just_ate-> **Y**

Recursively find all possibles.

```
| ?- just_ate(stork,Z), is_digesting(Z,mosquito).

Z = frog ?

yes
| ?- is_digesting(stork,blood(john)).

true ?

yes
```

### Ex2 Descendant

```prolog
child(charlotte,caroline).
child(caroline,laura).

child(martha,charlotte).
child(charlotte,caroline).
child(caroline,laura).
child(laura,rose).

descend(X,Y) :- child(X,Y).
descend(X,Y) :-
    child(X,Z),
    child(Z,Y).
```

```
| ?- descend(martha,laura).

no
```

we should fix `descend` function

```prolog
descend(X,Y) :- child(X,Y).
descend(X,Y) :- 
    child(X,Z),
    descend(Z,Y).
```

then

```
| ?- descend(martha,laura).

true ?

yes
```

### Ex3 Successor

```prolog
numeral(0).
numeral(succ(X)) :- numeral(X).
```

trace

```
X = succ(succ(succ(0))) ? ;
      1    1  Redo: numeral(succ(succ(succ(0)))) ?
      2    2  Redo: numeral(succ(succ(0))) ?
      3    3  Redo: numeral(succ(0)) ?
      4    4  Redo: numeral(0) ?
      5    5  Call: numeral(_385) ?
      5    5  Exit: numeral(0) ?
      4    4  Exit: numeral(succ(0)) ?
      3    3  Exit: numeral(succ(succ(0))) ?
      2    2  Exit: numeral(succ(succ(succ(0)))) ?
      1    1  Exit: numeral(succ(succ(succ(succ(0))))) ?

X = succ(succ(succ(succ(0)))) ?
```

```prolog
add(0,Y,Y).
add(succ(X),Y,succ(Z)) :-
    add(X,Y,Z).
```

```
| ?- add(succ(succ(0)),succ(0),Y).

Y = succ(succ(succ(0)))

yes
| ?- add(succ(succ(0)),succ(succ(0)),succ(succ(succ(succ(0))))).

yes
```