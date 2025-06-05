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
Se crearon varias funciones para familiarizarnos con Common Lisp, especialmente con setq, que asigna valores a variables. También nos ayudó a entender cómo se manejan las operaciones matemáticas. En Common Lisp, se usa una notación prefija, donde el operador va antes de los números, como `(* base altura)` en lugar de `base * altura`.
```lisp
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
Se investigaron las operaciones primitivas en CLISP, las cuales nos permiten realizar tareas como cálculos matemáticos y lógicos, así como la manipulación de listas y el control del flujo de ejecución.
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
Se realizaron ejercicios para comprender cómo manipular listas en Common Lisp utilizando `car` y `cdr`. `car` devuelve el primer elemento de una lista, mientras que `cdr` devuelve el resto de la lista (todo excepto el primer elemento). Combinando estas funciones, podemos extraer elementos específicos, incluso si están anidados profundamente dentro de otras listas
```lisp
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

## Factorial en Common Lisp
La función `fact` (factorial) calcula el producto de un número entero positivo y todos los enteros positivos menores que él. Su caso base es cuando `n` es 0, devolviendo 1. De lo contrario, multiplica `n` por el factorial de `n-1`.
```lisp
(defun fact (n)
    (if (= n 0)
        1
        (* n (fact(- n 1)))
    )
)
```

## Fibonacci en Common Lisp
La función `fib` (Fibonacci) genera una secuencia donde cada número es la suma de los dos anteriores. Tiene dos casos base: si `n` es menor que 2, devuelve 1. Si no, suma los resultados de `fib` para `n-1` y `n-2`
```lisp
(defun fib (n)
    (if (< n 2)
        1 
        (+  (fib(- n 1)) (fib(- n 2)))
    )
)
```

## Calcular el exponente de un número de manera recursiva
Para calcular el exponente de un número, desarrollé la función `power`, que hace uso de la recursividad. Esta función se basa en la idea de que x <sup>n</sup> es igual a x multiplicado por x<sup>n−1</sup>. La condición base para la recursividad es cuando el exponente (`exp`) es 0, en cuyo caso el resultado es 1. Para la operación de multiplicación recursiva, se definió una función `multiply` que suma `x` consigo mismo `y` veces; su caso base es cuando `y` es 0, devolviendo 0. Así, power llama repetidamente a multiply para obtener el resultado final.
```lisp
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
Para realizar una división utilizando únicamente restas, implementé la función `divide` de forma recursiva. Esta función simula la división restando el divisor (`y`) del dividendo (`x`) repetidamente hasta que el dividendo sea menor que el divisor. Cada vez que se realiza una resta, se suma 1 al resultado. La recursión finaliza cuando el dividendo (`x`) es menor que el divisor (`y`), devolviendo 0 como caso base. De esta manera, se cuenta cuántas veces se puede restar el divisor del dividendo.
```lisp
(defun divide (x y)
  (if (< x y)
      0
      (+ 1 (divide (- x y) y))))

```

## Juego "Adivina mi número" 
Este código del libro `Land of Lisp` implementa un juego de adivinar un número entre 1 y 100 usando una búsqueda binaria. El juego utiliza dos variables globales, `*small*` y `*big*`, para definir el rango de búsqueda actual.

`start-over`: Inicia el juego, estableciendo el rango inicial de 1 a 100 y haciendo la primera suposición.
`guess-my-number`: Calcula la suposición actual tomando el punto medio del rango actual (`*small*` y `*big*`) 
`smaller`: Si el número es menor, ajusta el límite superior (`*big*`) para reducir el rango.
`bigger`: Si el número es mayor, ajusta el límite inferior (`*small*`) para reducir el rango.

Con cada indicación ("menor" o "mayor"), el juego reduce a la mitad el espacio de búsqueda, acercándose rápidamente a el número.
```lisp
(defun guess-my-number ()
    (ash (+ *small* *big*) -1)
)

(defun smaller()
    (setf *big* (1- (guess-my-number)))
    (guess-my-number)
)

(defun bigger()
    (setf *small* (1+ (guess-my-number)))
    (guess-my-number)
)

