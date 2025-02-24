; Association List assoc | extraer el elemento que vamos a necesitar
; , quasiquoting evaluar una función cuando se tenga una coma 
; (assoc 'cama)
; (car (assoc 'living-room *nodes*))
; (cdr (assoc 'living-room *nodes*))
; (cdr (assoc 'living-room *nodes*))
; Analizar los niveles
(defparameter *nodes* '((preal
                        (alto (cpelo (VCarranza VFox))) 
                        (bajo (BJuarez))
                        )
                        (pnreal
                        (bob)
                        (patricio)
                        (pantera-rosa)
                        ) 
                        (kimera 
                            (k1) 
                            (k2)
                        )
                        (pextraterrestre
                            (ex1)
                            (ex2)
                        )
                        ))

; Función que vaya preguntando, es real, no real, etc., recorrer cada nodo y aplicar un assoc

(defun preguntar-persona (respuesta)

    (princ Tu personaje es)
    (case respuesta)
        `(real ,(car *nodes*))
        `(noreal)
    )
)