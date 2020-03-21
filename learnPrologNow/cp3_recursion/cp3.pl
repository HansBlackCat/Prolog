% Recursion def
is_digesting(X,Y) :- just_ate(X,Y).
is_digesting(X,Y) :-
    just_ate(X,Z),
    is_digesting(Z,Y).

just_ate(mosquito,blood(john)).
just_ate(frog,mosquito).
just_ate(stork,frog).

% Descendant
child(martha,charlotte).
child(charlotte,caroline).
child(caroline,laura).
child(laura,rose).

descend(X,Y) :- child(X,Y).
descend(X,Y) :- 
    child(X,Z),
    descend(Z,Y).

% Successor

% 0 is numeral.
% if X is a numeral, then so is succ(X).

numeral(0).
numeral(succ(X)) :- numeral(X).

add(0,Y,Y).
add(succ(X),Y,succ(Z)) :-
    add(X,Y,Z).