#lang racket

(define (apply-twice f arg)
	(f (f arg)))

;; (apply-twice sqrt 16) = (sqrt (sqrt 16)) = (sqrt 4) = 2
;; (apply-twice (lambda (x) (+ x 1)) 5) = (+ (+ 5 1) 1) = (+ 6 1) = 7
;; (apply-twice not #t) = (not (not #t)) = (not #f) = #t
