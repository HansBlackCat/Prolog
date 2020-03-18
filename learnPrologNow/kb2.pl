listensToMusic(mia).
listensToMusic(yolanda):- happy(yolanda).

happy(yolanda).

playsAirGuitar(mia) :- listensToMusic(mia). 
playsAirGuitar(yolanda) :- listensToMusic(yolanda). 

/*
contains 
5 clause,
3 rules,
2 facts

3 predicates(listensToMusic, happy, playsAirGuitar)


*/

/*
| ?- playsAirGuitar(mia).

yes

% modus ponens
| ?- playsAirGuitar(yolanda).

yes
*/
