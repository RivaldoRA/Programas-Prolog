% Problema 1 - Guardianes de los templos
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
nocuida(hecate, aire).
nocuida(ares, agua).
nocuida(ares, aire).
nocuida(hermes, tierra).
nocuida(hermes, aire).

cuida(X, Y) :-
    guardianes(X),
    templos(Y),
    \+ nocuida(X, Y).

% Problema 2 - Armas de los héroes
heroe(aquiles).
heroe(perseo).
heroe(hercules).
heroe(teseo).

arma(espada).
arma(lazn).
arma().
arma().