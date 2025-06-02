
% Temas proyecto
% Rubeola
% VPH
% Investigar enfermedades
% Hechos monarios, binarios: sintoma, enfermedad, region, ver datos que agregar

:- include("enfermedades.pl").
:- include("arbol.pl").
:- include("adivina.pl").

eliza:-	writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
	readln(Input),
	eliza(Input),!.

eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.

eliza(Input):- Input == ['Hasta', 'luego'],
	writeln('Hasta luego! espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Hasta', 'luego', '.'],
	writeln('Hasta luego! espero poder verte ayudado.'), !.

eliza(Input):- Input == ['Nos', 'vemos', 'pronto'],
	writeln('Adios. nos vemos pronto'), !.
eliza(Input):- Input == ['Nos', 'vemos', 'pronto', '.'],
	writeln('Adios. nos vemos pronto'), !.

eliza(Input):- Input == [bye],
	writeln('Adios. nos vemos pronto'), !.
eliza(Input):- Input == ['~'],
	writeln('Adios. nos vemos pronto'), !.

eliza(Input):- Input == [''],
	writeln(''), !.
eliza(Input):- Input == ['','.'],
	writeln(''), !.

eliza(Input) :-
    template(Stim, Resp, _IndStim),
    match(Stim, Input),
    nth0(0, Resp, X),
    X == flagAkinator,
    !,
    elizaAkinator(),
    writeln('El juego ha terminado. En que mas puedo ayudarte ?'),
    readln(Input1),
    eliza(Input1).

eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.

template([hola, s(_), mi, nombre, es, s(_), '.'], ['Hola', 1, 'Como', estas, tu, '?', yo, soy, 0], [1,5]).
template([buendia, s(_), mi, nombre, es, s(_), '.'], ['Buendia', 1, 'Como', estas, tu, '?', yo, soy, 0], [1,5]).
template([como, estas, s(_), mi, nombre, es, s(_), '.'], ['Hola', 1, 'Como', estas, tu, '?', yo, soy, 0], [2,6]).

template([hola, s(_), yo, soy, s(_), '.'], [hola, 1, mi, nombre, es, 0], [1,4]).
template([buendia, s(_), yo, soy, s(_), '.'], [buendia, 1, mi, nombre, es, 0], [1,4]).
template([como, estas, s(_), yo, soy, s(_), '.'], [como, estas, 1, mi, nombre, es, 0], [2,5]).

template([hi, s(_), i, am, s(_), '.'], ['Hi', 1, i, am, 0], [1,4]).
template([goodmorning, s(_), i, am, s(_), '.'], ['Goodmorning', 1, i, am, 0], [1,4]).
template([how, are, you, s(_), i, am, s(_), '.'], ['Hey', 1, i, am, 0], [3,6]).

template([hola, necesito, de, tu, ayuda, '.'], ['En', que, puedo, ayudarte],[]).
template([buendia, necesito, de, tu, ayuda, '.'], ['En', que, puedo, ayudarte],[]).
template([como, estas, necesito, de, tu, ayuda, '.'], ['En', que, puedo, ayudarte],[]).

template([hola, eres, s(_), '?'],['Si!', soy, 0],[2]).
template([buendia, eres, s(_), '?'],['Si!', soy, 0],[2]).
template([como, estas, eres, s(_), '?'],['Si!', soy, 0],[3]).

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

% Enfermedades

% Preguntar si existe en el sistema experto
template([conoces, la, enfermedad, s(_), _], [flagEnfermedad], [3]).
template([conoces, la, enfermedad, s(_)], [flagEnfermedad], [3]).

% Preguntar por los síntomas de una enfermedad
template([cuales, son, los, sintomas, de, la, s(_), _], [flagSintoma], [6]).
template([cuales, son, los, sintomas, de, el, s(_), _], [flagSintoma], [6]).
template([cuales, son, los, sintomas, de, la, s(_)], [flagSintoma], [6]).
template([cuales, son, los, sintomas, de, el, s(_)], [flagSintoma], [6]).

