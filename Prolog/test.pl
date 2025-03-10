auto(mustang).
auto(chevy).
padre(juan).
padre(jose).
madre(elena).
madre(luisa).
madre(tere).
padrede(jose, juan).
padrede(juan, pedro).
padrede(sergio, antonio).
padrede(martin, alfonso).
padrede(juan, maria).
padrede(arturo, julia).
madrede(julia, martin).
madrede(elena, antonio).
madrede(antonio, matias).
abuelo(X, Y) :- padrede(X,Z), padrede(Z,Y);  madrede(X,Z), madrede(Z, Y).
