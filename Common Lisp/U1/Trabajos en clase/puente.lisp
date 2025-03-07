; Cuatro personas deben cruzar un puente de noche
; pero solo tienen una linterna y el puente es demasiado peligroso
; el puente solo soporta un máximo de dos personas a la vez
; y cuando dos cruzan juntos, deben moverse a la velocidad del más lento
; cada persona tiene una velocidad de cruce diferente, por ejemplo la persona A puede cruzar en 1 min
; la B en 2 min, la persona C puede cruzar en 5 min y la persona D puede en 10 min
; Las reglas son las siguientes, no pueden cruzar sin la linterna, solo dos personas pueden cruzar a la vez
; El tiempo total es el de la persona más lenta que cruza
; El objetivo es, todos deben cruzar el puente en menos de 17 min.
; Cuál es la estrategia óptima en el menor tiempo, cuantos viajes se necesitan, se puede hacer un programa en clisp
; Se toma el regreso también

; A1 B2 C5 D10
; 10, 11, 16, 17, 

; 2, 3, 8, 9, 19, 

; AB A CD B BA
; 2 3 13 15 17

(defparameter *inicio* '(linterna 1 2 5 10 15))
(defparameter *final* '())


(defun puente (inicio final)
    ; Mientras existan elementos en la lista inicio
    (when inicio
        ; Empezar la función si no hay ningún elemento del otro lado
        (unless final 
            (setq cola (cdddr inicio))
            (setq primeros (list (car inicio) (cadr inicio) (caddr inicio)))
            (puente cola primeros)
        ) 

        ;Si la linterna esta al final, regresar
        (if (equal (car final) LINTERNA)
            (progn
                (setq regreso (list (car final) (cadr final)))
                (puente (append inicio regreso) (cddr final))
            )
        )
       
        ; Si solo quedan dos elementos en el inicio y tienen la linterna
        (if (and ( = (length inicio) 2 ) (equal (car inicio) LINTERNA ))
            (progn
                (append (cdr inicio) final)
                (princ final)
            )
        )

        ;Si la linterna esta al inicio, y falta por irse, agarrar ultimos dos elementos
        (if (equal (car inicio) LINTERNA)
            (progn
                (setq ultimos (list (car inicio) (car (reverse inicio)) (cadr (reverse inicio))))
                (puente inicio (append final ultimos))
            ) 
        )


    )

)