% Diagnosticar la enfermedad a través de un síntoma y una región
template([tengo , s(_), en, la, s(_)], [flagDiagnosticoRegion], [1,4]).
template([tengo , s(_), en, el, s(_)], [flagDiagnosticoRegion], [1,4]).
template([tengo , s(_), en, la, s(_), _], [flagDiagnosticoRegion], [1,4]).
template([tengo , s(_), en, el, s(_), _], [flagDiagnosticoRegion], [1,4]).

% Diagnosticar la enfermedad a través de dos sintomas
template([tengo , s(_), y, s(_)], [flagDiagnosticoDoble], [1,3]).
template([tengo , s(_), y, s(_), _], [flagDiagnosticoDoble], [1,3]).

% Diagnosticar la enfermedad a través de un síntoma
template([tengo , s(_)], [flagDiagnostico], [1]).

% Preguntar por la region del cuerpo de una enfermedad
template([donde, afecta, la, s(_), _], [flagRegionAfectada], [3]).
template([donde, afecta, el, s(_), _], [flagRegionAfectada], [3]).
template([que, region, afecta, la, s(_), _], [flagRegionAfectada], [4]).
template([que, region, afecta, el, s(_), _], [flagRegionAfectada], [4]).
template([donde, afecta, la, s(_)], [flagRegionAfectada], [3]).
template([donde, afecta, el, s(_)], [flagRegionAfectada], [3]).
template([que, region, afecta, la, s(_)], [flagRegionAfectada], [4]).
template([que, region, afecta, el, s(_)], [flagRegionAfectada], [4]).

% Preguntar en que lugar del mundo prevalece
template([en ,que, parte, del, mundo, se, encuentra, la, s(_)], [flagArea], [8]).
template([en ,que, parte, del, mundo, se, encuentra, el, s(_)], [flagArea], [8]).

% Preguntar como se transmite
template([como, se, transmite, la, s(_)], [flagTransmision], [4]).
template([como, se, transmite, el, s(_)], [flagTransmision], [4]).

% Preguntar como se previene
template([como, se, previene, la, s(_)], [flagPrevencion], [4]).
template([como, se, previene, el, s(_)], [flagPrevencion], [4]).

% Preguntar por los medicamentos
template([que, medicamentos, se, usan, para, el, s(_)], [flagMedicamentos], [6]).
template([que, medicamentos, se, usan, para, la, s(_)], [flagMedicamentos], [6]).

% Preguntar por un especialista
template([que, doctor, me, podria, ayudar, para, el, s(_)], [flagEspecialista], [7]).
template([que, doctor, me, podria, ayudar, para, la, s(_)], [flagEspecialista], [7]).

% Árbol genealógico

% Preguntar si es padre de
template([s(_), es, padre, de, s(_)], [flagPadreDe], [0,4]).
template([es, s(_), el, padre, de, s(_), '?'], [flagPadreDe], [1, 5]).
template([s(_), es, padre, de, s(_), _], [flagPadreDe], [1, 4]).

% Preguntar si es madre de
template([s(_), es, madre, de, s(_)], [flagMadreDe], [0,4]).
template([es, s(_), la, madre, de, s(_), '?'], [flagMadreDe], [1, 5]).
template([s(_), es, madre, de, s(_), _], [flagMadreDe], [1, 4]).

% Preguntar si es hijo de
template([s(_), es, hijo, de, s(_)], [flagHijoDe], [0,4]).
template([es, s(_), el, hijo, de, s(_), '?'], [flagHijoDe], [1, 5]).
template([s(_), es, hijo, de, s(_), _], [flagHijoDe], [1, 4]).

% Preguntar si es hija de
template([s(_), es, hija, de, s(_)], [flagHijaDe], [0,4]).
template([es, s(_), la, hija, de, s(_), '?'], [flagHijaDe], [1, 5]).
template([s(_), es, hija, de, s(_), _], [flagHijaDe], [1, 4]).

