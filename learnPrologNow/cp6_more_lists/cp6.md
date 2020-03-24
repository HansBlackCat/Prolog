# Cp6 More Lists

## Append

```
| ?- append([a,b,c],[d,e],X).

X = [a,b,c,d,e]

yes
```

### Defining append

how `append/3` is defined

```prolog
myAppend([],L,L).
myAppend([H|T],L2,[H|L3]) :-
    myAppend(T,L2,L3).
```

```
| ?- myAppend([1,2],[3,4,5],X).
      1    1  Call: myAppend([1,2],[3,4,5],_289) ? 
      2    2  Call: myAppend([2],[3,4,5],_322) ? 
      3    3  Call: myAppend([],[3,4,5],_349) ? 
      3    3  Exit: myAppend([],[3,4,5],[3,4,5]) ? 
      2    2  Exit: myAppend([2],[3,4,5],[2,3,4,5]) ? 
      1    1  Exit: myAppend([1,2],[3,4,5],[1,2,3,4,5]) ? 

X = [1,2,3,4,5]

yes
{trace}
```

### Using append

```
| ?- append(X,Y,[a,b,c,d]).

X = []
Y = [a,b,c,d] ? ;

X = [a]
Y = [b,c,d] ? ;

X = [a,b]
Y = [c,d] ? ;

X = [a,b,c]
Y = [d] ? ;

X = [a,b,c,d]
Y = []

yes
```

```prolog
myPrefix(P,L) :- append(P,_,L).
```

```
| ?- prefix(X,[a,b,c,d]).

X = [] ? ;

X = [a] ? ;

X = [a,b] ? ;

X = [a,b,c] ? ;

X = [a,b,c,d] ? ;

no
```

on same principle..

```prolog
mySuffix(P,L) :- append(_,P,L).
```

```
| ?- suffix(X,[a,b,c,d]).

X = [a,b,c,d] ? ;

X = [b,c,d] ? ;

X = [c,d] ? ;

X = [d] ? ;

X = [] ? ;

(1 ms) no
```

defining `sublist`

```prolog
mySublist(SubL,L) :-
    suffix(S,L),
    prefix(SubL,S).
```

```
| ?- suffix(X,[a,b,c,d]).

X = [a,b,c,d] ? ;

X = [b,c,d] ? ;

X = [c,d] ? ;

X = [d] ? ;

X = [] ? ;

(1 ms) no
| ?- sublist(X,[a,b,c,d,e]).

X = [a,b,c,d,e] ? ;

X = [b,c,d,e] ? ;

X = [c,d,e] ? ;

X = [d,e] ? ;

X = [e] ? ;

X = [] ? ;

X = [d] ? ;

X = [c,e] ? ;

X = [c] ? ;

X = [c,d] ? ;

X = [b,d,e] ? ;

X = [b,e] ? ;

X = [b] ? ;

X = [b,d] ? ;

X = [b,c,e] ? ;

X = [b,c] ? ;

X = [b,c,d] ? ;

X = [a,c,d,e] ? ;

X = [a,d,e] ? ;

X = [a,e] ? ;

X = [a] ? ;

X = [a,d] ? ;

X = [a,c,e] ? ;

X = [a,c] ? ;

X = [a,c,d] ? ;

X = [a,b,d,e] ? ;

X = [a,b,e] ? ;

X = [a,b] ? ;

X = [a,b,d] ? ;

X = [a,b,c,e] ? ;

X = [a,b,c] ? ;

X = [a,b,c,d] ? ;

(2 ms) no
| ?- sublist(X,[a,b,c,d]).  

X = [a,b,c,d] ? a

X = [b,c,d]

X = [c,d]

X = [d]

X = []

X = [c]

X = [b,d]

X = [b]

X = [b,c]

X = [a,c,d]

X = [a,d]

X = [a]

X = [a,c]

X = [a,b,d]

X = [a,b]

X = [a,b,c]

(1 ms) no
```

## Reversing a list

redefining `append` in more efficient way.

### Naive reverse using append

```prolog
naiverev([],[]).
naiverev([H|T],R) :-
    naiverev(T,RevT),
    append(RevT,[H],R).
```

```
| ?- naiverev([a,b,c,d],R).
      1    1  Call: naiverev([a,b,c,d],_287) ? 
      2    2  Call: naiverev([b,c,d],_356) ? 
      3    3  Call: naiverev([c,d],_380) ? 
      4    4  Call: naiverev([d],_404) ? 
      5    5  Call: naiverev([],_428) ? 
      5    5  Exit: naiverev([],[]) ? 
      6    5  Call: append([],[d],_456) ? 
      6    5  Exit: append([],[d],[d]) ? 
      4    4  Exit: naiverev([d],[d]) ? 
      7    4  Call: append([d],[c],_485) ? 
      7    4  Exit: append([d],[c],[d,c]) ? 
      3    3  Exit: naiverev([c,d],[d,c]) ? 
      8    3  Call: append([d,c],[b],_516) ? 
      8    3  Exit: append([d,c],[b],[d,c,b]) ? 
      2    2  Exit: naiverev([b,c,d],[d,c,b]) ? 
      9    2  Call: append([d,c,b],[a],_287) ? 
      9    2  Exit: append([d,c,b],[a],[d,c,b,a]) ? 
      1    1  Exit: naiverev([a,b,c,d],[d,c,b,a]) ? 

R = [d,c,b,a]

(1 ms) yes
{trace}
```

its work, but very inefficient

### Reverse using accumulator

```prolog
accRev([H|T],A,R) :-
    accRev(T,[H|A],R).
accRev([],A,A).

rev(L,R) :- accRev(L,[],R).
```

```
| ?- rev([a,b,c,d],R).
      1    1  Call: rev([a,b,c,d],_287) ? 
      2    2  Call: accRev([a,b,c,d],[],_287) ? 
      3    3  Call: accRev([b,c,d],[a],_287) ? 
      4    4  Call: accRev([c,d],[b,a],_287) ? 
      5    5  Call: accRev([d],[c,b,a],_287) ? 
      6    6  Call: accRev([],[d,c,b,a],_287) ? 
      6    6  Exit: accRev([],[d,c,b,a],[d,c,b,a]) ? 
      5    5  Exit: accRev([d],[c,b,a],[d,c,b,a]) ? 
      4    4  Exit: accRev([c,d],[b,a],[d,c,b,a]) ? 
      3    3  Exit: accRev([b,c,d],[a],[d,c,b,a]) ? 
      2    2  Exit: accRev([a,b,c,d],[],[d,c,b,a]) ? 
      1    1  Exit: rev([a,b,c,d],[d,c,b,a]) ? 

R = [d,c,b,a]

(1 ms) yes
{trace}
```

