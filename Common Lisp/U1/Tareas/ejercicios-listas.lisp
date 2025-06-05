
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
    (if lista
        (+ (car lista) (suma-lista (cdr lista))) ; Suma el primer elemento y recursivamente el resto
        0 ; Si la lista está vacia regresar 0 (caso base)
    )
)

; Escribe una función que determine si un elemento está en una lista.
(defun elemento-lista (elemento lista)
    (if lista ; Si la lista no esta vacía continuamos
        (if (equal elemento (car lista)) ; Si el elemento es el mismo al primer elemento de la lista, imprimimos que si
            (format t "El elemento '~A' si esta en la lista.~%" elemento)
            (elemento-lista elemento (cdr lista)) ; Si no es, mandamos la lista sin el primer elemento (la cola)
        )
        (format t "El elemento '~A' no esta en la lista.~%" elemento) ; La lista esta vacia y no estaba en la lista
    )
)

; Escribe una función para invertir el orden de los elementos de una lista.
(defun invertir-lista (lista)
    (reverse lista)
)

; Implementa una función que elimine todas las ocurrencias de un elemento en una lista.
(defun eliminar-ocurrencias (elemento lista)
    (if lista
        (if (equal elemento (car lista)) ; Verificar si el primer elemento de la lista es el que queremos borrar
            (eliminar-ocurrencias elemento (cdr lista)) ; Si lo es, mandamos la lista sin la cabeza, la pura cola
            (cons (car lista) (eliminar-ocurrencias elemento (cdr lista))) ; Si no es, lo incluimos a la nueva lista y de todas formas mandamos la cola
        )
    )
)

; Escribe una función que devuelva el elemento enésimo de una lista.
(defun enesimo-elemento (lista n)
    (nth n lista)
)

; Implementa una función que concatene dos listas.
(defun concatenar-listas (lista1 lista2)    
    (append lista1 lista2)
)