% Preguntar si es abuelo de
template([s(_), es, abuelo, de, s(_)], [flagAbueloDe], [0,4]).
template([es, s(_), el, abuelo, de, s(_), '?'], [flagAbueloDe], [1, 5]).
template([s(_), es, abuelo, de, s(_), _], [flagAbueloDe], [1, 4]).

% Preguntar si es abuela de
template([s(_), es, abuela, de, s(_)], [flagAbuelaDe], [0,4]).
template([es, s(_), la, abuela, de, s(_), '?'], [flagAbuelaDe], [1, 5]).
template([s(_), es, abuela, de, s(_), _], [flagAbuelaDe], [1, 4]).

% Preguntar si es hermano de
template([s(_), es, hermano, de, s(_)], [flagHermanoDe], [0,4]).
template([es, s(_), el, hermano, de, s(_), '?'], [flagHermanoDe], [1, 5]).
template([s(_), es, hermano, de, s(_), _], [flagHermanoDe], [1, 4]).

% Preguntar si es hermana de
template([s(_), es, hermana, de, s(_)], [flagHermanaDe], [0,4]).
template([es, s(_), la, hermana, de, s(_), '?'], [flagHermanaDe], [1, 5]).
template([s(_), es, hermana, de, s(_), _], [flagHermanaDe], [1, 4]).

% Preguntar si es tio de
template([s(_), es, tio, de, s(_)], [flagTioDe], [0,4]).
template([es, s(_), el, tio, de, s(_), '?'], [flagTioDe], [1, 5]).
template([s(_), es, tio, de, s(_), _], [flagTioDe], [0,4]).

% Preguntar si es tia de
template([s(_), es, tia, de, s(_)], [flagTiaDe], [0,4]).
template([es, s(_), la, tia, de, s(_), '?'], [flagTiaDe], [1, 5]).
template([s(_), es, tia, de, s(_), _], [flagTiaDe], [0,4]).

% Preguntar si es primo de
template([s(_), es, primo, de, s(_)], [flagPrimoDe], [0,4]).
template([es, s(_), el, primo, de, s(_), '?'], [flagPrimoDe], [1, 5]).
template([s(_), es, primo, de, s(_), _], [flagPrimoDe], [0,4]).

% Preguntar si es prima de
template([s(_), es, prima, de, s(_)], [flagPrimaDe], [0,4]).
template([es, s(_), la, prima, de, s(_), '?'], [flagPrimaDe], [1, 5]).
template([s(_), es, prima, de, s(_), _], [flagPrimaDe], [0,4]).

% Preguntar si es sobrino de
template([s(_), es, sobrino, de, s(_)], [flagSobrinoDe], [0,4]).
template([es, s(_), el, sobrino, de, s(_), '?'], [flagSobrinoDe], [1, 5]).
template([s(_), es, sobrino, de, s(_), _], [flagSobrinoDe], [0,4]).

% Preguntar si es sobrina de
template([s(_), es, sobrina, de, s(_)], [flagSobrinaDe], [0,4]).
template([es, s(_), la, sobrina, de, s(_), '?'], [flagSobrinaDe], [1, 5]).
template([s(_), es, sobrina, de, s(_), _], [flagSobrinaDe], [0,4]).

% Akinator
template([adivina, mi, personaje], [flagAkinator], []).


template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).

				  
template(_, ['Please', explain, a, little, more, '.'], []). 
% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).

% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

% Eliza: Enfermedades
elizaEnfermedad(X, R):- enfermedad(X), R = ['Conozco', la, enfermedad, X].
elizaEnfermedad(X, R):- \+enfermedad(X), R = ['No', conozco, la, enfermedad, X].

% Eliza: Mostrar todos los sintomas de una enfermedad
elizaSintoma(X, R):- 
	sintoma(X, _),
	findall(Sintoma, sintoma(X, Sintoma), ListaSintomas),
	atomic_list_concat(ListaSintomas, ',', SintomasString),
	R = ['La', X, tiene, de, sintomas, SintomasString].

