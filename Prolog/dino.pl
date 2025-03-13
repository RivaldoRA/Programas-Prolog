% Definimos la estructura de las casas
solucion(Casas) :-
    length(Casas, 5),
    Casas = [_,_,(_,_,_,leche,_,_),_,_], % El hombre de la casa del medio bebe leche
    Casas = [(noruego,_,_,_,_,_),_,(_,azul,_,_,_,_),_,_], % El noruego vive en la primera casa, al lado de la azul
    member((britanico,rojo,_,_,_,_), Casas), % El británico vive en la casa roja
    member((sueco,_,perro,_,_,_), Casas), % El sueco tiene un perro
    member((danes,_,_,te,_,_), Casas), % El danés toma té
    member((_,verde,_,cafe,_,_), Casas), % El dueño de la casa verde bebe café
    member((_,amarillo,_,_,dunhill,_), Casas), % El dueño de la casa amarilla fuma Dunhill
    member((_,_,pajaros,_,pallmall,_), Casas), % El que fuma Pall Mall cría pájaros
    member((_,_,_,cerveza,bluemaster,_), Casas), % El que fuma Bluemaster toma cerveza
    member((aleman,_,_,_,prince,_), Casas), % El alemán fuma Prince
    next_to((_,verde,_,_,_,_), (_,blanco,_,_,_,_), Casas), % La casa verde está a la izquierda de la blanca
    next_to((_,_,gato,_,_,_), (_,_,_,_,blends,_), Casas), % El que fuma Blends vive al lado del que tiene un gato
    next_to((_,_,caballo,_,_,_), (_,_,_,_,dunhill,_), Casas), % El que tiene un caballo vive al lado del que fuma Dunhill
    next_to((_,_,_,agua,_,_), (_,_,_,_,blends,_), Casas), % El que fuma Blends vive al lado del que toma agua
    member((_,_,pez,_,_,_), Casas). % ¿Quién es el dueño del pez?

% Definimos la relación de adyacencia
next_to(A, B, List) :- append(_, [A,B|_], List).
next_to(A, B, List) :- append(_, [B,A|_], List).
