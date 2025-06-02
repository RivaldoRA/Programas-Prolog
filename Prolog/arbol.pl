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

mujer(esmeralda_primera).
mujer(veronica).
mujer(esmeralda_segunda).
mujer(belinda).
mujer(marisol).
mujer(abril).
mujer(rosamaria).
mujer(josefina).
mujer(teresa).

padrede(jorge, agustin).
padrede(jorge, jorgeluis).
padrede(jorge, veronica).
padrede(jorge, esmeralda_segunda).
padrede(jorge, marisol).
padrede(jorge, rosamaria).
padrede(jorge, veronica).
padrede(enrique, rigoberto).
padrede(enrique, guadalupe).
padrede(enrique, froylan).
padrede(enrique, odilon).
padrede(enrique, leobardo).
padrede(rigoberto, obey).
padrede(rigoberto, claudel).
padrede(rigoberto, brady).
padrede(guadalupe, rivaldo).
padrede(guadalupe, belinda).
padrede(odilon, lillian).
padrede(odilon, ximena).

madrede(esmeralda_primera, veronica).
madrede(esmeralda_primera, esmeralda_segunda).
madrede(esmeralda_primera, marisol).
madrede(esmeralda_primera, rosamaria).
madrede(esmeralda_primera, jorgeluis).
madrede(esmeralda_segunda, rivaldo).
madrede(esmeralda_segunda, belinda).
madrede(rosamaria, jorge_segundo).
madrede(rosamaria, karen).
madrede(marisol, abril).
madrede(josefina, rigoberto).
madrede(josefina, guadalupe).
madrede(josefina, froylan).
madrede(josefina, odilon).
madrede(josefina, leobardo).
madrede(teresa, obey).
madrede(teresa, claudel).
madrede(teresa, brady).
madrede(karla, lillian).
madrede(karla, ximena).

hijode(X,Y) :- hombre(X), (padrede(Y,X) ; madrede(Y, X)).
hijade(X,Y) :- mujer(X), (padrede(Y,X) ; madrede(Y, X)).

abuelode(X,Y) :- padrede(X, W), (padrede(W, Y) ; madrede(W,Y)).
abuelade(X,Y) :- madrede(X,W), (padrede(W, Y) ; madrede(W,Y)).

nietode(X, Y) :- hombre(X), (abuelode(Y,X) ; abuelade(Y,X)).
nietade(X, Y) :- mujer(X), (abuelode(Y,X) ; abuelade(Y,X)).

hermano(X, Y) :- X\=Y, ( (padrede(P,X), padrede(P,Y)) ; (madrede(M,X), madrede(M,Y)) ).

hermanode(X, Y) :- hombre(X), hermano(X,Y).
hermanade(X, Y) :- mujer(X), hermano(X,Y).

tiode(X, Y) :- hombre(X), (padrede(Z, Y) ; madrede(Z, Y)), hermanode(X, Z).
tiade(X, Y) :- mujer(X),  (padrede(Z, Y) ; madrede(Z, Y)), hermanade(X, Z).

primode(X, Y) :- hombre(X), (padrede(Z,Y) ; madrede(Z,Y)), (tiode(Z,X) ; tiade(Z,X)).
primade(X, Y) :- mujer(X), (padrede(Z,Y) ; madrede(Z,Y)), (tiode(Z,X) ; tiade(Z,X)).

sobrinode(X ,Y) :- hombre(X), (padrede(Z, X) ; madrede(Z, X)), (hermanode(Z, Y) ; hermanade(Z, Y)).
sobrinade(X ,Y) :- mujer(X), (padrede(Z, X) ; madrede(Z, X)), (hermanode(Z, Y) ; hermanade(Z, Y)).
