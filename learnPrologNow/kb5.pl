% 4 relations(facts)
loves(vincent,mia).
loves(marcellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

% 1 rule
jealous(X,Y) :- loves(X,Z),loves(Y,Z).

/*
| ?- jealous(marcellus,W).

W = vincent ? a

W = marcellus

(1 ms) no

*/