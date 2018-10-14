#lang racket

(define (prime? number)
	(define (helper possible-divisor number)
		(if (>= possible-divisor number)		;; or (>= possible-divisors (sqrt number))
			#t
			(and 
				(not (= (remainder number possible-divisor) 0))
				(helper (+ possible-divisor 1) number))))
	(helper 2 number))

;; (prime? 3) =
;; (helper 2 3) =
;; (and (not (= (remainder 3 2) 0)) (helper 3 3)) =
;; (and (not (= (remainder 3 2) 0)) #t) =
;; (and (not (= 1 0)) #t) =
;; (and (not #f) #t) =
;; (and #t #t) =
;; #t

;; (prime? 4) =
;; (helper 2 4) =
;; (and (not (= (remainder 4 2) 0)) (helper 3 4)) =
;; (and (not (= (remainder 4 2) 0)) (and (not (= (remainder 4 3) 0)) (helper 4 4))) =
;; (and (not (= 0 0)) (and (not (= 1 0))) #t)) =
;; (and (not #t) (and (not #f) #t)) =
;; (and #f (and #t #t)) =
;; (and #f #t) =
;; #f

(define (prime?2 number)
	(define (helper possible-divisor number)
		(cond
			((>= possible-divisor number) #t)
			((= (remainder number possible-divisor) 0) #f)
			(else (helper (+ possible-divisor 1) number))))
	(helper 2 3))

;; (prime? 3) =
;; (helper 2 3) =
;; (helper 3 3) =
;; #f

;; (prime? 4) =
;; (helper 2 4) = 
;; #t