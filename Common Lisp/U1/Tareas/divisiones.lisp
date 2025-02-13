(defun divide (x y)
  (if (< x y)
      0
      (+ 1 (divide (- x y) y))))
