# Prolog

Practice-Prolog

## GNU Prolog

### GNU Prolog Manual

[Source from GNU-Prolog Manual](http://www.gprolog.org/manual/gprolog.html)

#### GNU REPL

##### REPL Basic

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

Example 1

```prolog
| ?- X='$VARNAME'('Y'),Y='$VAR'(1).

X = Y              % term '$VARNAME'('Y') is displayed as Y
Y = '$VAR'(1)      % term '$VAR'(1) is displayed as is
```

Example 2

```prolog
| ?- X=Y, Y='$VAR'(1).

X = '$VAR'(1)
Y = '$VAR'(1)

yes
```

In Ex1, `X` is explicity bound to `'$VARNAME'('Y')` by the query.\
So the top-level displays `Y` as the value of `X`.

`Y` is unified with `'$VAR'(1)`.\
So the top-level displays it as a normal compund term.

Note that `X` is not bound to `Y`

```prolog
| ?- retractall(p(_)),assertz(p(0)),
repeat,
retract(p(X)),
Y is X+1,
assertz(p(Y)),
X = 1000,!.

X = 1000
Y = 1001

(4 ms) yes
```

##### Consulting a Prolog Prog

```prolog
| ?- [user].
compiling user for byte code...
even(0).           % Enter Newline
even(s(s(X))):-
even(X).
                   % Press C-D to end input
user compiled, 3 lines read - 321 bytes written, 128352 ms

(1 ms) yes
| ?- listing.

% file: user

even(0).
even(s(s(A))) :-
        even(A).

% file: user_input

p(1001).

yes
```

##### Scripting Prolog

```
% Shebang support
#!/usr/bin/gprolog --consult-file
```