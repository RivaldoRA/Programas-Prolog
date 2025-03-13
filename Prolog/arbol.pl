hombre(jorge).
hombre(agustin).
hombre(ricardo).
hombre(jorgeluis).
hombre(enrique).
hombre(rigoberto).
hombre(obey).
hombre(claudel).
hombre(brady).
hombre(guadalupe).
hombre(rivaldo).
hombre(froylan).
hombre(leobardo).
hombre(odilon).

mujer(esmeraldaprimera).
mujer(veronica).
mujer(esmeraldasegunda).
mujer(belinda).
mujer(marisol).
mujer(abril).
mujer(rosamaria).
mujer(josefina).

padre(jorge).
padre(agustin).
padre(jorgeluis).
padre(enrique).
padre(rigoberto).
padre(obey).
padre(guadalupe).
padre(odilon).

padrede(jorge, agustin).
padrede(jorge, jorgeluis).
padrede(enrique, rigoberto).
padrede(rigoberto, obey).
padrede(rigoberto, claudel).
padrede(rigoberto, brady).
padrede(enrique, guadalupe).
padrede(guadalupe, rivaldo).
padrede(guadalupe, belinda).

madre(esmeraldaprimera).
madre(veronica).
madre(esmeraldasegunda).
madre(marisol).
madre(rosamaria).
madre(josefina).

madrede(esmeraldaprimera, veronica).
madrede(esmeraldaprimera, esmeraldasegunda).
madrede(esmeraldasegunda, rivaldo).
madrede(esmeraldasegunda, belinda).
madrede(esmeraldaprimera, marisol).
madrede(esmeraldaprimera, rosamaria).
madrede(josefina, rigoberto).
madrede(josefina, guadalupe).
madrede(teresa, obey).
madrede(teresa, claudel).
madrede(teresa, brady).

abuelo(X,Y) :- padrede(X, W), padrede(W, Y).
abuela(X,Y) :- madrede(X,W), madrede(W, Y).
nieto(X, Y) :- hombre(X), padrede(W, X), padrede(Y, W); hombre(X), madrede(W, X), madrede(Y, W).
nieta(X, Y) :- mujer(X), padrede(W, X), padrede(Y, W); mujer(X), madrede(W, X), madrede(Y, W).
hermano(X, Y) :- hombre(X), padrede(W, X), padrede(W, Y), madrede(Z, X), madrede(Z, Y).
hermana(X, Y) :- mujer(X), padrede(W, X), padrede(W, Y), madrede(Z, X), madrede(Z, Y).
tio(X, Y) :- padrede(Z, Y), hermano(X, Z).
prov(X) :- hombre(X), padre(X); madre(X), mujer(X).