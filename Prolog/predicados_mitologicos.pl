% 1. Aplanar una lista de listas anidadas
% Problema: Dada una lista como [1, [2, [3, 4], 5], [6]], genera [1, 2, 3, 4, 5, 6]. 

flatten([1, [2, [3, 4], 5], [6]], R).

% 2. Encontrar todas las permutaciones de una lista
% Problema: Dada la lista [a, b, c], genera las permutaciones: 
% [a, b, c] | [a, c, b] | [b, a, c] | [b, c, a] | [c, a, b] | [c, b, a] 

permutacion([a,b,c], P).

% 3. Generar subconjuntos de una lista
% Problema: Dada la lista [1, 2, 3], genera: 
% [] | [1] | [2] | [3] | [1,2] | [1,3] | [2,3] | [1,2,3]

subconjunto([1,2,3], [S]).

% 4. Encontrar todos los números en un rango que cumplen una condición
% Problema: Encuentra todos los números primos entre 1 y 20. 

es_primo(N) :- N > 1, \+ (between(2, N1, N), N1 < N, N mod N1 =:= 0).
findall(Primo, (between(1, 20, Primo), es\_primo(Primo)), Primos).

% 5. Concatenar dos listas
% Problema: Combina [1, 2] y [3, 4] en [1, 2, 3, 4]. 

append([1,2], [3,4], A).

% 6. Encontrar elementos únicos en una lista
% Problema: Dada la lista [1, 2, 2, 3, 3, 3, 4], genera [1, 2, 3, 4]. 

%findall()

% 7. Calcular la potencia de un número
% Problema: Dado el número 2, calcula sus potencias hasta 2^5
% [1, 2, 4, 8, 16, 32]


% 8. Alinear equipos en un torneo
% Problema: Dado un conjunto de equipos [A, B, C], genera todas las combinaciones posibles de enfrentamientos. 

permutacion(['A','B','C'], B).