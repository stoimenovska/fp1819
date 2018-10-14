#lang racket

(define (reverse number)
	(define (helper num accum)
		(if (= num 0)
			accum
			(helper (quotient num 10) (+ (remainder num 10) (* accum 10)))))
	(helper number 0))

;; (reverse 145) =
;; (helper 145   0) =
;; (helper  14   5) =
;; (helper   1  54) =
;; (helper   0 541) =
;; 541

(define (count-digits number)
	(if (< number 10)
		1
		(+ 1 (count-digits (quotient number 10)))))

(define (reverse2 number)
	(if (< number 10)
		number
		(+ 
			(* (remainder number 10) (expt 10 (- (count-digits number) 1))) 
			(reverse2 (quotient number 10)))))

;; (reverse2 145) ~
;; (+ (* 5 (expt 10 2)) (reverse2 14)) ~
;; (+ (* 5 100) (+ (* 4 (expt 10 1)) (reverse2 1))) ~
;; (+ 500 (+ (* 4 10) 1)) ~
;; (+ 500 (+ 40 1)) ~
;; (+ 500 41) ~
;; 541