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



