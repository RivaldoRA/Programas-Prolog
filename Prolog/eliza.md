# Eliza

```prolog
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
```

## Enfermedades
```
cuales son los sintomas de la rubeola
tengo sarpullido en la piel
tengo sarpullido y fiebre
tengo fiebre
donde afecta la rubeola
en que parte del mundo se encuentra la rubeola
como se transmite el vph
como se previene el vph
```

## Árbol genealógico
```
guadalupe es padre de rivaldo
marisol es madre de abril
rivaldo es hijo de esmeralda_segunda
belinda es hija de guadalupe
enrique es abuelo de obey
josefina es abuela de brady
brady es hermano de obey
belinda es hermana de rivaldo
odilon es tio de rivaldo
veronica es tia de abril
claudel es primo de belinda
belinda es prima de brady
rivaldo es sobrino de froylan
abril es sobrina de esmeralda_segunda
```

## Akinator
```
adivina mi personaje
```