;;;; Personal implementation of member function
(define member?
    (lambda (list value) (cond ((null? list) #f)
        ((eq? (car list) value) #t)
        (else (member? (cdr list) value))
        ) 
        ))
