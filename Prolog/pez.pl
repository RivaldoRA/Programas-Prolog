% En una calle hay cinco casas, cada una de un color distinto.  En cada
% casa vive una persona de distinta nacionalidad.  Cada dueño bebe un
% único tipo de bebida, fuma una sola marca de cigarrillos y tiene una
% mascota diferente a sus vecinos.  A partir de las 15 pistas
% presentadas a continuación, la consigna que hay que responder es:
% "¿Quién es el dueño del pez?".
 
% El británico vive en la casa roja.
% El sueco tiene un perro como mascota.
% El danés toma té.
% El noruego vive en la primera casa.
% El alemán fuma Prince.
% La casa verde está inmediatamente a la izquierda de la blanca.
% El dueño de la casa verde bebe café.
% El propietario que fuma Pall Mall cría pájaros.
% El dueño de la casa amarilla fuma Dunhill.
% El hombre que vive en la casa del centro bebe leche.
% El vecino que fuma Blends vive al lado del que tiene un gato.
% El hombre que tiene un caballo vive al lado del que fuma Dunhill.
% El propietario que fuma Bluemaster toma cerveza.
% El vecino que fuma Blends vive al lado del que toma agua.
% El noruego vive al lado de la casa azul.

nacionalidad(britanico).
nacionalidad(sueco).
nacionalidad(danes).
nacionalidad(noruego).
nacionalidad(aleman).

color(roja).
color(verde).
color(blanca).
color(amarilla).
color(azul).

bebida(te).
bebida(cafe).
bebida(leche).
bebida(cerveza).
bebida(agua).

cigarrillos(prince).
cigarrillos(pall_mall).
cigarrillos(dunhill).
cigarrillos(blends).
cigarrillos(bluemaster).

mascota(perro).
mascota(pajaro).
mascota(gato).
mascota(caballo).
mascota(pez).

izquierda_de(X,Y) :- Y is X + 1.
al_lado(X, Y) :- izquierda_de(X,Y).
al_lado(X, Y) :- izquierda_de(Y,X).

solucion(Casas) :-
    length(Casas, 5),
    % Posicion, Dueño, Color, Toma, Fuma, Mascota
    member(casa(1, _, _, _, _, _), Casas),
    member(casa(2, _, _, _, _, _), Casas),
    member(casa(3, _, _, _, _, _), Casas),
    member(casa(4, _, _, _, _, _), Casas),
    member(casa(5, _, _, _, _, _), Casas),

    % 1 Británico vive en la casa roja
    member(casa(_, britanico, roja, _, _, _), Casas),

    % 2 El sueco tiene un perro como mascota
    member(casa(_, sueco, _, _, _, perro), Casas),

    % 3 El danes toma tec
    member(casa(_, danes, _, te, _, _), Casas),
    
    % 4 El noruego vive en la primera casa
    member(casa(1, noruego, _, _, _, _), Casas),

    % 5 El aleman fuma prince
    member(casa(_, aleman, _, _, prince, _), Casas),

    % 6 La casa verde esta inmediatamente a la izquierda de la blanca
    member(casa(PosicionVerde, _, verde, _, _, _), Casas),
    member(casa(PosicionBlanca, _, blanca, _, _, _), Casas),
    izquierda_de(PosicionVerde, PosicionBlanca),

    % 7 El dueño de la casa verde bebe cafe
    member(casa(_, _, verde, cafe, _, _), Casas),

    % 8 El que fuma Pall Mall cria pajaros
    member(casa(_, _, _, _, pall_mall, pajaro), Casas),

    % 9 El dueño de la casa amarilla fuma dunhill
    member(casa(_, _, amarila, _, dunhill, _), Casas),

    % 10 El hombre que vive en la casa del centro bebe leche
    member(casa(3, _, _, leche, _, _), Casas),

    % 11 El vecino que fuma blends vive al lado del que tiene un gato
    member(casa(PosicionBlends, _, _, _, blends, _), Casas),
    member(casa(PosicionGato, _, _, _, _, gato), Casas),
    al_lado(PosicionBlends, PosicionGato),

    % 12. El hombre que tiene un caballo vive al lado del que fuma Dunhill.
    member(casa(PosicionCaballo, _, _, _, _, caballo), Casas),
    member(casa(PosicionDunhill, _, _, _, dunhill, _), Casas),
    al_lado(PosicionCaballo, PosicionDunhill),

    % 13. El propietario que fuma Bluemaster toma cerveza.
    member(casa(_, _, _, cerveza, bluemaster, _), Casas),

    % 14. El vecino que fuma Blends vive al lado del que toma agua.
    member(casa(PosicionBlends2, _, _, _, blends, _), Casas),
    member(casa(PosicionAgua, _, _, agua, _, _), Casas),
    al_lado(PosicionBlends2, PosicionAgua),

    % 15. El noruego vive al lado de la casa azul.
    member(casa(PosicionNoruego, noruego, _, _, _, _), Casas),
    member(casa(PosicionAzul, _, azul, _, _, _), Casas),
    al_lado(PosicionNoruego, PosicionAzul).

% Para preguntar quien es el dueño del pez
dueno_del_pez(Nacionalidad) :-
    solucion(Casas),
    member(casa(_, Nacionalidad, _, _, _, pez), Casas).