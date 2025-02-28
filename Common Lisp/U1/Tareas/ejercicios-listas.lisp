
(defparameter *nodes* '(1 2 3 4 5))

; Implementa una función que devuelva el primer elemento de una lista dada.
(defun primer-elemento (lista)
    (car lista)
)

; Escribe una función que devuelva el segundo elemento de una lista.
(defun segundo-elemento (lista)
    (cadr lista)
)

; Escribe una función que devuelva el último elemento de una lista.
(defun ultimo-elemento (lista)
    (if lista
        (ultimo-elemento (cdr lista)) 
        (car lista)
    )
)

; Implementa una función que calcule la cantidad de elementos en una lista.
(defun numero-elementos (lista)
    (length lista)
)

; Crea una función que sume todos los elementos de una lista de números.
(defun suma-lista (lista)
    (if (= (length lista) 1)
        (princ (car lista))
        (suma-lista (append (list (+ (car lista) (cadr lista))) (cddr lista)))
    )
)

; Escribe una función que determine si un elemento está en una lista.
(defun elemento-lista (lista elemento)
    (if )
)

; Escribe una función para invertir el orden de los elementos de una lista.
(defun invertir-lista (lista)
    (reverse lista)
)

; Implementa una función que elimine todas las ocurrencias de un elemento en una lista.
(defun eliminar-ocurrencias (lista)

)

; Escribe una función que devuelva el elemento enésimo de una lista.
(defun enesimo-elemento (lista)

)

; Implementa una función que concatene dos listas.
(defun concatenar-listas (lista1 lista2)    
    (append lista1 lista2)
)