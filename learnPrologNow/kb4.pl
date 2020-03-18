woman(mia).
woman(jody).
woman(yolanda).

% relations
loves(vincent,mia).
loves(marcellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

/*
| ?- woman(X).

X = mia ? ;

X = jody ? ;

X = yolanda

(1 ms) yes
% Is there any individual X such that Marcellus loves X and X is a woman?
| ?- loves(marcellus,X),woman(X).

X = mia

yes

*/