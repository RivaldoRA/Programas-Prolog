; Association List assoc | extraer el elemento que vamos a necesitar
; , quasiquoting evaluar una función cuando se tenga una coma 
; (assoc 'cama)
; (car (assoc 'living-room *nodes*))
; (cdr (assoc 'living-room *nodes*))
; (cdr (assoc 'living-room *nodes*))
; Analizar los niveles

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

