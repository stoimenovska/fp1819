#lang racket

(define (all? list predicate)
  (cond
    ((null? list) #t)
    ((not (predicate (car list))) #f)
    (else (all? (cdr list) predicate))))

(define (all2? list predicate)
  (if (null? list)
      #t
      (and
          (predicate (car list))
          (all2? (cdr list) predicate))))

(define (any? list predicate)
  (cond
    ((null? list) #f)
    ((predicate (car list)) #t)
    (else (any? (cdr list) predicate))))

;; we can define any2? similarly to all2?
