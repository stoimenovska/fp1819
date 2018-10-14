#lang racket

;; using the Euclidean algorithm

(define (gcd a b)
	(cond 
		((= a b) a)
		((> a b) (gcd (- a b) b))
		(else (gcd a (- b a)))))

;; (gcd 14 4) =
;; (gcd 10 4) =
;; (gcd  6 4) =
;; (gcd  2 4) =
;; (gcd  2 2) =
;; 2