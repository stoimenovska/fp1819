#lang racket
(require rackunit)
(require rackunit/text-ui)

;; helper functions
(define (last number)
	(remainder number 10))

(define (next-to-last number)
	(last (quotient number 10)))

(define (second-to-last number)
	(next-to-last (quotient number 10)))

;; (last           123) = 3
;; (next-to-last   123) = 2
;; (second-to-last 123) = 1

(define (ends-with-palindrome? number)
	(or 
		(and (> number 9)
			 (= (last number) (next-to-last number)))
		(and (> number 99)
			 (= (last number) (second-to-last number)))))

;; (ends-with-palindrome?  11) = #t
;; (ends-with-palindrome? 101) = #t
;; (ends-with-palindrome? 102) = #f
;; (ends-with-palindrome? 112) = #f

(define (contains-palindrome? number)
	(if (< number 10) 
		#f
		(or 
			(ends-with-palindrome? number)
			(contains-palindrome? (quotient number 10)))))

;; not required
;; example tests for those who are interested
(define tests
	(test-suite "Contains Palindrome Tests"
 		(check-equal? (contains-palindrome?   11) #t "Check base case with two-digit number")
   		(check-equal? (contains-palindrome?  101) #t "Check base case with three-digit number")
   		(check-equal? (contains-palindrome?  123) #f "Check when number doesn't contain palindrome")
   		(check-equal? (contains-palindrome? 1223) #t "Check when number contains palindrome in the middle")))

(run-tests tests 'verbose)