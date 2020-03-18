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
`a` to compute all available soultion

```prolog
(1 ms) yes
| ?- (X=1;X=2).

X = 1 ? ;

X = 2

yes
```

```prolog
| ?- (X=1;X=2).

X = 1 ?            % RETURN

yes
```

if press `RETURN` we can stop executing alternatives

```prolog
| ?- X=f(A,B,_,A),A=k.

A = k              % the value of A is displayed also in f/3 for X
X = f(k,B,_,k)     % B is not displayed

yes
```

```prolog
| ?- X='$VARNAME'('Y'),Y='$VAR'(1).

X = Y              % term '$VARNAME'('Y') is displayed as Y
Y = '$VAR'(1)      % term '$VAR'(1) is displayed as is
```

```prolog
| ?- X=Y, Y='$VAR'(1).

X = '$VAR'(1)
Y = '$VAR'(1)

yes
```

