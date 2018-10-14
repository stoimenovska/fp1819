#lang racket

(define (fibonacci number)
	(if (< number 2)
		1
		(+ (fibonacci (- number 1)) (fibonacci (- number 2)))))

;; (fibonacci 3) =
;; (+ (fibonacci 2) (fibonacci 1)) = 
;; (+ (+ (fibonacci 1) (fibonacci 0)) 1) =
;; (+ (+ 1 1) 1) =
;; (+ 2 1) =
;; 3

(define (fibonacci-iter number)
	(define (helper count curr next)
		(if (> count number)
			curr
			(helper (+ count 1) next (+ curr next))))
	(helper 1 1 1))

;; (fibonacci-iter 3) =
;; (helper 1 1 1) = 	;; we can use the 'number' argument in the inner define 
;; (helper 2 1 2) =
;; (helper 3 2 3) =
;; (helper 4 3 5) =
;; 3