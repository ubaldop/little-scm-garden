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
            (else (cons (car (car l)) (firsts (cdr l))))
        )))

;;; my insertR version            
(define insertR
    (lambda (new old lat) 
        (cond 
            ((null? lat) '())
            ((eq? old (car lat)) (cons old cons(new (cdr lat))))
            (else (cons (car lat) (insertR new old (cdr lat))))
        )))

;;; my insertL version            
(define insertL
    (lambda (new old lat) 
        (cond
            ((null? lat) '())
            ((eq? old (car lat)) (cons new lat))
            (else (cons (car lat) (insertL new old (cdr lat))))
        )))

;;; my subst
(define subst
    (lambda (new old lat) 
        (cond 
            ((null? lat) '())
            ((eq? old (car lat)) (cons new (cdr lat)))
            (else (cons (car lat) (subst new old (cdr lat))))
        ))) 

;;; my subst2, without or
(define subst2
    (lambda (new o1 o2 lat) 
        (cond 
            ((null? lat) '())
            ((eq? o1 (car lat)) (cons new (cdr lat)))
            ((eq? o2 (car lat)) (cons new (cdr lat)))
            (else (cons (car lat) (subst2 new o1 o2 (cdr lat))))
        )))   

;;;; my subst2 with or        
(define subst2
    (lambda (new o1 o2 lat) 
        (cond 
            ((null? lat) '())
            ((or (eq? o1 (car lat)) (eq? o2 (car lat))) (cons new (cdr lat)))
            (else (cons (car lat) (subst2 new o1 o2 (cdr lat))))
        )))           

;;; my own version of multirember       
(define multirember
    (lambda (a lat) 
        (cond 
            ((null? lat) '())
            (else 
                (cond 
                    ((eq? a (car lat)) (multirember a (cdr lat)))
                    (else (cons (car lat) 
                        (multirember a (cdr lat))))))
        )))

;;; my multiinsertR version            
(define multiinsertR
    (lambda (new old lat) 
        (cond 
            ((null? lat) '())
            ((eq? old (car lat)) (cons old cons(new (multiinsertR new old (cdr lat)))))
            (else (cons (car lat) (multiinsertR new old (cdr lat))))
        )))        

;;; my multiinsertL version            
(define multiinsertL
    (lambda (new old lat) 
        (cond
            ((null? lat) '())
            ((eq? old (car lat)) (cons new cons(old (multiinsertL new old (cdr lat)))))
            (else (cons (car lat) (multiinsertL new old (cdr lat))))
        )))        

;;; my multisubsts version
(define multisubst
    (lambda (new old lat) 
        (cond 
            ((null? lat) '())
            ((eq? old (car lat)) (cons new (multisubst new old (cdr lat))))
            (else (cons (car lat) (multisubst new old (cdr lat))))
        )))         

   