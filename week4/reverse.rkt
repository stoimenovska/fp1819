#lang racket

(define (my-reverse lst)
  (if (null? lst)
      '()
      (append
          (my-reverse (cdr lst))
          (list (car lst)))))

;; (my-reverse '(1 2 3)) =
;; (append (my-reverse '(2 3)) '(1)) =
;; (append (append (my-reverse '(3)) '(2)) '(1)) =
;; (append (append (append (my-reverse '()) '(3)) '(2)) '(1)) =
;; (append (append (append '() '(3)) '(2)) '(1)) =
;; (append (append '(3) '(2)) '(1)) =
;; (append '(3 2) '(1)) =
;; '(3 2 1)

(define (my-reverse2 list)
  (define (helper list accum)
    (if (null? list)
        accum
        (helper (cdr list) (cons (car list) accum))))
  (helper list '()))

;; (my-reverse2 '(1 2 3)) =
;; (helper '(1 2 3)      '()) =
;; (helper   '(2 3)     '(1)) =
;; (helper     '(3)   '(2 1)) =
;; (helper      '() '(3 2 1)) =
;; '(3 2 1)
