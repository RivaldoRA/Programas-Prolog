guardianes(apolo).
guardianes(hecate).
guardianes(ares).
guardianes(hermes).

templos(fuego).
templos(agua).
templos(tierra).
templos(aire).

nocuida(apolo, fuego).
nocuida(apolo, tierra).
nocuida(apolo, _).
nocuida(hecate, aire).
nocuida(hecate, _).
nocuida(hecate, _).
nocuida(ares, agua).
nocuida(ares, aire).
nocuida(ares, _).
nocuida(hermes, tierra).
nocuida(hermes, aire).
nocuida(hermes, _).

cuida(apolo, _).
cuida(hecate, _).
cuida(ares, _).
cuida(hermes, _).

% cuida(X,Y) :- nocuida(X,Z), cuida(X, Y), \+ cuida(X, Z).
% elnocuida(X,Y) :- cuida(X, Z), nocuida(X, Y), templos(Z).




