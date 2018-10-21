#lang racket

(define (increasing-digits? number)
	(if (< number 10)
		#t
		(and 
			(< (remainder number 10) (remainder (quotient number 10) 10)) 
			(increasing-digits (quotient number 10)))))

;; (increasing-digits 123) =
;; (and (< 3 2) (increasing-digits 12)) =
;; (and (< 3 2) (and (< 2 1) (increasing-digits 1))) =
;; (and (< 3 2) (and (< 2 1) #t)) =
;; (and (< 3 2) (and #f #t)) =
;; (and #f #f) =
;; #f