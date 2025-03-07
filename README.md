# Tareas - Unidad 1

## Transformar una expresión de Inorden a Preorden
Se resolvieron unos ejercicios para entender como los compiladores evaluan expresiones matemáticas y para familiarizarnos con la forma en que Common Lisp las implementa
![image](./Fotos/Inorden/1.jpeg)
![image](./Fotos/Inorden/2.jpeg)
![image](./Fotos/Inorden/3.jpeg)
![image](./Fotos/Inorden/4.jpeg)

## Recorrido de árboles binarios en Preorden
Se implementó otra forma de escribir las expresiones utilizando paréntesis para dividirlas por operación y después construir un árbol de expresión con el resultado final 
![image](./Fotos/Inorden/5.jpeg)
![image](./Fotos/Inorden/6.jpeg)
![image](./Fotos/Inorden/7.jpeg)
![image](./Fotos/Inorden/8.jpeg)

## Recorrido de árboles binarios en Preorden y Postorden
![image](./Fotos/Inorden/9.jpeg)
![image](./Fotos/Inorden/10.jpeg)
![image](./Fotos/Inorden/11.jpeg)
![image](./Fotos/Inorden/12.jpeg)
![image](./Fotos/Inorden/13.jpeg)
![image](./Fotos/Inorden/14.jpeg)


## Operaciones de área y volúmen en Common Lisp
```
; Áreas
(defun area-cuadrado(lado)
    (setq resultado (* lado lado))
    (format t "Área del cuadrado: ~A~%" resultado)
    (values)
)

(defun area-trapecio (base-menor base-mayor altura)
    ; (B + b) * h / 2
    ; / (* h (+ B b)) 2
    (setq resultado (/ (* altura (+ base-mayor base-menor)) 2))
    (format t "Área del trapecio: ~A~%" resultado)
    (values)
)

(defun area-rectangulo (altura base)
    (setq resultado (* base altura))
    (format t "Área del rectángulo: ~A~%" resultado)
    (values)
)

(defun area-triangulo (altura base)
    ; b * h / 2
    ; / (* b h) 2
    (setq resultado (/ (* base altura) 2)) 
    (format t "Área del triángulo: ~A~%" resultado)
    (values)
)

(defun area-circulo (radio)
    ; pi * radio^2
    ; * pi (* radio radio)
    (setq resultado (* pi (* radio radio)))
    (format t "Área del círculo: ~A~%" resultado)
    (values)
)

; Volúmenes
(defun volumen-cubo (lado)
    ; l * l * l
    ; * l (* l l)
    (setq resultado (* (* lado lado) lado))
    (format t "Volumen del cubo: ~A~%" resultado)
    (values)
)

(defun volumen-cilindro (radio altura)
    ; pi * r^2 * h
    ; * (* pi (* radio radio)) h
    (setq resultado (* (* pi (* radio radio)) altura))
    (format t "Volumen del cilindro: ~A~%" resultado)
    (values)
)

(defun volumen-esfera (radio)
    ; 4/3 * pi * r^3
    ; * ( * (/ 4 3) pi ) (* (* radio radio) radio)))
    (setq resultado (* (*(/ 4 3) pi) (* (* radio radio) radio)))
    (format t "Volumen de la esfera: ~A~%" resultado)
    (values)
)

(defun volumen-cono (radio altura)
    ; 1/3 * pi * r^2 * h
    ; (*(*(*(/ 1 3) pi) (* r r))h)
    (setq resultado (*(*(*(/ 1 3) pi) (* radio radio))altura))
    (format t "Volumen del cono: ~A~%" resultado)
    (values)
)

(defun volumen-piramide-rectangular (area-base altura)
    ; ab * h / 3
    ; / (* ab h) 3
    (setq resultado (/ (* area-base altura) 3))
    (format t "Volumen de la pirámide rectángular: ~A~%" resultado)
    (values)
)
```

## Funciones Primitivas en CLISP

### 1. Operaciones Matemáticas Básicas
- `+` → Suma
- `-` → Resta
- `*` → Multiplicación
- `/` → División
- `mod` → Módulo
- `1+` → Incrementar en 1
- `1-` → Decrementar en 1

### 2. Operaciones Lógicas
- `and` → Conjunción lógica
- `or` → Disyunción lógica
- `not` → Negación lógica

### 3. Comparaciones
- `=` → Comparación de igualdad numérica
- `/=` → Diferencia
- `<` → Menor que
- `>` → Mayor que
- `<=` → Menor o igual
- `>=` → Mayor o igual

### 4. Manipulación de Listas
- `car` → Devuelve el primer elemento de una lista
- `cdr` → Devuelve la cola de una lista
- `cons` → Construye una nueva lista con un elemento y una lista
- `list` → Crea una lista con los elementos dados
- `append` → Concatena listas
- `length` → Longitud de una lista
- `reverse` → Invierte una lista

