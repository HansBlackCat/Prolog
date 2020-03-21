% member
% Like this
% member(X,[X|T]).
% member(X,[H|T]) :- member(X,T).

myMember(X,[X|_]).
myMember(X,[_|T]) :- myMember(X,T).

% a2b
a2b([],[]).
a2b([a|Ta],[b|Tb]) :- a2b(Ta,Tb).
