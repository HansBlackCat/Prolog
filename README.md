# Prolog

Practice-Prolog

## GNU Prolog

### GNU Prolog - Tut

#### Cp1

```bash
% gprolog --init-goal 'write(before), nl' --entry-goal 'write(inside), nl' --query-goal 'append([a,b],[c,d],X)'
```

then output will be

```prolog
| ?- append([a,b],[c,d],X).

X = [a,b,c,d]

yes

| ?-
```

find the lists X and Y such that the concatenation of X and Y is [a,b]

```prolog
| ?- append(X,Y,[a,b,c]).
```

`;` to compute another solution\
`a` to compute all available soultion\

```prolog
(1 ms) yes
| ?- (X=1;X=2).

X = 1 ? ;

X = 2

yes
```

