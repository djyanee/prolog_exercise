:- dynamic mebel/1.
:- dynamic znajdujeSieW/1.
:- dynamic znajdujeSieW/2.
:- dynamic obok/1.
:- dynamic obok/2.
:- dynamic na/1.
:- dynamic na/2.

% pokoje
pokoj(lazienka).
pokoj(korytarz).
pokoj(salon).
pokoj(kuchnia).
pokoj(toaleta).

% drzwi
drzwi(lazienka,korytarz).
drzwi(salon,korytarz).
drzwi(toaleta,korytarz).
drzwi(salon,kuchnia).
drzwi(korytarz,wyjscie).

% meble
mebel(szafka).
mebel(kaloryfer).
mebel(lustro).
mebel(wanna).
mebel(umywalka).
mebel(pralka).
mebel(malaSzafa).
mebel(wieszaki).
mebel(obraz).
mebel(duzaSzafa).
mebel(dywanik).
mebel(stolik).
mebel(malaSzafka).
mebel(kanapa).
mebel(okno).
mebel(tv).
mebel(lampka).
mebel(szafki).
mebel(sztucce).
mebel(blat).
mebel(noze).
mebel(zlew).
mebel(kuchenka).
mebel(kibelek).

% wyposazenie
% - lazienka
znajdujeSieW(lazienka,malaSzafka).
znajdujeSieW(lazienka,kaloryfer).
znajdujeSieW(lazienka,lustro).
znajdujeSieW(lazienka,wanna).
znajdujeSieW(lazienka,umywalka).
znajdujeSieW(lazienka,pralka).

% - korytarz
znajdujeSieW(korytarz,malaSzafa).
znajdujeSieW(korytarz,wieszaki).

% - salon
znajdujeSieW(salon,obraz).
znajdujeSieW(salon,duzaSzafa).
znajdujeSieW(salon,dywanik).
znajdujeSieW(salon,stolik).
znajdujeSieW(salon,szafka).
znajdujeSieW(salon,kanapa).
znajdujeSieW(salon,okno).
znajdujeSieW(salon,tv).
znajdujeSieW(salon,lampka).

% - kuchnia
znajdujeSieW(kuchnia,szafki).
znajdujeSieW(kuchnia,sztucce).
znajdujeSieW(kuchnia,blat).
znajdujeSieW(kuchnia,noze).
znajdujeSieW(kuchnia,zlew).
znajdujeSieW(kuchnia,kuchenka).

% - toaleta
znajdujeSieW(toaleta,kibelek).

% zaleznosci przestrzenne
% - lazienka
na(umywalka,lustro).
obok(pralka,umywalka).
obok(malaSzafka,umywalka).
obok(wanna,malaSzafka).

% - korytarz
% PUSTO

% - salon
obok(duzaSzafa,szafka).
na(szafka,telewizor).
obok(kanapa,stolik).
na(stolik,lampka).
obok(stolik,okno).

% - kuchnia
na(szafki,sztucce).
obok(szafki,zlew).
obok(zlew,blat).
na(blat,noze).
obok(blat,kuchenka).

% - zwiazki automatyczne
znajdujeSieW(X) :- znajdujeSieW(Y,X), write(Y).
na(X) :- na(X,Y), write(Y).
pod(X) :- na(Y,X), write(Y).
obok(X) :- (obok(X,Y);obok(Y,X)), write(Y).
pomiedzy(X,Y) :- (obok(X,Z);obok(Z,X)), (obok(Y,Z);obok(Z,Y)), na(Z,N), write(Z), nl, write(N), nl.
mebleW(X) :- znajdujeSieW(X,Y), write(Y), nl, fail.
wszystkieMeble :- mebel(X), write(X), nl, fail.

% dynamika
wyrzucMebel(X) :- retract(mebel(X)), retractall(znajdujeSieW(Y,X)), retractall(obok(X,Y)), retractall(obok(Y,X)), retractall(na(X,Y)), retractall(na(Y,X)).
kupMebel(X) :- assert(mebel(X)).
wstawMebel(X,Y) :- assert(znajdujeSieW(X,Y)).
