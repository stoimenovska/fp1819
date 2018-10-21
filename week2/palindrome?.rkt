#lang racket

(define (reverse number)
	(define (helper num accum)
		(if (= num 0)
			accum
			(helper (quotient num 10) (+ (remainder num 10) (* accum 10)))))
	(helper number 0))

(define (palindrome? number)
	(= number (reverse number)))