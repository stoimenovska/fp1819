#lang racket

(define (binary-to-decimal number)
	(if (= number 0)
		0
		(+ (* 2 (binary-to-decimal (quotient number 10))) (remainder number 10))))

;; (binary-to-decimal 1010) =
;; (+ (* 2 (binary-to-decimal 101)) 0) = 
;; (+ (* 2 (+ (* 2 (binary-to-decimal 10)) 1)) 0) =
;; (+ (* 2 (+ (* 2 (+ (* 2 (binary-to-decimal 1)) 0)) 1)) 0) =
;; (+ (* 2 (+ (* 2 (+ (* 2 (+ (* 2 (binary-to-decimal 0)) 1)) 0)) 1)) 0) =
;; (+ (* 2 (+ (* 2 (+ (* 2 (+ (* 2 0) 1)) 0)) 1)) 0) =
;; (+ (* 2 (+ (* 2 (+ (* 2 (+ 0 1)) 0)) 1)) 0) =
;; (+ (* 2 (+ (* 2 (+ (* 2 1) 0)) 1)) 0) =
;; (+ (* 2 (+ (* 2 (+ 2 0)) 1)) 0) =
;; (+ (* 2 (+ (* 2 2) 1)) 0) =
;; (+ (* 2 (+ 4 1)) 0) =
;; (+ (* 2 5) 0) =
;; (+ 10 0) =
;; 10

;; 1010 in binary =
;; 	1 * 2 * 2 * 2 +
;;  0 * 2 * 2 +
;;  1 * 2 +
;;  0

(define (binary-to-decimal-iter number)
	(define (helper num power accum)
		(if (= num 0)
			accum
			(helper (quotient num 10) (+ power 1) (+ accum (* (remainder num 10) (expt 2 power))))))
	(helper number 0 0))

;; (binary-to-decimal-iter 1010) =
;; (helper 1010  0  0) =
;; (helper  101  1  0) =
;; (helper   10  2  2) =
;; (helper    1  3  2) =
;; (helper    0  4 10) =
;; 10