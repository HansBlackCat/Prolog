# Cp2. Matching and Proof Search

## 2.1 Mathcing

### three types of terms

1. Constants: atoms or numbers
2. Variables
3. Complex terms


```
| ?- =(mia,mia).

yes
```

```
| ?- =(mia,vincent).

no
```

% Infix expression

```
| ?- mia = mia.

yes
```

`'mia'` and `mia` is same atom\
on the other hand, query\
`'2'` = `2` is _no_

`mia`, `'mia'`, `'2'` are atoms\
`2` is number

```
| ?- 'mia' = mia.

yes
```

Prolog is agreeing two-terms unify

```
| ?- X = Y.

Y = X

(1 ms) yes
```

```
| ?- kill(shoot(gun),Y) = kill(X,stab(knife)).

X = shoot(gun)
Y = stab(knife)

yes
```
