# Cp5 Arithmetic

## Arithmetic in Prolog

```
| ?- 8 is 6+2.

yes
| ?- 12 is 6*2.

yes
| ?- 1 is mod(7,2).

yes
| ?- X is 6/2.

X = 3.0

yes
```

```prolog
add_3_and_double(X,Y) :-
    Y is (X+3)*2.
```

```
| ?- add_3_and_double(1,X).

X = 8

yes
```

More specify

```
| ?- X is 3+2.

X = 5

yes
| ?- X = 3+2.

X = 3+2

yes
```

`is` notation is different from `=`.\
`is` seperates front and back terms, so makes expression **_not_** treated as complex-term.

```
| ?- X is 6+2.

X = 8

yes
| ?- 6+2 is X.
uncaught exception: error(instantiation_error,(is)/2)
```

more complex example

```prolog
add_3_and_double2(X,Y) :-
    Y is (X+3)*2.
```

```
| ?- add_3_and_double2(X,12).
uncaught exception: error(instantiation_error,(is)/2)
| ?- add_3_and_double2(3,X). 

X = 12

yes
```

use `is` to force evaluation.

## Arithmetic and lists

```prolog
mylen([],0).
mylen([_|T],N) :-
    mylen(T,X), N is X+1.
```

```
| ?- mylen([a,b,c,d,e,[f,g],h],X).

X = 7

yes

| ?- mylen([a,b,c],X).
      1    1  Call: mylen([a,b,c],_285) ? 
      2    2  Call: mylen([b,c],_354) ? 
      3    3  Call: mylen([c],_378) ? 
      4    4  Call: mylen([],_402) ? 
      4    4  Exit: mylen([],0) ? 
      5    4  Call: _430 is 0+1 ? 
      5    4  Exit: 1 is 0+1 ? 
      3    3  Exit: mylen([c],1) ? 
      6    3  Call: _459 is 1+1 ? 
      6    3  Exit: 2 is 1+1 ? 
      2    2  Exit: mylen([b,c],2) ? 
      7    2  Call: _285 is 2+1 ? 
      7    2  Exit: 3 is 2+1 ? 
      1    1  Exit: mylen([a,b,c],3) ? 

X = 3

(1 ms) yes
{trace}
```

### Accumulator in list

```prolog
accLen([_|Tail],Acc,Length) :-
    Accnew is Acc+1,
    accLen(Tail,Accnew,Length).
accLen([],Acc,Acc).
```

```
| ?- accLen([a,b,c,d,e],0,Y).
      1    1  Call: accLen([a,b,c,d,e],0,_289) ? 
      2    2  Call: _362 is 0+1 ? 
      2    2  Exit: 1 is 0+1 ? 
      3    2  Call: accLen([b,c,d,e],1,_289) ? 
      4    3  Call: _415 is 1+1 ? 
      4    3  Exit: 2 is 1+1 ? 
      5    3  Call: accLen([c,d,e],2,_289) ? 
      6    4  Call: _468 is 2+1 ? 
      6    4  Exit: 3 is 2+1 ? 
      7    4  Call: accLen([d,e],3,_289) ? 
      8    5  Call: _521 is 3+1 ? 
      8    5  Exit: 4 is 3+1 ? 
      9    5  Call: accLen([e],4,_289) ? 
     10    6  Call: _574 is 4+1 ? 
     10    6  Exit: 5 is 4+1 ? 
     11    6  Call: accLen([],5,_289) ? 
     11    6  Exit: accLen([],5,5) ? 
      9    5  Exit: accLen([e],4,5) ? 
      7    4  Exit: accLen([d,e],3,5) ? 
      5    3  Exit: accLen([c,d,e],2,5) ? 
      3    2  Exit: accLen([b,c,d,e],1,5) ? 
      1    1  Exit: accLen([a,b,c,d,e],0,5) ? 

Y = 5

(1 ms) yes
{trace}
```

## Compare Integers

Arithmetic examples | Prolog Notation
$x<y$ | $x =<y.$

