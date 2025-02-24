; Association List assoc | extraer el elemento que vamos a necesitar
; , quasiquoting evaluar una función cuando se tenga una coma 
; (assoc 'cama)
; (car (assoc 'living-room *nodes*))
; (cdr (assoc 'living-room *nodes*))
; (cdr (assoc 'living-room *nodes*))
; Analizar los niveles
(defparameter *nodes* '(
                        (femenino (
                            (fuego(azula))
                            (tierra(top))
                            (agua (katara))
                        ))
                        (masculino (
                            (aire (Hola rayo masculino))
                            (fuego (Hola fuego))
                            (tierra (Hola tierra))
                            (agua (poder de agua))
                        ))
                        (alien (
                            (marte (Hola vengo de marte))
                        ))
))
; Función que vaya preguntando, es real, no real, etc., recorrer cada nodo y aplicar un assoc

(defun preguntar (lista) 
    (format t "Tu personaje es ~a ?" (caar lista))
    (setq a (read))

    (if (eql "si" a)
        (preguntar (car lista)) 
    )
    
    (if lista
        (preguntar (cdr lista)) 
    )
)
