#lang racket

(define (sum-divisors number)
	(define (helper divisor number accum)
		(cond 
			((>= divisor number) accum)
			((= (remainder number divisor) 0) (helper (+ 1 divisor) number (+ accum divisor)))
			(else (helper (+ 1 divisor) number accum))))
	(helper 1 number 0))

;; (sum-divisors 8) =
;; (helper 1 8 0) =
;; (helper 2 8 1) =
;; (helper 3 8 3) =
;; (helper 4 8 3) =
;; (helper 5 8 7) =
;; (helper 6 8 7) =
;; (helper 7 8 7) =
;; (helper 8 8 7) =
;; 7