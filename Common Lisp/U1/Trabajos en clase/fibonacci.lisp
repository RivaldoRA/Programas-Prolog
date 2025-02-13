; Fibonacci
; Conseguir los primeros "n" números de Fibonacci
; 0 1 2 3 5 8 13 21 34 55 89
;   int fib(n) {
;       if(n < 2) {   
;           return n; 
;                  }
;       else {
;           return(fib(n-1) + fib(n-2))
;       }
;
(defun fib (n)
    (if (< n 2)
        1 
        (+  (fib(- n 1)) (fib(- n 2)))
    )
)

; Buscar recursivamente dividir aplicando restas utilizando recursividad, numeros enteros
; Potencias con sumas de manera recursiva