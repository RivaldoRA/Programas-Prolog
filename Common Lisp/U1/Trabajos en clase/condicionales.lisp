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