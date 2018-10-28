#lang racket

(define (succ x)
  (+ x 1))

(define (compose f g)
  (lambda (x)                ;; we are returning a new function which takes an argument x
    (f (g x))))              ;; and returns f(g(x))

(define (apply-twice f)      ;; we are returning a new function which takes an argument x
  (compose f f))             ;; and returns f(f(x))

(define add-two              ;; we are returning a new function which taks an argument x
  (apply-twice succ))        ;; and returns x + 2

;; (add-two 1) =                        ;; let's replace add-two with its definition
;; ((apply-twice succ) 1) =             ;; let's replace apply-twice with its definition
;; ((compose succ succ) 1) =            ;; let's replace compose with its definition
;; (lambda (x) (succ (succ x)) 1) =     ;; finally, let's replace x with 1
;; (succ (succ 1)) =
;; (succ 2) =
;; 3
