# Cp2. Matching and Proof Search

## 2.1 Mathcing

>**three types of terms**
>1. Constants: atoms or numbers
>2. Variables
>3. Complex terms


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

```
| ?- kill(shoot(gun),stab(knife)) = kill(X,stab(Y)).

X = shoot(gun)
Y = knife

yes
```

Cyclic term

if X instanciated with father(butch)\
father(father(butch)) = father(butch)


```
| ?- father(X) = X.

cannot display cyclic term for X

yes
```

>vertical(line(point(X,Y),point(X,Z))).
horizontal(line(point(X,Y),point(Z,Y))).

```
| ?- vertical(line(point(1,1),point(1,3))).

yes
| ?- vertical(line(point(1,1),point(3,2))).  

no
| ?- horizontal(line(point(1,1),point(2,Y))).

Y = 1

yes
```

```
| ?- horizontal(line(point(2,3),P)).

P = point(_,3)

yes
```

The answer of query, `point(_,3)` is **_structured_**

Answer is complex term, sophisticated concept.

## Proof Search

```prolog
f(a).
f(b).

g(a).
g(b).

h(b).

k(X) :- f(X),g(X),h(X).
```

```
| ?- k(X).

X = b

yes
```

trace order: f -> g -> h

**Instanciate X to _**

first match _ `a`\
f(a) OK -> g(a) OK -> h(a) Fail\
backtrace

second match _ `b`\
f(b) OK -> g(b) OK -> h(b) Ok\
X = b

`;` in interpreter means _backtrack again_

```prolog
loves(vincent,mia).
loves(marcellus,mia).

jealous(X,Y) :- loves(X,Z),loves(Y,Z).
```

```
| ?- jealous(X,Y).

X = vincent
Y = vincent ? a

X = vincent
Y = marcellus

X = marcellus
Y = vincent

X = marcellus
Y = marcellus

yes
```

p30

## Excercise

**Excercise 2,4**
___

```prolog
word(abalone,a,b,a,l,o,n,e). word(abandon,a,b,a,n,d,o,n). word(enhance,e,n,h,a,n,c,e). word(anagram,a,n,a,g,r,a,m). word(connect,c,o,n,n,e,c,t). word(elegant,e,l,e,g,a,n,t).

crosswd(V1,V2,V3,H1,H2,H3) :- 
  word(H1,_,H1V1,_,H1V2,_,H1V3,_),
  word(H2,_,H2V1,_,H2V2,_,H2V3,_),
  word(H3,_,H3V1,_,H3V2,_,H3V3,_),
  word(V1,_,H1V1,_,H2V1,_,H3V1,_),
  word(V2,_,H1V2,_,H2V2,_,H3V2,_),
  word(V3,_,H1V3,_,H2V3,_,H3V3,_).
```

```
| ?- crosswd(V1,V2,V3,H1,H2,H3).

H1 = abalone
H2 = anagram
H3 = connect
V1 = abandon
V2 = elegant
V3 = enhance ? 

yes
```