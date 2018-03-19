(define pick
    (lambda (position lat) 
    (cond ((eqv? position 0) '())
        ((eqv? position 1) (car lat))
        (else (pick (- position 1) (cdr lat))))))

(define example '(1 2 3 4 5 6 7))        

(define keep-looking
    (lambda (a sorn lat)
        (cond
        ((number? sorn) (keep-looking a (pick sorn lat) lat))
        (else (eqv? sorn a)))))

;;; partial function example
(define looking
    (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)))

(define caviarTest '(6 2 4 caviar 5 7 3))

;;; defining shift, my definition where I did not assume that it is a function to be applied to pairs only
(define shift (lambda (x) 
    (cond ((null? x) '())
        ((atom? (car x)) (cons (car x) (cdr x)))
        (else (cons (car (car x)) (cons (cdr (car x)) (cdr x))))))
  
