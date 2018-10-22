#lang racket

;; recursive approach
(define (apply-n n f arg)
  (if (= n 0)
      arg
      (f (apply-n (- n 1) f arg))))

;; (apply-n 3 sqrt 256) =
;; (sqrt (apply-n 2 sqrt 256)) =
;; (sqrt (sqrt (apply-n 1 sqrt 256))) =
;; (sqrt (sqrt (sqrt (apply-n 0 sqrt 256)))) =
;; (sqrt (sqrt (sqrt 256)) =
;; (sqrt (sqrt 16) =
;; (sqrt 4) =
;; 2

;; iterative approach
(define (apply-iter-n n f arg)
  (if (= n 0)
      arg
      (apply-iter-n (- n 1) f (f arg))))  ;; tail recursion

;; (apply-iter-n 3 sqrt 256) =
;; (apply-iter-n 2 sqrt  16) =
;; (apply-iter-n 1 sqrt   4) =
;; (apply-iter-n 0 sqrt   2) =
;; 2