elizaSintoma(X, R):-
	\+sintoma(X, _), R = ['No', tengo, informacion, de, los, sintomas, de, la, X].

% Eliza: Diagnosticar una enfermedad a partir de un sintoma en una región del cuerpo
elizaDiagnosticoRegion(X, Y, R) :-
	sintoma(Z, X),
	region_afectada(Z, Y),
    R = ['Si', tienes, X, en, Y, tienes, Z].

% Eliza: Diagnosticar una enfermedad a partir de dos sintomas
elizaDiagnosticoDoble(X, Y, R) :-
	sintoma(Z, X),
	sintoma(Z, Y),
    R = ['Si', tienes, X, y, Y, puedas, tener, Z].

% Eliza: Diagnosticar una enfermedad a partir de un sintoma que tenga una región definida
elizaDiagnostico(X ,R):- sintoma_region(X,Z), region_afectada(Y,Z), R = ['Puedes', tener, Y, si, tienes, X, en, Z].

% Eliza: Diagnosticar una enfermedad a partir de un sintoma que no tenga una región definida
elizaDiagnostico(X ,R):- sintoma(Z,X), R = ['Es', poco, probable, que, tengas, Z].
elizaDiagnostico(X ,R):- \+sintoma(_, X), R = ['No', se, que, puedas, tener].

% Eliza: Regiones del cuerpo afectadas
elizaRegionAfectada(X, R) :-
    region_afectada(X, _),
    findall(Region, region_afectada(X, Region), ListaRegiones),
	atomic_list_concat(ListaRegiones, ',', RegionesString),
    R = ['La', X, afecta, las, siguientes, regiones, RegionesString].

elizaRegionAfectada(X , R) :- \+region_afectada(X, _), R = ['No', tengo, informacion, sobre, las, regiones, afectadas].

% Regiones geográficas donde son prevalentes
elizaArea(X ,R) :-
	prevalente_en(X, Y),
    R = ['La', X, se, encuentra, principalmente, en, Y].

elizaArea(X ,R) :- \+prevalente_en(X, _), R = ['No', tengo, conocimientos, de, donde, se, encuentra, X].

% Transmisión
elizaTransmision(X, R):-
    transmision(X, _),
    findall(Transmision, transmision(X, Transmision), ListaTransmisiones),
	atomic_list_concat(ListaTransmisiones, ',', TransmisionesString),
    R = ['La', X, se, transmite, de, las, siguientes, formas, TransmisionesString].

elizaTransmision(X ,R) :- \+transmision(X, _), R = ['No', tengo, conocimientos, de, como, se, transmite, X].

% Prevención
elizaPrevencion(X, R):-
    prevencion(X, Y),
    R = [X, se, puede, prevenir, de, la, siguiente, forma, Y].

elizaPrevencion(X ,R) :- \+prevencion(X, _), R = ['No', tengo, conocimientos, de, como, se, previene, X].

% Mediacamentos
elizaMedicamentos(X, R):-
    medicamento(X, _),
    findall(Medicamento, medicamento(X, Medicamento), ListaMedicamentos),
	atomic_list_concat(ListaMedicamentos, ',', MedicamentosString),
    R = [X, cuenta, con, los, siguientes, medicamentos, MedicamentosString].

elizaMedicamentos(X ,R) :- \+prevencion(X, _), R = ['No', tengo, conocimientos, de, los, medicamentos, de, X].

% Especialista
elizaEspecialista(X, R):-
    especialista(X, Y),
    R = [X, puedes, visitar, al, siguiente, especialista:, Y].

elizaEspecialista(X ,R) :- \+especialista(X, _), R = ['No', tengo, conocimientos, de, algun, especialista, de, X].

% Árbol genealógico

% Padre de
elizaPadreDe(X, Y, R) :-
	padrede(X , Y),
	R = ['Correcto',X, es, padre, de, Y].

elizaPadreDe(X, Y, R) :- \+padrede(X , Y), R = ['No',X, no, es, padre, de, Y].

