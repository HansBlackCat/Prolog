# Cp4 Lists

## Lists

List features\
head-tail

```
| ?- [Head|Tail] = [mia,vincent,jules,yolanda].

Head = mia
Tail = [vincent,jules,yolanda]

yes
| ?- [X|Y] = [mia,vincent,jules,yolanda].

X = mia
Y = [vincent,jules,yolanda]

yes
| ?- [X|Y] = [].

no
| ?- [X|Y] = [[],dead(zed),[2,[b,chooper]],[],Z].

X = []
Y = [dead(zed),[2,[b,chooper]],[],Z]

yes
| ?- [X,Y|W] = [[],dead(zed),[2,[b,chooper]],[],Z].

W = [[2,[b,chooper]],[],Z]
X = []
Y = dead(zed)

yes
| ?- [X1,X2,X3,X4|W] = [[],dead(zed),[2,[b,chooper]],[],Z].

W = [Z]
X1 = []
X2 = dead(zed)
X3 = [2,[b,chooper]]
X4 = []

yes
| ?- [_,_,[_|X]|_] = [[],dead(zed),[2,[b,chooper]],[],Z].  

X = [[b,chooper]]

yes
```

## Member

`memeber` look like this

```prolog
% WARN: It won't be compiled
member(X,[X|T]).
member(X,[H|T]) :- member(X,T).
```

```
| ?- member(vincent,[yolanda,trudy,vincent,jules]).

true ? 

yes
| ?- member(bola,[yolanda,trudy,vincent,jules]).

no
| ?- member(X,[yolanda,trudy,vincent,jules]).   

X = yolanda ? a

X = trudy

X = vincent

X = jules

yes
```

predicate is ...

```prolog
myMember(X,[X|_]).
myMember(X,[_|T]) :- myMember(X,T).
```

## Recursing down lists

Object

```
a2b([a,a,a,a],[b,b,b,b]).

yes
a2b([a,a,a,a],[b,b,b]).

no
a2b([a,c,a,a],[b,b,5,4]).

no
```

predicate is ...
```prolog
a2b([],[]).
a2b([a|Ta],[b|Tb]) :- a2b(Ta,Tb).
```

```
| ?- a2b([a],[b]).

yes
| ?- a2b(X,[b,b,b,b,b,b]).

X = [a,a,a,a,a,a] ? 

yes
```