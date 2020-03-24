%
myAppend([],L,L).
myAppend([H|T],L2,[H|L3]) :-
    myAppend(T,L2,L3).

myPrefix(P,L) :- append(P,_,L).

mySuffix(P,L) :- append(_,P,L).

mySublist(SubL,L) :- 
    suffix(S,L),
    prefix(SubL,S).

%
naiverev([],[]).
naiverev([H|T],R) :-
    naiverev(T,RevT),
    append(RevT,[H],R).

accRev([H|T],A,R) :-
    accRev(T,[H|A],R).
accRev([],A,A).

rev(L,R) :- accRev(L,[],R).

