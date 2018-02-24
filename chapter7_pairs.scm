(define a-pair?
    (lambda (a) 
        (cond 
            ((atom? a) #f)
            ((null? a) #f)
            ((null? (cdr a)) #f)
            ((null? (cdr (cdr a))) #t)
            (else #f))))

(define first (lambda (x) (car x)))

(define second (lambda (x) (car (cdr x))))

(define third (lambda (x) (car (cdr (cdr x)))))

(define build (lambda (a b) (cons a (cons b '()))))

(define revrel
    (lambda (list) 
        (cond 
            ((null? list) '())
            ((cons (build (second (car list)) (first car list))) (revrel (cdr list))))))