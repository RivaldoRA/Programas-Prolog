; Hacer una funcion utilizando solamente car, cdr y la sentencia if
; Dada una lista requiero que se recorra esa lista, imprimiendo cada uno de los elementos de cada lista
; 
; Descabachamiento 

; Mi intento (fallido)
(defun desc (elementos)
    (if (null (cdr elementos))
        (car elementos)
        (desc (cdr elementos)) 
    )
)

(defun recorre(lista)
    (format t "->~d" (car lista))
    (if lista
        (recorre (cdr lista)) 
    )
)

; Dada una lista solamente imprime los numeros pares de esa lista
(defun recorre-par(lista)

    (if ( = (mod (car lista) 2) 0) 
        (format t "->~d" (car lista))
    )

    (if lista
        (recorre-par (cdr lista)) 
    )
)