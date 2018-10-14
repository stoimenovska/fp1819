#lang racket

(define (factorial number)
	(if (< number 2)
		1
		(* number (factorial (- number 1)))))

;; (factorial 3) =
;; (* 3 (factorial 2)) =
;; (* 3 (* 2 (factorial 1))) =
;; (* 3 ( * 2 1)) =
;; (* 3 2) =
;; 6

(define (factorial-iter number)
	(define (helper number accum)
		(if (< number 2)
			accum
			(helper (- number 1) (* accum number))))
	(helper number 1))

;; (factorial-iter 3) =
;; (helper 3 1) =
;; (helper 2 3) =
;; (helper 1 6) =
;; 6