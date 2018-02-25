;; my version of insert-g
(define insert-g
    (lambda (test? application) 
        (lambda (new old l) 
                    (cond 
                        ((null? l) '())
                        ((test? old (car l)) (application new old (cdr l)))
                        (else (cons (car l) ((insert-g test? application) new old (cdr l))))
           ))))

;; define example application
(define left (lambda (new old l) (cons new (cons old l))))
(define right (lambda (new old l) (cons old (cons new l))))
(define sub (lambda (new old l) (cons new l)))

;;; define insertL
(define insertL (insert-g eqv? left))

;;; define insertR
(define insertR (insert-g eqv? right))

;;; define subst
(define subst (insert-g eqv? sub))

;;; usage example
(insertR 'pippo 'c '(a b c d m))

(insertL 'pippo 'c '(a b c d m))

(subst 'pippo 'c '(a b c d m))

;;;define atom-to-function
;;;define atom-to-function
(define atom-to-function
    (lambda (x) 
        (cond 
            (
                ((eq? x (quote X)) *)
                ((eq? x (quote +)) +)
                (#t ^)
            ))))

;; my version of multirember
(define multirember
    (lambda (test?) 
        (lambda (a l) 
                    (cond 
                        ((null? l) '())
                        ((test? a (car l)) ((multirember test?) a (cdr l)))
                        (else (cons (car l) ((multirember test?) a (cdr l))))
           ))))

;;; test multirember
((multirember eqv?) 'c '(a b c d c c c m))

(define multirember-eq? (multirember eqv?))

(define eqv-c? (lambda (x) (lambda (a) (eqv? a x))))

(define eqv-tuna? (eqv-c? (quote tuna)))


;;; define even?

(define evenNum?
    (lambda (n) (= (* (quotient n 2) 2) n)))

(evenNum? 4)

(define atom?
    (lambda (x) 
        (and (not (pair? x)) (not (null? x)))))


(define evens-only*
(lambda (l) (cond
    ((null? l) '())
    ((atom? (car l))
                    (cond   
                        ((evenNum? (car l)) (cons (car l) (evens-only* (cdr l))))
                        (else ( evens-only* ( cdr l))))
    )
    (else (cons ( evens-only* (car l)) (evens-only* (cdr l)))))))


(define evens-only&co*
(lambda (l col) (
    cond ((null? l) (col '() 1 0))
    ((atom? (car l))
        (cond   
            ((evenNum? (car l))    
                (evens-only&co* (cdr l) (lambda (list M S) 
                (col (cons (car l) list) (* M (car l)) S)
            )))
            (else  (evens-only&co* (cdr l) (lambda (list M S) 
                (col list M (+ S (car l)))
            ))))
    )
    (else (evens-only&co* (car l) (lambda (newList M S) 
        (evens-only&co* (cdr l) 
            (lambda (final aM aS) 
                (col (cons newList final) (* M aM) (+ S aS))
            ))
    ))))))

(define collector
    (lambda (list product sum) (
        cons sum (cons product list)
        )))

(evens-only* '((9 1 2 8) 3 10 ((9 9) 7 6) 2))        
(evens-only&Co* '((9 1 2 8) 3 10 ((9 9) 7 6) 2) collector)