(defun start-over()
    (defparameter *small* 1)
    (defparameter *big* 100)
    (guess-my-number)
)
```

## Recorrer listas en Common Lisp
Estas dos funciones de Common Lisp, `recorre` y `recorre-par`, son ejemplos recursivos diseñados para procesar elementos en una lista. `recorre` itera sobre una lista e imprime cada uno de sus elementos. Por otro lado, `recorre-par` también recorre la lista, pero solo imprime los números pares que encuentra. Ambas funciones demuestran la recursividad llamándose a sí mismas con el "resto" de la lista `((cdr lista))` hasta que la lista está vacía, momento en el que la recursión se detiene.
```lisp
(defun recorre(lista)
    (format t "->~d" (car lista))
    (if lista
        (recorre (cdr lista)) 
    )
)

; Dada una lista solamente imprime los numeros pares de esa lista
(defun recorre-par(lista)
    (if lista
        (progn
            (if ( = (mod (car lista) 2) 0) 
                (format t "->~d" (car lista))
            )
            (recorre-par (cdr lista)) 
        )
    )
)
```

## Condicionales en Common Lisp
Este código del libro `Land of Lisp` define cómo reaccionar si alguien se come tu pudín, usando una variable global `*arch-enemy*`. Las funciones `pudding-eater` (con `cond`) y `pudding-eater-case` (con `case`) asignan un enemigo específico (`stupid-lisp-alien` o `useless-old-johnny`) y una frase según quién sea la `person`, o una genérica si es un `stranger`. Además, se muestran ejemplos de los operadores lógicos `and` (todas las condiciones deben ser verdaderas) y `or` (al menos una condición debe ser verdadera) para combinaciones de verificaciones.

Este código más que nada fue para aprender cómo se implementan las condicionales en Common Lisp, explorando `cond` y `case` para controlar el flujo del programa.
```lisp
(defvar *arch-enemy* nil)

