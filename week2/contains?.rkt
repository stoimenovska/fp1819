#lang racket

(define (ends-with? a b)
	(if (< b 10)
		(= (remainder a 10) (remainder b 10))
		(and 
			(= (remainder a 10) (remainder b 10))
			(ends-with (quotient a 10) (quotient b 10)))))

;; (ends-with? 123 23) =
;; (and (= (remainder 123 10) (remainder 23 10)) (ends-with? (quotient 123 10) (quotient 23 10))) =
;; (and (= 3 3) (ends-with? 12 2)) =
;; (and #t #t) =
;; #t

(define (contains? a b)
	(if (< a 10)
		(= a b)
		(or (ends-with? a b) (ends-with? (quotient a 10) b))))

;; (contains 1234 23) =
;; (or (ends-with? 1234 23) (ends-with? (quotient 1234 23))) =
;; (or (ends-with? 1234 23) (ends-with? 123 23)) =
;; (or #f #t) =
;; #t