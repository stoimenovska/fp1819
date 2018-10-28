#lang racket

(define (add-n number)
  (lambda (x)
    (+ number x)))

(define add-10
  (add-n 10))

;; (add-10 5) =
;; ((add-n 10) 5) =
;; ((lambda (x) (+ 10 x)) 5) =
;; (+ 10 5) =
;; 15
