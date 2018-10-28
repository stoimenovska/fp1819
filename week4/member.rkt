#lang racket

(define (my-member? element list)
  (cond
    ((null? list) #f)
    ((equal? element (car list)) #t)
    (else (my-member? element (cdr list)))))

(define (my-member2? element list)
  (if (null? list)
      #f
      (or
          (equal? element (car list))
          (my-member2? element (cdr list)))))
