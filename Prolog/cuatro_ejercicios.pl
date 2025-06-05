% Problema 1 - Guardianes de los templos
guardianes(apolo).
guardianes(hecate).
guardianes(ares).
guardianes(hermes).

templos(fuego).
templos(agua).
templos(tierra).
templos(aire).

cuida(apolo, aire).
cuida(hecate, tierra).
cuida(ares, fuego).
cuida(hermes, fuego, agua).
no_cuida(apolo, fuego, tierra ).
no_cuida(hecate, aire, _ ).
no_cuida(ares, agua, aire).

% Problema 2 - Armas de los héroes
heroe(aquiles).
heroe(perseo).
heroe(hercules).
heroe(teseo).

arma(aquiles, lanza).
arma(perseo, escudo).
arma(hercules, espada).
arma(teseo, arco).

% Problema 3 - Las gemas de los titanes
gema(cronos, rubi).
gema(oceano, zafiro).
gema(hiperion, esmeralda).
gema(japeto, diamante).