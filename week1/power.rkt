#lang racket

(define (power base exp)
	(if (= 0 exp)
		1
		(* base (power base (- exp 1)))))

;; (power 5 3) =
;; (* 5 (power 5 2)) =
;; (* 5 (* 5 (power 5 1))) =
;; (* 5 (* 5 (* 5 (power 5 0)))) =
;; (* 5 (* 5 (* 5 1))) =
;; (* 5 (* 5 5)) =
;; (* 5 25) =
;; 125

(define (power-iter base exp)
	(define (helper base exp accum)
		(if (= 0 exp)
			accum
			(helper base (- exp 1) (* accum base))))
	(helper base exp 1))

;; (power 5 3) =
;; (helper 5 3 1) =
;; (helper 5 2 5) =
;; (helper 5 1 25) =
;; (helper 5 0 125) =
;; 125