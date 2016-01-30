:- dynamic marriage/2.
:- dynamic age/2.

% retract -> usuwa z bazy
% X is Y -> sprawdza/ustawia czy X == Y

man(adam).
man(tomek).
man(kuba).
man(tadek).

age(adam, 25).

woman(ewa).
woman(ola).
woman(krysia).
woman(zosia).

parent(adam, kuba).
parent(adam, ola).
parent(zosia, ola).
parent(ola, tomek).
parent(tomek, krysia).

older(X) :- age(X, Y), Y2 is Y+1, retract(age(X, Y)), assert(age(X, Y2)).

wedding(X, Y) :- man(X), woman(Y), not(marriage(X, Z1)), not(marriage(Z2, Y)), assert(marriage(X, Y)).
wedding(X, Y) :- write('Wesela nie bedzie').

father(X, Y) :- man(X), parent(X, Y).

grandfather(X, Y, Z) :- man(X), father(X, Y), parent(Y,Z).

brother(X, Y, Z) :- parent(Y, X), parent(Y, Z), X\=Z.

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

%person(X) :- man(X); woman(X).
person(X) :- woman(X).
person(X) :- man(X).

listp :- write('Osoby to:'), nl, (man(X);woman(X)), write(X), nl, fail.
