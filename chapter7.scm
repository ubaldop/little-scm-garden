;;; writing member again
(define member?
    (lambda (a lat) 
        (cond 
            ((null? lat) #f)
            (else (or (equal? (car lat) a) (member? a (cdr lat)))))))


(define multirember 
    (lambda (a lat) 
            (cond 
                ((null? lat) '())
                ((eq? (car lat) a) (multirember a (cdr lat)))
                (else (cons (car lat) (multirember a (cdr lat)))))))
      

(define set? 
	(lambda (lat) 
		(
         cond 
            ((null? lat) #t)
            ((member? (car lat) (cdr lat)) #f)
            (else (set? (cdr lat)))
            )))

(define makeset 
    (lambda (lat) 
        (cond 
            ((null? lat) '())
            ((member? (car lat) (cdr lat)) (makeset (cdr lat)))
            (else (cons (car lat) (makeset (cdr lat))))
            )))            

(define makesetR 
                (lambda (lat) 
                    (cond 
                        ((null? lat) '())
                        (else (cons (car lat) (makesetR (multirember (car lat) (cdr lat)))))
                        )))

;;; that's the example
(define l '(apple peach pear peach plum apple lemon peach))                        