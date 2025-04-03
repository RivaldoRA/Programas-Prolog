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
