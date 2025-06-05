% Acertijo de los Científicos y sus lab Cinco científicos
% trabajan en un centro de investigación. Cada uno tiene un lab en
% un color diferente y se especializa en una rama distinta de la
% ciencia. Además, cada científico usa un tipo diferente de equipo y
% prefiere una bebida específica mientras trabaja.

% Pistas 
% El científico en el lab rojo investiga en Biología.
%  El físico trabaja en el lab azul.
%  El químico usa un microscopio.
%  La persona en el lab verde toma té.
%  El lab verde está a la derecha del lab blanco.
%  El científico que usa un espectrofotómetro investiga en Química.
%  El investigador del lab amarillo usa una centrífuga.
%  El científico en el lab del centro toma café.
%  El investigador del lab naranja trabaja en Matemáticas.
%  El científico en el primer lab usa un microscopio.
%  El científico que usa una pipeta trabaja junto al que investiga en Física.
%  El científico que usa una balanza trabaja junto al que usa un espectrofotómetro.
%  El investigador que trabaja en Ciencias de la Computación usa una laptop.
%  Uno de los científicos usa un osciloscopio.
%  El científico en el lab negro bebe agua.
%  Preguntas a responder con Prolog
% ¿En qué lab trabaja el científico de Química?  
% ¿Quién usa la pipeta?
% ¿Cuál es la bebida preferida del científico que investiga en Matemáticas?


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

derecha_de(X ,Y) :- Y is X + 1.
al_lado(X, Y) :- (Y is X + 1) ; (Y is X - 1).

solucion(Laboratorios) :-
    length(Laboratorios, 5),
    
    % 1 El cientifico en el laboratorio rojo investiga biologia
    member(lab(_, rojo,biologia,_,_), Laboratorios),

    % 2 El fisico trabaja en el laboratorio azul
    member(lab(_, azul,fisica,_,_), Laboratorios),

    % 3 El quimico usa un microscopio
    member(lab(_, _,quimica,microscopio,_), Laboratorios),

    % 4 La persona en el laboratorio verde toma te
    member(lab(_, verde,_,_,te), Laboratorios),

    % 5 El laboratorio verde esta a la derecha del laboratorio blanco
    member(lab(PosVerde, verde,_,_,_), Laboratorios),
    member(lab(PosBlanco, blanco,_,_,_), Laboratorios),
    derecha_de(PosVerde, PosBlanco),

    % 6 El cientifico que usa un espectrofotometro investiga en quimica
    member(lab(_, _,quimica,espectrofotometro,_), Laboratorios),

    % 7 El investigador del laboratorio amarillo usa una centrifuga
    member(lab(_, amarillo,_,centrifuga,_), Laboratorios),

    % 8 El cientifico en el laboratorio del centro toma cafe
    member(lab(3, _,_,_,cafe), Laboratorios),

    % 9 El investigador del laboratorio naranja trabaja en matematicas
    member(lab(_, naranja,matematicas,_,_), Laboratorios),

    % 10 El cientifico en el primer laboratorio usa un microscopio
    member(lab(1, _,_,microscopio,_), Laboratorios),

    % 11 El cientifico que usa una pipeta trabaja junto al que investiga en fisica
    member(lab(PosPipeta, _,_,pipeta,_), Laboratorios),
    member(lab(PosFisica, _,fisica,_,_), Laboratorios),
    al_lado(PosPipeta, PosFisica),

    % 12 El cientifico que usa una balanza traba junto al que usa un espectrofotometro
    member(lab(PosBalanza, _,_,balanza,_), Laboratorios),
    member(lab(PosEspectro, _,quimica,espectrofotometro,_), Laboratorios),
    al_lado(PosBalanza, PosEspectro),

    % 13 El investigador que trabaj en ciencias de la computacion usa una laptop
    member(lab(_, _,computacion,laptop,_), Laboratorios),

    % 14 Uno de los cientificos usa un osciloscopio
    member(lab(_, _,_,osciloscopio,_), Laboratorios),

    % 15 El cientifico en el laboratorio engro bebe agua
    member(lab(_, negro,_,_,agua), Laboratorios).


% En que laboratorio trabaja el cientifico de quimica
laboratorio_quimica(Color) :-
    solucion(Laboratorios),
    member(lab(_,Color,quimica,_,_), Laboratorios).

% Quien usa la pipeta
espe_pipeta(Especializacion) :-
    solucion(Laboratorios),
    member(lab(_,_, Especializacion, pipeta, _), Laboratorios).

% Cual es la bebida preferida del cientifico que investiga en matematicas
bebida_matematicas(Bebida) :-
    solucion(Laboratorios),
    member(lab(_, _, matematicas, _, Bebida), Laboratorios).

