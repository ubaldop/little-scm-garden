;;; my own version of rember       
(define rember
    (lambda (a lat) 
        (cond 
            ((null? lat) '())
            ((eq? a (car lat)) (cdr lat))
            (else (cons (car lat) (rember a (cdr lat)))))))        


;;; my own version of firsts
(define firsts
    (lambda (l) 
        (cond 
            ((null? l) '())
            ((atom? (car l)) (cons (car l) (firsts (cdr l))))
            (else (cons (car (car l)) (firsts (cdr l))))))
