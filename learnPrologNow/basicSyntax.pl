/*
<Atoms>

1. string (butch, m_m)
2. string enclosed in single quotes ('Vincent Van G','Four_Dollar','$^%#')
    'ATOM_NAME', allow spaces between
3. string of special characters (@=, ====>, ;, :-)

<Numbers>
Most Prolog implementations don't support floating or double

<Variables>
Start with Upper-case or Underscore
(X, Y, _tag, X_526)
_ (single underscore) means anonymous variable

<Complex terms>
== structures

(playsAirGuitar(jody), loves(vincent,mia), jealous(marcellous,W))
playsAirGuitar(jody) - functor + arg 
loves(vincent,mia) - functor + args 

recursive definition - it's also complex term
hide(X,father(father(father(butch)))) - functor + arg1(X) + arg2(another complex term)

The number of args that complex term has is called `arity`
woman(mia). - arity:1
loves(vincent,mia). - arity:2
~ usually add suffix `/` followed by number to indicate arity
happy/1
loves/2

*/

/*
| ?- listing.

(1 ms) yes
| ?- [kb2].
compiling /Users/hansblackcat/Documents/Git/Prolog/learnPrologNow/kb2.pl for byte code...
/Users/hansblackcat/Documents/Git/Prolog/learnPrologNow/kb2.pl compiled, 29 lines read - 915 bytes written, 4 ms

yes
| ?- listing.

% file: /Users/hansblackcat/Documents/Git/Prolog/learnPrologNow/kb2.pl

listensToMusic(mia).
listensToMusic(yolanda) :-
        happy(yolanda).

happy(yolanda).

playsAirGuitar(mia) :-
        listensToMusic(mia).
playsAirGuitar(yolanda) :-
        listensToMusic(yolanda).

(1 ms) yes
| ?- listing(playsAirGuitar).

% file: /Users/hansblackcat/Documents/Git/Prolog/learnPrologNow/kb2.pl

playsAirGuitar(mia) :-
        listensToMusic(mia).
playsAirGuitar(yolanda) :-
        listensToMusic(yolanda).

yes

*/