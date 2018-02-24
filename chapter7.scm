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


(define subset
    (lambda (set1 set2) 
        (cond 
            ((null? set1) #t)
            ((member? (car set1) set2) (subset (cdr set1) set2))
            (else #f))))

 (define eqset?
     (lambda (set1 set2) (
         and (subset set1 set2) 
            (subset set2 set1))))
            
(define insersect?
     (lambda (set1 set2) 
          (cond 
                ((null? set1) #f)
                ((or (member? (car set1) set2) (intersect? (cdr set1) set2))))))      
                    
(define insersect
    (lambda (set1 set2) 
        (cond 
            ((null? set1) '())
            ((member? (car set1) set2) (cons (car set1) (intersect (cdr set1) set2)))
            (else (intersect (cdr set1) set2)))))  
                
                    
 (define union
        (lambda (set1 set2) 
            (cond 
                ((null? set1) set2)
                ((member? (car set1) set2) (union (cdr set1) set2))
                ((cons (car set1) (union (cdr set1) set2))))))

                    
(define intersectall
    (lambda (lset) 
        (cond 
            ((null? (cdr lset)) (car lset))
            ((intersect (car lset) (intersectall (cdr lset)))))))


;;; that's the example
(define l '(apple peach pear peach plum apple lemon peach))                        