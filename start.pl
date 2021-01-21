:- dynamic lvl/2.
:- dynamic plecak/1.
:- dynamic pozycja/1.
man(adam).
man(wojtek).
man(arek).

woman(ela).
woman(ala).
woman(ola).

polaczenie(las, polana).
polaczenie(polana, mokradla).
polaczenie(mokradla, legowisko).

droga(X,Y) :- polaczenie(X,Y), write('->'), write(Y).
droga(X,Y) :- polaczenie(X,Z), write('->'), write(Z), droga(Z,Y).


pozycja(las).

idz(X) :- pozycja(Y), polaczenie(Y, X), retract(pozycja(Y)), assert(pozycja(X)).
idz(X) :- write('Nie moge isc do '), write(X).

plecak(['klucz', 'bateria', 'ipad']).
wypisz_liste([H|T]) :- write(H), nl, wypisz_liste(T).
rzeczy :- plecak(X), wypisz_liste(X).
dodaj(X) :- plecak(Y), append(Y, [X], Z), retract(plecak(Y)), assert(plecak(Z)).

lvl(ela, 18).
older(X) :- lvl(X,Y), Y1 is Y+1, retract(lvl(X,Y)), assert(lvl(X, Y1)).

wejscie(X) :- lvl(X,Y), Y>20 -> write('wchodzisz');  write('masz za niski level').




parent(adam, ela).
parent(ela, ala).
parent(ala, wojtek).


mother(X, Y) :- woman(X), parent(X,Y).
person(X) :- woman(X)  ;  man(X).

