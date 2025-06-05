; Hacer una funcion utilizando solamente car, cdr y la sentencia if
; Dada una lista requiero que se recorra esa lista, imprimiendo cada uno de los elementos de cada lista
; 
; Descabachamiento 

(defun recorre(lista)
    (format t "->~d" (car lista))
    (if lista
        (recorre (cdr lista)) 
    )
)

; Dada una lista solamente imprime los numeros pares de esa lista
(defun recorre-par(lista)
    (if lista
        (progn
            (if ( = (mod (car lista) 2) 0) 
                (format t "->~d" (car lista))
            )
            (recorre-par (cdr lista)) 
        )
    )
)