;;;;List of atoms implementation lat as did by book authors
(define lat?
    (lambda (x) 
        (cond 
        ((null? x) #t)
        ((atom? (car x)) (lat? (cdr x)))
        (else #f))))

;;;;List of atoms as did by me. Is this the same as the one above? To discuss
(define lat?
    (lambda (x) (
        if (null? x) #t 
        (and (atom? (car x)) (lat? (cdr x))))))


;;;; Valid alternative to lat? as implemented by authors, where else has been replaced by #t
(define lat?
    (lambda (x) 
        (cond 
        ((null? x) #t)
        ((atom? (car x)) (lat? (cdr x)))
        (#t #f))))        ;;;; if none of the above expressions has been evaluated properly, the returns false because #t is always true.

;;;;Book implementation of member function
(define member?
    (lambda (l value) 
        (cond 
        ((null? l) #f)
        (else (or (eq? (car l) value) 
            (member? (cdr l) value))))))


;;;; Personal implementation of member function
(define member?
    (lambda (list value) (
        cond (
              (null? list) #f)
              ((eq? (car list) value) #t)
              (else (member? (cdr list) value)))))

;;;; Exercise done with friends @ café - this function checks if all the elements in a list are equals
(define leq?
    (lambda (l) 
        (cond 
            ((null? l) #t)
            ((null? (cdr l)) #t)
            ((eq? (car l) (car (cdr l))) (leq? (cdr l)))
            (else #f))))


