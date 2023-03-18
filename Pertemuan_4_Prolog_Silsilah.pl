laki_laki(david).
laki_laki(jack).
laki_laki(john).
laki_laki(ray).
laki_laki(peter).

perempuan(amy).
perempuan(karen).
perempuan(liza).
perempuan(susan).
perempuan(mary).

menikah(david, amy).
menikah(jack, karen).
menikah(john, susan).

ayah(david, liza).
ayah(david, john).
ayah(jack, susan).
ayah(jack, ray).
ayah(john, peter).
ayah(john, mary).

bunda(amy, liza).
bunda(amy, john).
bunda(karen, susan).
bunda(karen, ray).
bunda(susan, peter).
bunda(susan, mary).

ayah(X, Y) :-
	ayah(X, Y).

bunda(X, Y) :- 
	bunda(X, Y).

pasangan(X, Y) :- 
	(menikah(X, Y) ; menikah(Y, X)).

orangtua(X, Y) :- 
	(ayah(X, Y) ; bunda(X, Y)).

anak(X, Y) :- 
	(ayah(Y, X) ; bunda(Y, X)).

saudara(Y, Z) :- 
	orangtua(X, Y), 
	orangtua(X, Z).

ipar(X, Y) :- 
  not(pasangan(X,Y)),
    ((saudara(X, W),pasangan(W, V)) ; pasangan(X, V)),
    saudara(V, Y).

kakek(X, Z) :- 
	ayah(X, Y), 
	anak(Z, Y).

nenek(X, Z) :- 
	bunda(X, Y), 
	anak(Z, Y).

cucu(X, Y) :- 
	(kakek(Y, X) ; nenek(Y, X)).

om(X, Y) :- 
	laki_laki(X), saudara(X, Z), 
	anak(Y, Z).

tante(X, Y) :-  
	perempuan(X), 
	saudara(X, Z), 
	anak(Y, Z).
