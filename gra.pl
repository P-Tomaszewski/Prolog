:- dynamic lvl/2.
:- dynamic plecak/1.
:- dynamic pozycja/1.

cel() :- write('przejdz wszystkie plansze i pokonaj bosa, pamietaj zeby przeszukiwac plansze').
opis() :- write('Twoja postac to wojownik, zaczynasz z pierwszym levelem | plansze: polana - las - mokradla - krypta - legowiskopotwora'), nl.

bohater(wojownik).
lvl(wojownik, 1).


polaczenie(polana, las).
polaczenie(las, mokradla).
polaczenie(mokradla, krypta).
polaczenie(krypta, legowiskopotwora).
polaczenie(legowiskopotwora, polana).



droga(X,Y) :- polaczenie(X,Y), write('->'), write(Y).
droga(X,Y) :- polaczenie(X,Z), write('->'), write(Z), droga(Z,Y).



idz(X) :- pozycja(Y), polaczenie(Y, X), retract(pozycja(Y)), assert(pozycja(X)).
idz(X) :- write('Nie moge isc do '), write(X).


pozycja(polana).

plecak(['buty']).
wypisz_liste([H|T]) :- write(H), nl, wypisz_liste(T).
rzeczy :- plecak(X), wypisz_liste(X).
dodaj(X) :- plecak(Y), append(Y, [X], Z), retract(plecak(Y)), assert(plecak(Z)).
lista(X) :- length([plecak], X).


przeszukaj(X) :- pozycja(X), X == las ->write('Zdobywasz miecz'), dodaj('miecz'), nl.
przeszukaj(X) :- pozycja(X), X == mokradla ->write('Zdobywasz zbroje'), dodaj('zbroja'), nl.
przeszukaj(X) :- pozycja(X), X == krypta ->write('Zdobywasz tarcze'), dodaj('tarcza'), nl.
przeszukaj(X) :- pozycja(X), write('pusto'), nl.

cwicz(X) :- lvl(X,Y), Y1 is Y+1, retract(lvl(X,Y)), assert(lvl(X, Y1)).

walcz(X) :- lista(X), X<3 -> write('Nie zebrales ekwipunku, wroc  uzbrojony'), nl.
walcz(X) :- lvl(X,Y), Y>5 -> write('Pokonales potwora, misja zakonczona'), dodaj('trofeum');  
write('masz za niski level - pocwicz').