(defun pudding-eater (person)
    (cond   ((eq person 'henry) 
                    (setf *arch-enemy* 'stupid-lisp-alien)
                    '(curse you lisp alien - you ate my pudding))
            ((eq person 'johnny) 
                    (setf *arch-enemy* 'useless-old-johnny)
                    '(i hop you choked on my pudding johnny))  
            (t '(why you eat my pudding stranger ?))
    )
)

; Usando case
(defun pudding-eater-case (person)
    (case person
        ((henry)    (setf *arch-enemy* 'stupid-lisp-alien)
                    '(curse you lisp alien - you ate my pudding)) 
        ((johnny)   (setf *arch-enemy* 'useless-old-johnny)
                    '(i hope you choked on my pudding johnny))
        (otherwise  '(why you eat my pudding stranger ?))
    )
)

; Stealth Conditionals and or, solo se necesita poner una vez para más de dos casos

(and (oddp 5) (oddp 7) (oddp 9))
(or (oddp 5) (oddp 7) (oddp 9))
```

## Ejercicios con condicionales
Estos códigos en Common Lisp presentan dos funciones prácticas: `sueldo-cond` y `lavadora`. La función `sueldo-cond` calcula el aumento salarial anual de un trabajador basándose en su antigüedad en la empresa, aplicando diferentes porcentajes de incremento según los años de servicio. 

Por otro lado, la función `lavadora` determina el nivel de llenado de agua para una lavadora y su funcionalidad, basándose en el peso de la ropa en libras, indicando si la carga es excesiva o el nivel requerido (mínimo, medio, alto o máximo) junto con una cantidad de litros de agua recomendada.

Estos ejemplos se implementaron para experimentar con las condicionales en Common Lisp
```lisp
; 1.- Que calcule el sueldo que le corresponde al trabajador de una
;empresa que cobra 40.000 euros anuales, el programa debe realizar los
;cálculos en función de los siguientes criterios:

;• Si lleva más de 10 años en la empresa se le aplica un aumento del 10%.
;• Si lleva menos de 10 años pero más que 5 se le aplica un aumento del 7%.
;• Si lleva menos de 5 años pero más que 3 se le aplica un aumento del 5%.
;• Si lleva menos de 3 años se le aplica un aumento del 3%.()

(defun sueldo-cond (tiempo)
    (cond 
        ((> tiempo 10) (princ (* 40000 1.10)))
        ((and (< tiempo 10) (> tiempo 5)) (princ (* 40000 1.07)))
        ((and (< tiempo 5) (> tiempo 3)) (princ (* 40000 1.05)))
        ((< tiempo 3) (princ (* 40000 1.03)))
    )
)

(defun sueldo-if (tiempo)
  (if (> tiempo 10)
      (princ (* 40000 1.10))
      (if (and (< tiempo 10) (> tiempo 5))
          (princ (* 40000 1.07))
          (if (and (< tiempo 5) (> tiempo 3))
              (princ (* 40000 1.05))
              (if (<= tiempo 3)
                  (princ (* 40000 1.03))
                  (princ (40000))
              )
          )
      )
  )
)

; 2.- Hacer un algortimo que tome el peso en libras de una cantidad de
; ropa a lavar en una lavadora y nos devuelva el nivel dependiendo del
;peso; además nos informe la cantidad de litros de agua que
;necesitamos. Se sabe que con más de 30 libras la lavadora no funcionara
;ya que es demasiado peso. Si la ropa pesa 22 ó más libras, el nivel será
;de máximo; si pesa 15 ó más nivel será de alto; si pesa 8 ó más será un
;nivel medio o de lo contrario el nivel será minimo

(defun lavadora-cond(peso)
    (cond
        ((>= peso 30) (princ "Demasiado peso. La lavadora no funcionara."))
        ((>= peso 22) (princ "Nivel: Maximo. Litros de agua: 70 litros")) 
        ((>= peso 15) (princ "Nivel: Alto. Litros de agua: 50 litros"))
        ((>= peso 8) (princ "Nivel: Medio. Litros de agua: 35 litros"))
        (t (princ "Nivel: Minimo. Litros de agua: 25 litros"))
    )
)

(defun lavadora-if (peso)
  (if (>= peso 30)
      (princ "Demasiado peso. La lavadora no funcionara.")
      (if (>= peso 22)
          (princ "Nivel: Maximo. Litros de agua: 70 litros")
          (if (>= peso 15)
              (princ "Nivel: Alto. Litros de agua: 50 litros")
              (if (>= peso 8)
                  (princ "Nivel: Medio. Litros de agua: 35 litros")
                  (princ "Nivel: Minimo. Litros de agua: 25 litros")
              )
          )
      )
  )
)
```

## Árbol de datos en Common Lisp
Este código define un árbol de datos. La función `adivina-videojuego` realiza un recorrido interactivo y recursivo de este árbol. Pregunta al usuario si su personaje se encuentra en una categoría (compañía, franquicia o juego); si la respuesta es "sí", desciende por ese camino del árbol; si es "no", pasa a la siguiente opción en el mismo nivel. Si llega a un personaje, pregunta si es el buscado. Este proceso se repite hasta que el personaje es identificado o no quedan más opciones, guiando al usuario a través de la estructura de datos.
```lisp
(defparameter *nodes* '(
  (rockstar-games (
    (grand-theft-auto (
      (gta-iii (
        claude
        donald-love
      ))
      (vice-city (
        tommy-vercetti
        lance-vance
      ))
      (san-andreas (
        cj
        big-smoke
        ryder
      ))
      (gta-iv (
        nikko-bellic
        roman-bellic
      ))
      (gta-v (
        michael
        franklin
        trevor
      ))
    ))
    (red-dead-redemption (
      (rdr1 (
        john-marston
        dutch-van-der-linde
      ))
      (rdr2 (
        arthur-morgan
        sadie-adler
        micah-bell
      ))
    ))
  ))

  (valve (
    (half-life (
      (half-life-1 (
        gordon-freeman
        g-man
      ))
      (half-life-2 (
        gordon-freeman
        alyx-vance
        eli-vance
      ))
      (half-life-alyx (
        alyx-vance
        russell
      ))
    ))
    (portal (
      (portal-1 (
        chell
        glados
      ))
      (portal-2 (
        chell
        glados
        wheatley
      ))
    ))
    (counter-strike (
      (cs-16 (
        terrorist
        counter-terrorist
      ))
      (cs-go (
        phoenix
        seal-team
      ))
      (cs2 (
        new-terrorist
        new-ct
      ))
    ))
    (left-4-dead (
      (left-4-dead-1 (
        bill
        zoey
        louis
        francis
      ))
      (left-4-dead-2 (
        coach
        rochelle
        ellis
        nick
      ))
    ))
  ))

  (nintendo (
    (super-mario (
      (super-mario-64 (
        mario
        bowser
        peach
      ))
      (super-mario-odyssey (
        mario
        cappy
        bowser
      ))
    ))
    (the-legend-of-zelda (
      (ocarina-of-time (
        link
        zelda
        ganondorf
      ))
      (breath-of-the-wild (
        link
        zelda
        revali
        urbosa
      ))
    ))
    (metroid (
      (super-metroid (
        samus-aran
        ridley
        mother-brain
      ))
      (metroid-prime (
        samus-aran
        metroid-prime
        space-pirates
      ))
      (metroid-dread (
        samus-aran
        raven-beak
        emmi
      ))
    ))
  ))
))

(defun adivina-videojuego (lista)
    (when lista
        (let ((elemento (car lista))) 
            (if (and (listp elemento) (listp (cadr elemento)))
                (progn
                    (format t "Tu personaje se encuentra en ~a?" (car elemento))
                    (setq a (read))
                    (if (string-equal a "si")
                        (adivina-videojuego (cadr elemento))
                        (adivina-videojuego (cdr lista))))
                (progn
                    (format t "Es tu personaje ~a?"  elemento)
                    (setq a (read)) 
                    (if (string-equal a "si")
                        (format t "Personaje encontrado ~a" elemento)
                        (adivina-videojuego (cdr lista)))
                )
            )
        )
    )
)
```
## Operaciones de área y volúmen en Common Lisp con intervención del usuario
Se trabajó en un código anterior, pero en esta ocasión se implementó la lectura de datos a través del usuario para calcular las áreas y volúmenes
```lisp
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
```

## Evaluación con listas en Common Lisp
Esta fue una evaluación para ver si poniamos atención (supongo). Originalmente solo resolví 6 ejercicios de manera correcta

Estas funciones nos muestran la aplicación de las funciones primitivas, condicionales y recursividad en Common Lisp para manipular listas. 

Funciones como `primer-elemento` o `segundo-elemento` aprovechan primitivas directas (`car`,`cadr`). Otras, como `ultimo-elemento`, `suma-lista`, `elemento-lista` y `eliminar-ocurrencias`, demuestran la recursividad, procesando la lista paso a paso y utilizando condicionales (`if`) para definir el comportamiento en cada etapa y establecer un caso base para detener la recursión. Finalmente, funciones como `numero-elementos`, `invertir-lista`, `enesimo-elemento` y `concatenar-listas` muestran cómo las potentes funciones incorporadas en Lisp (`length`, `reverse`, `nth`, `append`) simplifican tareas comunes de manipulación de listas.

```lisp
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

```

## Lógica de primer orden
### variables individual, constantes individual, cuantificadores existencial universal, propiedades, relacion , dominio del discruso

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
∀xP(X) ^ S(X)

Todo planeta gira alrededor del Sol.
Variable individual: Planeta
Cuantificador universal
∀x(Planeta(X) -> Gira(sol))
∀x(P(X) -> G(s))

Algún planeta gira alrededor de la Luna.
Variable individual: Planeta
Cuantificador existencial
Ǝx(Planeta(X) -> Gira(luna))
Ǝx(P(X) -> G(l))

Hay por lo menos un satélite.
Variable individual: Satélite
Cuantificador existencial
Ǝx Satelite(X)
Ǝx S(X)

Todos los perros del vecindario muerden a algún cartero.
Variable individual: Perro
Cuantificador universal
Relación: Morder
∀x P(X) -> Ǝ(y) ^ m(X,Y)

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


