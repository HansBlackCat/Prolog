# Definite Clause Grammars

Goals

1. introduce `Context Free Grammars`

2. introduce `Definite Clause Grammars`

## Context free grammars

finite collection of rules which tell us that certain sentences are grammatical.

|non-terminal symbols|->|symbols|
|:-:|:-:|:-:|
s|->|np vp
np|->|det n
vp|->|v
det|->|_a_
det|->|_the_
n|->|_woman_
n|->|_man_
v|->|_shoots_

>s, np, vp, det, n, v

These are called non-terminal symbols.

```prolog
s(Z) :- np(X), vp(Y), append(X,Y,Z).
np(Z) :- det(X), n(Y), append(X,Y,Z).
vp(Z) :- v(X), np(Y), append(X,Y,Z).
vp(Z) :- v(Z).
det([the]). det([a]).
n([woman]). n([man]).
v([shoots]).
```

```
| ?- s([a,woman,shoots,a,man]).

true ? 

yes
| ?- s(X).

X = [the,woman,shoots,the,woman] ? a

X = [the,woman,shoots,the,man]

X = [the,woman,shoots,a,woman]

X = [the,woman,shoots,a,man]

X = [the,woman,shoots]

X = [the,man,shoots,the,woman]

X = [the,man,shoots,the,man]

X = [the,man,shoots,a,woman]

X = [the,man,shoots,a,man]

X = [the,man,shoots]

X = [a,woman,shoots,the,woman]

X = [a,woman,shoots,the,man]

X = [a,woman,shoots,a,woman]

X = [a,woman,shoots,a,man]

X = [a,woman,shoots]

X = [a,man,shoots,the,woman]

X = [a,man,shoots,the,man]

X = [a,man,shoots,a,woman]

X = [a,man,shoots,a,man]

X = [a,man,shoots]

(1 ms) yes
| ?- np([a,woman]).

true ? 

yes
```

