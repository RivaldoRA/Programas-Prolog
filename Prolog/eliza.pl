
% Temas proyecto
% Rubeola
% VPH
% Investigar enfermedades
% Hechos monarios, binarios: sintoma, enfermedad, region, ver datos que agregar

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
template([cuales, son, los, sintomas, de, s(_), _], [flagSintoma], [5]).
template([cuales, son, los, sintomas, de, s(_)], [flagSintoma], [5]).

% Diagnosticar la enfermedad a través de un síntoma y una región
template([tengo , s(_), en, s(_)], [flagDiagnosticoRegion], [1,3]).
template([tengo , s(_), en, s(_), _], [flagDiagnosticoRegion], [1,3]).

% Diagnosticar la enfermedad a través de dos sintomas
template([tengo , s(_), y, s(_)], [flagDiagnosticoDoble], [1,3]).
template([tengo , s(_), y, s(_), _], [flagDiagnosticoDoble], [1,3]).

% Diagnosticar la enfermedad a través de un síntoma
template([tengo , s(_)], [flagDiagnostico], [1]).

% Preguntar por la region de una enfermedad
template([donde, afecta, s(_), _], [flagRegionAfectada], [2]).
template([que, region, afecta, s(_), _], [flagRegionAfectada], [3]).
template([donde, afecta, s(_)], [flagRegionAfectada], [2]).
template([que, region, afecta, s(_)], [flagRegionAfectada], [3]).

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
enfermedad(rubeola).
enfermedad(vph).

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

sintoma(rubeola, fiebre).
sintoma(rubeola, sarpullido).
sintoma(rubeola, inflamacion).
sintoma(vph, verrugas).
sintoma(vph, picazon).

% Eliza: Regiones del cuerpo afectadas
elizaRegionAfectada(X, R) :-
    region_afectada(X, _),
    findall(Region, region_afectada(X, Region), ListaRegiones),
	atomic_list_concat(ListaRegiones, ',', RegionesString),
    R = ['La', X, 'afecta', 'las', 'siguientes', 'regiones', RegionesString].

elizaRegionAfectada(X , R) :- \+region_afectada(X, _), R = ['No', tengo, 'informacion', 'sobre', 'las', 'regiones', 'afectadas'].

region_afectada(rubeola, piel).
region_afectada(rubeola, ganglios).
region_afectada(vph, genitales).

sintoma_region(sarpullido, piel).
sintoma_region(inflamacion, ganglios).
sintoma_region(verrugas, genitales).
sintoma_region(picazon, genitales).


% Regiones geográficas donde son prevalentes
prevalente_en(rubeola, america_latina).
prevalente_en(vph, todo_el_mundo).

% Transmisión
transmision(rubeola, contacto_directo).
transmision(rubeola, via_respiratoria).
transmision(vph, contacto_sexual).

% Prevención
prevencion(rubeola, vacuna_triple_viral).
prevencion(vph, vacuna_vph).

% Diagnóstico
diagnostico(rubeola, examen_sangre).
diagnostico(vph, papanicolaou).

% Gravedad
gravedad(rubeola, moderada).
gravedad(vph, variable).

% Tipo de enfermedad
tipo_enfermedad(rubeola, viral).
tipo_enfermedad(vph, viral).


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

% Eliza region_afectada:
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
