#lang racket

(define (take n list)
  (cond
    ((= n 0) '())
    ((null? list) '())
    (else (cons
            (car list)
            (take (- n 1) (cdr list))))))

;; (take 3 '(1 2 3 4 5)) =
;; (cons 1 (take 2 '(2 3 4 5))) =
;; (cons 1 (cons 2 (take 1 '(3 4 5))) =
;; (cons 1 (cons 2 (cons 3 (take 0 '(4 5))))) =
;; (cons 1 (cons 2 (cons 3 '()))) =
;; (cons 1 (cons 2 '(3))) =
;; (cons 1 '(2 3)) =
;; '(1 2 3)
