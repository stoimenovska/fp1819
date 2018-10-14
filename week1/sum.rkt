#lang racket

(define (sum start end)
	(if (> start end)
		0
		(+ start (sum (+ start 1) end))))

;; (sum 1 5) = 
;; (+ 1 (sum 2 5)) =
;; (+ 1 (+ 2 (sum 3 5))) =
;; (+ 1 (+ 2 (+ 3 (sum 4 5)))) =
;; (+ 1 (+ 2 (+ 3 (+ 4 (sum 5 5))))) = 
;; (+ 1 (+ 2 (+ 3 (+ 4 (+ 5 (sum 6 5)))))) = 
;; (+ 1 (+ 2 (+ 3 (+ 4 (+ 5 0)))) =
;; (+ 1 (+ 2 (+ 3 (+ 4 5)))) =  
;; (+ 1 (+ 2 (+ 3 9))) =
;; (+ 1 (+ 2 12)) =  
;; (+ 1 14) =   
;; 15

(define (sum-iter start end)
	(define (helper start end accum)
		(if (> start end)
			accum
			(helper (+ start 1) end (+ accum start))))
	(helper start end 0))

;; (sum-iter 1 5) =
;; (helper 1 5 0) =
;; (helper 2 5 1) =
;; (helper 3 5 3) =
;; (helper 4 5 6) =
;; (helper 5 5 10) =
;; (helper 6 5 15) =
;; 15