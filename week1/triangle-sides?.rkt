#lang racket

(define (triangle-sides? a b c)
	(and 
		(> (+ a b) c)
		(> (+ b c) a)
		(> (+ a c) b)
		(> a 0)
		(> b 0)
		(> c 0)))