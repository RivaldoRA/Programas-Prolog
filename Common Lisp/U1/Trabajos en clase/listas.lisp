

; 1 Problemas con car y cdr

;- `car` → Devuelve el primer elemento de una lista
;- `cdr` → Devuelve la cola de una lista

;  Lista: (a b c d e) → Extraer d
(cadddr '(a b c d e))

;  Lista: ((1 2) (3 4) (5 6)) → Extraer 5
(caaddr '((1 2) (3 4) (5 6)))

;  Lista: ((a b) (c d) (e f)) → Extraer e
(caaddr '((a b) (c d) (e f)))

;  Lista: ((x y) ((p q) (r s)) (z w)) → Extraer z
(caaddr '((x y) ((p q) (r s)) (z w)))

;  Lista: ((1 (2 3)) (4 (5 6))) → Extraer 6
(cadr(cadr(cadr '((1 (2 3)) (4 (5 6))))))

;  Lista: (((a b) c) d e) → Extraer c
(cadar '(((a b) c) d e))

;  Lista: (((1 2) 3) ((4 5) 6)) → Extraer 6
(cadadr '(((1 2) 3) ((4 5) 6)))

;  Lista: ((p (q (r s))) t u) → Extraer (r s)
(cadr(cadr(car '((p (q (r s))) t u))))

;  Lista: (((a) b) (c (d e)) f) → Extraer d
(caadr(cadr '(((a) b) (c (d e)) f)))

;  Lista: ((1 (2 (3 4))) (5 6)) → Extraer 3
(caadr(cadr(car '((1 (2 (3 4))) (5 6)))))

;  Lista: (((x) (y)) ((z) (w))) → Extraer (w)
(cadr(cadr '(((x) (y)) ((z) (w)))))

;  Lista: ((a (b (c d))) (e f)) → Extraer c
(caadr(cadr(car '((a (b (c d))) (e f)))))

;  Lista: ((1 (2 (3 (4 5)))) (6 7)) → Extraer 4
(caadr(cadr(cadr(car '((1 (2 (3 (4 5)))) (6 7))))))

;  Lista: (((a b) c) ((d e) f) ((g h) i)) → Extraer g
(caaadr(cdr '(((a b) c) ((d e) f) ((g h) i))))

;  Lista: (((x y) (z w)) ((p q) (r s))) → Extraer r
(caadr(cadr '(((x y) (z w)) ((p q) (r s)))))

;  Lista: ((1 (2 (3 (4 (5 6))))) (7 8)) → Extraer 5
(caar(cdadar(cdadar '((1 (2 (3 (4 (5 6))))) (7 8)))))

;  Lista: ((a (b (c (d e)))) (f g)) → Extraer d
(caadar(cdadar '((a (b (c (d e)))) (f g))))

;  Lista: (((1 2) (3 4)) ((5 6) (7 8))) → Extraer 7
(car(cadadr '(((1 2) (3 4)) ((5 6) (7 8)))))

;  Lista: ((x (y (z (w v))))) → Extraer w
(caadar(cdadar '((x (y (z (w v)))))))

;  Lista: (((a b c) (d e f)) ((g h i) (j k l))) → Extraer j
(car(cadadr '(((a b c) (d e f)) ((g h i) (j k l)))))