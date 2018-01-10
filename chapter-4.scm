;;;; add1 function
(define add1
    (lambda (n) (+ n 1)))

;;;; sub1 function
(define sub1
    (lambda (n) (- n 1)
    ))

;;; my version of +, named plus
(define plus
    (lambda (a b) 
        (cond ((zero? a) b)
            (else (plus (sub1 a) (add1 b))))))

;;; my version of -, named minus, watch out commutativity
(define minus
    (lambda (a b) 
        (cond ((zero? b) a)
            (else (minus (sub1 a) (sub1 b))))))

;;; my addtup version
(define addtup
    (lambda (tup)
    (cond 
        ((null? tup) 0)
        (else (+ (car tup) (addtup (cdr tup)))))))

;;; my version of *, named times, not working because of not returning accumulated value
(define times
    (lambda (a b) 
        (cond ((zero? b) 0)
            (else (times (plus a a) (sub1 b))))))

;;; my version of *, named timesMy, not working because although returning accumulated value...
;;; in the recursion step is forwarded the next incremented a
;;; for example (timesMy 3 2):
;;; (timesMy 3 2) recurses to
;;;     (timesMy 6 1) recurses to
;;;         (timesMy 12 0) returns 12
(define timesMy
    (lambda (a b) 
        (cond ((zero? b) a)
            (else (timesMy (plus a a) (sub1 b))))))            
       

;;; my version of *, named timesW, working
(define timesW
    (lambda (a b) 
        (cond ((zero? b) 0)
            (else (+ a (timesW a (sub1 b)))))))    
  
;;;; my first version of tup+                
(define tup+
    (lambda (tup1 tup2)
    (cond 
        ((and (null? tup1) (null? tup2)) '())
        (else (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))))))

;;;; my second version of tup+                
(define supertup+
    (lambda (tup1 tup2)
    (cond 
        ((and (null? tup1) (null? tup2)) '())       ;;;this could be removed for a slight simplification
        ((null? tup1) tup2)
        ((null? tup2) tup1)        
        (else (cons (+ (car tup1) (car tup2)) (supertup+ (cdr tup1) (cdr tup2)))))))    
            
;;;; my version of greater than, named gt                
(define gt
    (lambda (n m)
    (cond 
        ((and (zero? n) (zero? m)) #f) ;;;this can be removed because when n is zero then is it less or equal
        ((zero? n) #f)
        ((zero? m) #t)        
        (else (gt (sub1 n) (sub1 m))))))    
            
;;;; my version of less than, named lt                
(define lt
    (lambda (n m)
    (cond 
        ;;;this and condition can be removed through semplification 
        ;;;because when m is less than zero, so it is or equal to n or less than
        ((and (zero? n) (zero? m)) #f)
        ((zero? m) #f)
        ((zero? n) #t)       
        (else (lt (sub1 n) (sub1 m))))))   
            
(define eq
    (lambda (n m)
    (cond ((zero? m) (zero? n))
        ((zero? n) #f)
        (else (eq (sub1 n) (sub1 m))))))            


;;;; eq using > and <      
(define eqX
    (lambda (n m)
    (cond 
        ((lt n m) #f)
        ((gt n m) #f)
        (else #t))))    
            
            
;;; my version of pow
(define pow
    (lambda (n m) 
        (cond 
            ((zero? m) 1)
            (else (* n (pow n (sub1 m)))))))            

;;; my version of length
(define myLength
    (lambda (lat)
    (cond ((null? lat) 0)
        (else (+ 1 (myLength (cdr lat)))))))

;;; my version of pic
(define pick
    (lambda (n lat)
    (cond ((zero? n) '())
        ((null? lat) '())
        ((eq? 1 n) (car lat))
        (else (pick (sub1 n) (cdr lat))))))

;;; my version of rempic
(define rempick
    (lambda (n lat)
    (cond 
        ((zero? (sub1 n)) (cdr lat))
        (else (cons (car lat) (rempick (sub1 n) (cdr lat)))))))   
            
;;; my version of no-nums
(define no-nums
    (lambda (lat)
    (cond 
        ((null? lat) '())
        (else 
            (cond 
                ((number? (car lat)) (no-nums (cdr lat)))
                (else (cons (car lat) (no-nums (cdr lat))))))))) 
                    
;;; my version of all-nums
(define all-nums
    (lambda (lat)
    (cond 
        ((null? lat) '())
        (else 
            (cond 
                ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
                (else (all-nums (cdr lat))))))))

;;; my version of eqan?
(define eqan?
    (lambda (a1 a2)
    (cond 
        ((and (number? a1) (number? a2)) (eqX a1 a2))
        ((and (atom? a1) (atom? a2)) (eq? a1 a2))
        (else #f)
        )))

;;; my version of occur
(define occur
    (lambda (a lat)
    (cond 
        ((null? lat) 0)
        (else 
            (cond 
                ((eq? a (car lat)) (add1 (occur a (cdr lat))))
                (else (occur a (cdr lat)))))))) 

;;; my version of one?
(define one?
    (lambda (n)
    (cond 
        ((zero? (sub1 n)) #t)
        (else #f))))

;;;or, alternatively
(define one2?
    (lambda (n)
    (cond 
        ((zero? n) #f)
        (else (zero? (sub1 n)))
    )))

;;; oneliner one
(define oneL? (lambda (n) (zero? (sub1 n))))
;;; or...
(define oneSmall? (lambda (n) (eqX n 1)))

;;; my version of rempick written using one
(define rempickWithOne
    (lambda (n lat)
    (cond 
        ((oneSmall? n) (cdr lat))
        (else (cons (car lat) (rempickWithOne (sub1 n) (cdr lat)))))))   