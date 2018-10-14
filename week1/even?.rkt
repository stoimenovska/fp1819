#lang racket

(define (even? number) 
	(= (remainder number 2) 0))
