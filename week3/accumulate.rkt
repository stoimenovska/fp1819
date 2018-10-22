#lang racket

(define (accumulate op null-value start end term next)
  (if (> start end)
      null-value
      (op
          (term start)
          (accumulate op null-value (next start) end term next))))

;; we are passing the same "term"
;; in more than one of the function definitions, so it makes sense to
;; extract and name it, even though it's so simple
(define (identity x) x)

(define (factorial n)
  (accumulate * 1 1 n identity (lambda (x) (+ x 1))))

(define (double-factorial n)
  (accumulate * 1 (if (even? n) 2 1) n identity (lambda (x) (+ x 2))))

(define (power base exp)
  (accumulate * 1 1 exp (lambda (_) base) succ))
