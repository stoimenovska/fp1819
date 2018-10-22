#lang racket

(define (filter-accumulate op null-value start end term next pred?)
  (cond
      ((> start end) null-value)
      ((pred? start) (op (term start) (filter-accumulate op null-value (next start) end term next pred?)))
      (else (filter-accumulate op null-value (next start) end term next pred?))))

;; helper functions for code clarity
;; could also be passed directy as lambda functions
;; where needed
(define (succ       x) (+ x 1))
(define (const1     _)       1)
(define (identity   x)       x)

(define (count p? start end)
  (filter-accumulate + 0 start end const1 succ p?))

;; (count even? 1 10) = 5
;; (count (lambda (x) (= x 5)) 1 10) = 1
;; (count (lambda (x) (= (* x x) (+ x x))) 1 10) = 1

(define (sum-divisors number)
  (filter-accumulate + 0 1 number identity succ (lambda (x) (= (remainder number x) 0))))
