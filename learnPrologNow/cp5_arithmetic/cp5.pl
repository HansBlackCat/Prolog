%
add_3_and_double(X,Y) :-
    Y is (X+3)*2.

add_3_and_double2(X,Y) :-
    Y is (X+3)*2.

mylen([],0).
mylen([_|T],N) :-
    mylen(T,X), N is X+1.

accLen([_|Tail],Acc,Length) :-
    Accnew is Acc+1,
    accLen(Tail,Accnew,Length).
accLen([],Acc,Acc).