% Madre de
elizaMadreDe(X, Y, R) :-
	madrede(X , Y),
	R = ['Correcto',X, es, madre, de, Y].

elizaMadreDe(X, Y, R) :- \+madrede(X , Y), R = ['No',X, no, es, madre, de, Y].

% Hijo de
elizaHijoDe(X, Y, R) :-
	hijode(X , Y),
	R = ['Correcto',X, es, hijo, de, Y].

elizaHijoDe(X, Y, R) :- \+hijode(X , Y), R = ['No',X, no, es, hijo, de, Y].

% Hija de
elizaHijaDe(X, Y, R) :-
	hijade(X , Y),
	R = ['Correcto',X, es, hija, de, Y].

elizaHijaDe(X, Y, R) :- \+hijade(X , Y), R = ['No',X, no, es, hija, de, Y].

% Abuelo de
elizaAbueloDe(X, Y, R) :-
	abuelode(X, Y),
	R = ['Correcto',X, es, abuelo, de, Y].

elizaAbueloDe(X, Y, R) :- \+abuelode(X , Y), R = ['No',X, no, es, abuelo, de, Y].

% Abuela de
elizaAbuelaDe(X, Y, R) :-
	abuelade(X, Y),
	R = ['Correcto',X, es, abuela, de, Y].

elizaAbuelaDe(X, Y, R) :- \+abuelade(X , Y), R = ['No',X, no, es, abuela, de, Y].

% Hermano de
elizaHermanoDe(X, Y, R) :-
	hermanode(X, Y),
	R = ['Correcto',X, es, hermano, de, Y].

elizaHermanoDe(X, Y, R) :- \+hermanode(X , Y), R = ['No',X, no, es, hermano, de, Y].

% Hermanda de
elizaHermanaDe(X, Y, R) :-
	hermanade(X, Y),
	R = ['Correcto',X, es, hermana, de, Y].

elizaHermanaDe(X, Y, R) :- \+hermanade(X , Y), R = ['No',X, no, es, hermana, de, Y].

% Eliza: Tío de
elizaTioDe(X, Y, R) :-
    tiode(X, Y),
    R = ['Correcto',X, es, tio, de, Y].
elizaTioDe(X, Y, R) :- \+tiode(X , Y), R = ['No',X, no, es, tio, de, Y].

% Eliza: Tía de
elizaTiaDe(X, Y, R) :-
    tiade(X, Y),
    R = ['Correcto',X, es, tia, de, Y].
elizaTiaDe(X, Y, R) :- \+tiade(X , Y), R = ['No',X, no, es, tia, de, Y].

% Eliza: Primo de
elizaPrimoDe(X, Y, R) :-
    primode(X, Y),
    R = ['Correcto',X, es, primo, de, Y].
elizaPrimoDe(X, Y, R) :- \+primode(X , Y), R = ['No',X, no, es, primo, de, Y].

% Eliza: Prima de
elizaPrimaDe(X, Y, R) :-
    primade(X, Y),
    R = ['Correcto',X, es, prima, de, Y].
elizaPrimaDe(X, Y, R) :- \+primade(X , Y), R = ['No',X, no, es, prima, de, Y].

% Eliza: Sobrino de
elizaSobrinoDe(X, Y, R) :-
    sobrinode(X, Y),
    R = ['Correcto',X, es, sobrino, de, Y].
elizaSobrinoDe(X, Y, R) :- \+sobrinode(X , Y), R = ['No',X, no, es, sobrino, de, Y].

% Eliza: Sobrina de
elizaSobrinaDe(X, Y, R) :-
    sobrinade(X, Y),
    R = ['Correcto',X, es, sobrina, de, Y].
elizaSobrinaDe(X, Y, R) :- \+sobrinade(X , Y), R = ['No',X, no, es, sobrina, de, Y].

elizaAkinator() :- adivina.


match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).

% Eliza enfermedad:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagEnfermedad,
	elizaEnfermedad(Atom, R).

% Eliza sintoma:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagSintoma,
	elizaSintoma(Atom, R).

