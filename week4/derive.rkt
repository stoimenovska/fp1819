#lang racket

(define (derive f h)
  (lambda (x)
    (/
      (-
        (f (+ x h))
        (f x))
      h)))
