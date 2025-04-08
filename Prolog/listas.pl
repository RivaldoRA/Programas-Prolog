concatenar([],L, L).
concatenar([H | T],L, [H | R]) :- concatenar(T,L,R).

miembro(X, [X | _]).
miembro(X, [_ | T]) :- miembro(X,T).

tamano([],0).
tamano([_ | T],N) :- tamano(T, N1), N is N1 + 1.

ultimo([X],X).
ultimo([_ | T],X) :- ultimo(T, X).