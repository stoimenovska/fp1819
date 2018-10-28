#lang racket

(define (my-length list)
  (if (null? list)
      0
      (+ 1 (my-length (cdr list)))))

;; (my-length '(1 2 3)) =
;; (+ 1 (my-length '(2 3))) =
;; (+ 1 (+ 1 (my-length '(3)))) =
;; (+ 1 (+ 1 (+ 1 (my-length '())))) =
;; (+ 1 (+ 1 (+ 1 0))) =
;; (+ 1 (+ 1 1)) =
;; (+ 1 2) =
;; 3
