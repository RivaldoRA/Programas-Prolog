color(rojo).
color(azul).
color(verde).
color(blanco).
color(amarillo).
color(naranja).
color(negro).

especializacion(biologia).
especializacion(quimica).
especializacion(matematicas).
especializacion(fisica).
especializacion(computacion).

instrumento(microscopio).
instrumento(espectrofotometro).
instrumento(centrifuga).
instrumento(pipeta).
instrumento(balanza).
instrumento(laptop).
instrumento(osciloscopio).

bebida(te).
bebida(cafe).
bebida(agua).

hecho(laboratorio(rojo,biologia,_,_)).
hecho(laboratorio(azul,fisica,_,_)).
hecho(laboratorio(_,quimica,microscopio,_)).
hecho(laboratorio(verde,_,_,te)).
hecho(laboratorio(verde,_,_,_)).
hecho(laboratorio(_,quimica,espectrofotometro,_)).
hecho(laboratorio(amarillo,_,centrifuga,_)).
hecho(laboratorio(_,_,_,cafe)).
hecho(laboratorio(naranja,matematicas,_,_)).
hecho(laboratorio(_,_,pipeta,_)).
hecho(laboratorio(_,_,balanza,_)).
hecho(laboratorio(_,computacion,laptop,_)).
hecho(laboratorio(_,_,osciloscopio,_)).
hecho(laboratorio(negro,_,_,agua)).

p(X, Y) :- X > 15, Y > 50.
p(X, Y) :- X > Y. 

q(X, Y) :- X > 15, !, Y > 50.
q(X, Y) :- X > Y.

factorial(0, 1).

factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.


fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,F) :- N > 1, F1 is N - 1, N2 is N - 2, fibonacci(N1, F1), fibonacci(N2, F2), F is F1 + F2.

%derecha(X,Y, [Y, X] ]).
%derecha(X,Y, [ |, Resto}]) :- derecha(X, Y Resto).