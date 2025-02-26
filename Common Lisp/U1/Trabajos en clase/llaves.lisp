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
                            (marte (marciano))
                        ))
))

; Función que vaya preguntando, es real, no real, etc., recorrer cada nodo y aplicar un assoc
(defun preguntar (lista) 
    (format t "Tu personaje es ~a ? " (caar lista))
    (setq a (read))

    (if (eql "si" a)
        (preguntar (car lista)) 
    )
    
    (if lista
        (preguntar (cdr lista)) 
    )
)

; Función del profesor, falta corregir error en el último elemento ya que no es una lista
(defun recorre (lista)
    (when lista
        (let ((elemento (car lista))) 
            (format t "Tu personaje es ~a?" (car elemento))
            (setq a (read))
            (if (string-equal a "si")
                (progn
                    (setq b (cadr (assoc (car elemento) lista))) 
                    (recorre b)
                ) 
                (recorre (cdr lista))
            )
        )
    )
)


(defun re (lista)
    (when lista
        (let ((elemento (car lista))) 
            (format t "Tu personaje es ~a?" (car elemento))
            (setq a (read))
            (if (string-equal a "si")
                (progn
                    (setq b (cadr (assoc (car elemento) lista))) 
                    (if (cdr b) 
                        (re b)
                        (princ (car b)) 
                    )
                ) 
                (re (cdr lista))
            )
        )
    )
)