### 5. Control de Flujo
- `if` → Estructura condicional
- `cond` → Expresión condicional múltiple
- `case` → Selección basada en valores
- `loop` → Bucle iterativo
- `do` → Bucle generalizado

### 6. Funciones y Evaluación
- `lambda` → Crea una función anónima
- `apply` → Aplica una función a una lista de argumentos
- `funcall` → Llama a una función con argumentos explícitos
- `mapcar` → Aplica una función a cada elemento de una lista

### 7. Entrada y Salida
- `print` → Imprime un valor con salto de línea
- `format` → Imprime texto con formato
- `read` → Lee una expresión desde la entrada

### 8. Tipos y Conversión de Datos
- `type-of` → Devuelve el tipo de un objeto
- `integerp` → ¿Es un entero?
- `floatp` → ¿Es un número de punto flotante?
- `stringp` → ¿Es una cadena?
- `symbolp` → ¿Es un símbolo?

## Car y Cdr con listas
```
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

(cadr(cadadr '((1 (2 3)) (4 (5 6)))))

;  Lista: (((a b) c) d e) → Extraer c
(cadar '(((a b) c) d e))

;  Lista: (((1 2) 3) ((4 5) 6)) → Extraer 6
(cadadr '(((1 2) 3) ((4 5) 6)))

;  Lista: ((p (q (r s))) t u) → Extraer (r s)
(cadr(cadr(car '((p (q (r s))) t u))))
(car(cdadar '((p (q (r s))) t u)))

;  Lista: (((a) b) (c (d e)) f) → Extraer d
(caadr(cadr '(((a) b) (c (d e)) f)))

;  Lista: ((1 (2 (3 4))) (5 6)) → Extraer 3
(caadr(cadr(car '((1 (2 (3 4))) (5 6)))))
(caar(cdadar '((1 (2 (3 4))) (5 6))))

;  Lista: (((x) (y)) ((z) (w))) → Extraer (w)
(cadr(cadr '(((x) (y)) ((z) (w)))))

;  Lista: ((a (b (c d))) (e f)) → Extraer c
(caadr(cadr(car '((a (b (c d))) (e f)))))
(caar(cdadar '((a (b (c d))) (e f))))

;  Lista: ((1 (2 (3 (4 5)))) (6 7)) → Extraer 4
(caadr(cadr(cadr(car '((1 (2 (3 (4 5)))) (6 7))))))
(caadar(cdadar ' ((1 (2 (3 (4 5)))) (6 7))))

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
```


## Calcular el exponente de un número de manera recursiva

```
(defun multiply (x y)
  (if (= y 0)
      0
      (+ x (multiply x (- y 1)))))

(defun power (base exp)
  (if (= exp 0)
      1
      (multiply base (power base (- exp 1)))))
```

## Calcular una división utilizando restas de manera recursiva

```
(defun divide (x y)
  (if (< x y)
      0
      (+ 1 (divide (- x y) y))))

```


## variables individual, constantes individual, cuantificadores existencial universal, propiedades, relacion , dominio del discruso

La Tierra es un planeta, 
Constante individiual: Tierra
Propiedad: Planeta
Planeta(Tierra)

La Luna no es un planeta
Constante individual: Luna
No tiene la propiedad de ser planeta
¬Planeta(Luna)

La Luna es un satelite
Constante individual: Luna
Propiedad: Satélite
Satelite(Luna)

La Tierra gira alrededor del Sol.
Constante individual: Tierra y Sol
Propiedad: Gira alrededor
Gira_alrededor(Tierra, Sol)

Todo planeta es un satélite.
Variable individual: Planeta
Cuantificador universal
∀xPlaneta(X) ^ Satelite(X)

Todo planeta gira alrededor del Sol.
Variable individual: Planeta
Cuantificador universal
∀x(Planeta(X) -> Gira(Sol))

Algún planeta gira alrededor de la Luna.
Variable individual: Planeta
Cuantificador existencial
Ǝx(Planeta(X) -> Gira(Sol))

Hay por lo menos un satélite.
Variable individual: Satélite
Cuantificador existencial

Todos los perros del vecindario muerden a algún cartero.
Variable individual: Perro
Cuantificador universal
Relación: Morder

Hay un cartero al que lo muerden todos los perros.
Variable individual: Cartero
Cuantificador existencial
Relación: Morder

Todos los carteros son mordidos por algún perro
Variable individual: Cartero
Cuantificador universal
Relación: Morder

Hay un perro que muerde a todos los carteros
Variable individual: Perro
Cuantificador existencial
Relación: Morder

Todos los perros que asustan a algún cartero, lo muerden
Variable individual: Perro
Cuantificador universal
Relación: Asustar, Morder

Hay un perro que muerde a todos los perros que muerden a algún cartero
Variable individual: Perro
Cuantificador existencial
Relación: Morder

Hay un solo perro que se muerde a sí mismo
Variable individual: Perro
Cuantificador existencial
Relación: Morder


Swi Prolog