% Eliza diagnostico:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDiagnostico,
	elizaDiagnostico(Atom, R).

% Eliza region del cuerpo afectada:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagRegionAfectada,
    elizaRegionAfectada(Atom, R).

% Eliza diagnostico region y sintoma:
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagDiagnosticoRegion,
	elizaDiagnosticoRegion(Atom1, Atom2, R).

% Eliza diagnostico doble:
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagDiagnosticoDoble,
	elizaDiagnosticoDoble(Atom1, Atom2, R).

% Eliza lugar del mundo donde prevalece:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagArea,
    elizaArea(Atom, R).

% Eliza como se transmite:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagTransmision,
    elizaTransmision(Atom, R).

% Eliza como se previene:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagPrevencion,
    elizaPrevencion(Atom, R).

% Eliza medicamentos:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagMedicamentos,
    elizaMedicamentos(Atom, R).

% Eliza especialistas:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagEspecialista,
    elizaEspecialista(Atom, R).

% Árbol genealógico

% Padre de 
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagPadreDe,
	elizaPadreDe(Atom1, Atom2, R).

% Madre de 
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagMadreDe,
	elizaMadreDe(Atom1, Atom2, R).

% Abuelo de 
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagAbueloDe,
	elizaAbueloDe(Atom1, Atom2, R).

% Abuela de 
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagAbuelaDe,
	elizaAbuelaDe(Atom1, Atom2, R).

% Hermano de 
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagHermanoDe,
	elizaHermanoDe(Atom1, Atom2, R).

% Hermana de 
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagHermanaDe,
	elizaHermanaDe(Atom1, Atom2, R).

% Hijo de 
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagHijoDe,
	elizaHijoDe(Atom1, Atom2, R).

% Hija de 
replace0([I1, I2|_], Input, _, Resp, R):-
	nth0(I1, Input, Atom1),
	nth0(I2, Input, Atom2),
	nth0(0, Resp, X),
	X == flagHijaDe,
	elizaHijaDe(Atom1, Atom2, R).

% Eliza: Tío de
replace0([I1, I2|_], Input, _, Resp, R):-
    nth0(I1, Input, Atom1),
    nth0(I2, Input, Atom2),
    nth0(0, Resp, X),
    X == flagTioDe,
    elizaTioDe(Atom1, Atom2, R).

% Eliza: Tía de
replace0([I1, I2|_], Input, _, Resp, R):-
    nth0(I1, Input, Atom1),
    nth0(I2, Input, Atom2),
    nth0(0, Resp, X),
    X == flagTiaDe,
    elizaTiaDe(Atom1, Atom2, R).

% Eliza: Primo de
replace0([I1, I2|_], Input, _, Resp, R):-
    nth0(I1, Input, Atom1),
    nth0(I2, Input, Atom2),
    nth0(0, Resp, X),
    X == flagPrimoDe,
    elizaPrimoDe(Atom1, Atom2, R).

% Eliza: Prima de
replace0([I1, I2|_], Input, _, Resp, R):-
    nth0(I1, Input, Atom1),
    nth0(I2, Input, Atom2),
    nth0(0, Resp, X),
    X == flagPrimaDe,
    elizaPrimaDe(Atom1, Atom2, R).

% Eliza: Sobrino de
replace0([I1, I2|_], Input, _, Resp, R):-
    nth0(I1, Input, Atom1),
    nth0(I2, Input, Atom2),
    nth0(0, Resp, X),
    X == flagSobrinoDe,
    elizaSobrinoDe(Atom1, Atom2, R).

% Eliza: Sobrina de
replace0([I1, I2|_], Input, _, Resp, R):-
    nth0(I1, Input, Atom1),
    nth0(I2, Input, Atom2),
    nth0(0, Resp, X),
    X == flagSobrinaDe,
    elizaSobrinaDe(Atom1, Atom2, R).

% Eliza: Akinator
replace0([_|_], _Input, _, Resp, R) :-
    nth0(0, Resp, X),
    X == flagAkinator,
    !,
	R = Resp.


replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.
