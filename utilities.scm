;;;; this function checks if the parameter passed as input is an atom
(define atom?
    (lambda (x) 
        (and (not (pair? x)) (not (null? x)))))
