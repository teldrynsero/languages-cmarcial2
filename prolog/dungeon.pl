/* Dungeon Escape: Adventure Game by Christina Marcial and based on SPIDER by David Matuszek
        Reference: https://gist.github.com/JosephLenton/3191695
        Run game using start. command */

:- dynamic at/2, i_am_at/1.
/* Needed by SWI-Prolog. */
:- retractall(at(_, _)), retractall(i_am_at(_)).

/* Starting room */
i_am_at(jailcell).

/* Connecting rooms */
path(jailcell, w, jailcelldoor) :- at(key, in_hand).
path(jailcell, w, jailcelldoor) :-
        write('You rattle the locked bars of your cell. It is locked.'), nl,
        !, fail.

path(jailcelldoor, e, jailcell).

path(jailcelldoor, w, jail).

/* path(jail, e, jailcelldoor). */

/* Item locations */
at(key, jailcell).

/* Pick up objects */
take(X) :-
        at(X, in_hand),
        write('You are already holding that.'),
        nl, !.

take(X) :-
        i_am_at(Place),
        at(X, Place),
        retract(at(X, Place)),
        assert(at(X, in_hand)),
        write('You have picked it up.'),
        nl, !.

take(_) :-
        write('The item you want to pick up is not here.'),
        nl.

/* Directions to go */
n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).

/* How to move in directions */
go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assert(i_am_at(There)),
        look, !.

go(_) :-
        write('You cannot go that way.').
                                       
/* Look at current location */
look :-
        i_am_at(Place),
        describe(Place),
        nl,
        notice_objects_at(Place),
        nl.
                                       
/* Noticing objects in location */
notice_objects_at(Place) :-
        at(X, Place),
        write('There appears to be a '), write(X), write(' on the ground here.'), nl,
        fail.

notice_objects_at(_).
                                                      
finish :-
        nl,
        write('Enter the halt. command to exit the game.'),
        nl, !.
                                                                           
/* Game instructions */
instructions :-
        nl,
        write('Enter commands using standard Prolog syntax.'), nl,
        write('Available commands are:'), nl,
        write('start. -- to start the game.'), nl,
        write('n. s. e. w. -- to go in that direction.'), nl,
        write('take(Object). -- to pick up an object.'), nl,
        write('look. -- to look around you again.'), nl,
        write('instructions. -- to see this message again.'), nl,
        write('halt. -- to end the game and quit.'), nl,
        nl.

/* Start game */
start :-
        instructions,
        look.
                                                  
/* Room descriptions */
describe(jailcell) :-
        write('You wake up and find yourself in a dark, dank room.'), nl,
        write('You recall the night before you tried to rob the crown jewels'), nl,
        write('and got caught, sent by the guards to rot in the castle dungeon.'), nl,
        write('The only visible light is a faint touch outside the bars'), nl,
        write('of your jail cell, which is to the west. You should try to'), nl,
	write('escape while no guards appear to be around...'), nl.
                                      
describe(jailcelldoor) :-
	write('You carefully use the key to open your cell door; success!'), nl,
	write('If you keep moving west, you can get out of your cell and'), nl,
	write('escape the dungeon.'), nl.
                                   
describe(jail) :-
        at(key, in_hand),
        write('Upon leaving your cell, you see stairs leading upwards.'), nl,
        write('You climb up them and successfully escape the castle.'), nl,
        write('Game won!'), nl,
        finish, !.