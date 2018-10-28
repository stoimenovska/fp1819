#lang racket

(define (my-append list1 list2)
  (if (null? list1)
      list2
      (cons
            (car list1)
            (my-append (cdr list1) list2))))

;; (my-append '(1 2) '(3 4 5)) =
;; (cons 1 (my-append '(2) '(3 4 5)) =
;; (cons 1 (cons 2 (my-append '() '(3 4 5)))) =
;; (cons 1 (cons 2 '(3 4 5))) =
;; (cons 1 '(2 3 4 5)) =
;; '(1 2 3 4 5)
