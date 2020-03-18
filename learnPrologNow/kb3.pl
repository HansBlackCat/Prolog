happy(vincent).

listensToMusic(butch).

playsAirGuitar(vincent) :-
    % `,` means `and`
    % vincent plays air guitar if he listens to music and is happy
    listensToMusic(vincent),
    happy(vincent).
% if `either` ~
playsAirGuitar(butch) :-
    happy(butch).
playsAirGuitar(butch) :-
    listensToMusic(butch).
/*
Same as
playsAirGuitar(butch) :-
    % `;` means `or`
    happy(butch);
    listensToMusic(butch).
*/


/*
| ?- playsAirGuitar(vincent).

no
| ?- playsAirGuitar(butch).

yes

*/