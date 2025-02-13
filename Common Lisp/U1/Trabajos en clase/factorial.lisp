; Programar el factorial recursivo (5)
; Decir que pasa con esta función
(defun fact (n)
    (if (= n 0)
        1
        (* n (fact(- n 1)))
    )
)