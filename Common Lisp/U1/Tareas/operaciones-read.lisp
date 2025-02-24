; Áreas
(defun area-cuadrado()
    (format t "Ingrese un lado: ")
    (setq lado (read))
    (setq resultado (* lado lado))
    (format t "Área del cuadrado: ~A~%" resultado)
    (values)
)

(defun area-trapecio ()
    (format t "Ingrese la base menor: ")
    (setq base-menor (read))

    (format t "Ingrese la base mayor: ")
    (setq base-mayor (read))

    (format t "Ingrese la altura: ")
    (setq altura (read))

    (setq resultado (/ (* altura (+ base-mayor base-menor)) 2))
    (format t "Área del trapecio: ~A~%" resultado)
    (values)
)

(defun area-rectangulo ()
    (format t "Ingrese la altura: ")
    (setq altura (read))

    (format t "Ingrese la base: ")
    (setq base (read))

    (setq resultado (* base altura))
    (format t "Área del rectángulo: ~A~%" resultado)
    (values)
)

(defun area-triangulo ()
    (format t "Ingrese la altura: ")
    (setq altura (read))

    (format t "Ingrese la base: ")
    (setq base (read))

    (setq resultado (/ (* base altura) 2)) 
    (format t "Área del triángulo: ~A~%" resultado)
    (values)
)

(defun area-circulo ()
    (format t "Ingrese el radio: ")
    (setq radio (read))

    (setq resultado (* pi (* radio radio)))
    (format t "Área del círculo: ~A~%" resultado)
    (values)
)

; Volúmenes
(defun volumen-cubo ()
    (format t "Ingrese un lado: ")
    (setq lado (read))

    (setq resultado (* (* lado lado) lado))
    (format t "Volumen del cubo: ~A~%" resultado)
    (values)
)

(defun volumen-cilindro ()
    (format t "Ingrese el radio: ")
    (setq radio (read))

    (format t "Ingrese la altura: ")
    (setq altura (read))

    (setq resultado (* (* pi (* radio radio)) altura))
    (format t "Volumen del cilindro: ~A~%" resultado)
    (values)
)

(defun volumen-esfera ()
    (format t "Ingrese el radio: ")
    (setq radio (read))

    (setq resultado (* (*(/ 4 3) pi) (* (* radio radio) radio)))
    (format t "Volumen de la esfera: ~A~%" resultado)
    (values)
)

(defun volumen-cono ()
    (format t "Ingrese el radio: ")
    (setq radio (read))

    (format t "Ingrese la altura: ")
    (setq altura (read))

    (setq resultado (*(*(*(/ 1 3) pi) (* radio radio))altura))
    (format t "Volumen del cono: ~A~%" resultado)
    (values)
)

(defun volumen-piramide-rectangular ()
    (format t "Ingrese la área de la base: ")
    (setq area-base (read))

    (format t "Ingrese la altura: ")
    (setq altura (read))

    (setq resultado (/ (* area-base altura) 3))
    (format t "Volumen de la pirámide rectángular: ~A~%" resultado)
    (values)
)
