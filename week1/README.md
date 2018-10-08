# Week 1

## Contents

- [DrRacket](#dr-racket)
- [Syntax](#syntax)
- [Examples](#examples)

## DrRacket

- [Racket (PLT Scheme)](https://docs.racket-lang.org/guide/intro.html) vs [R5RS](https://docs.racket-lang.org/r5rs/r5rs-std/r5rs-Z-H-2.html#%_toc_start) vs R6RS
- REPL (read-eval-print loop)
- [DrRacket](https://racket-lang.org/) - for Windown, Linux and Mac OS
    + definitions panel (for defining programs) + interactions panel (for evaluating expressions interactively) + run button (evaluates the program in the definitions panel and makes the programs definitions available in the interactions panel)
    + `#lang racket` or `#lang r5rs`
- Alternatives
    + [repl.it](https://repl.it/)
    + text editor of choise + loading the code using racket, mzscheme or something else
    + running scheme in emacs
 
## Syntax

- TODO: parentheses joke 
- [indentation](http://community.schemewiki.org/?scheme-style)
- comments
    + single-line comments are indicated by a semicolon ;
    + multiline comments are defined using #| |#
- simple data types
    + boolean - #t, #f
        * all non-#f values are treated as true
        * related procedures - `boolean?`,  `and`, `or`, `not`
    + number - integer, rational (eg 22/7), real (eg 3.14), complex (eg 2+3i) 
        * related procedures - `integer?`, `rational?`, `real?`, `complex?`, `=`, `>`, `>=`, `<`, `<=`, `+`, `-`, `*`, `/`, `remainder` (`mod` в REPL.it), `quotient` (`div` в REPL.it), `abs`, `expt`, `sqrt`, `min`, `max`, `round`
    + character - prefixed with #\
        * related procedures - `char?`
    + string - written between doublequotes
        * related procedures - `string?`, `substring`, `string-append`
- function application - `(function arg1 arg2 … argN)`
    + infix notation
    + first the argument values are evaluated (from left to right) and then the function is applied
    + some functions accept a fixed number of arguments (eg substring, remainder), others - accept any number of arguments (eg string-append, +)
- definitions
    + defining an expression  
    
        `(define symbol expression)`
    + defining a function  
        
        `(define (function-name parameters) body)`
- conditional statements
    + if statement
        
        ```scheme
        (if predicate
            consequent 
            alternative)
        ```
    + cond statement

      ```scheme
      (cond 
          (pred1 expr1) 
          (pred2 expr2) 
          (else expr3))
      ```
- recusion

## Examples

```scheme
(define name "bepce")
(define (greeting name)
  (string-append "zdr kp " name))
```

```scheme
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
```

```scheme
(define (fibonacci number)
  (if (<= number 2)
      1
      (+ (fibonacci (- number 1)) (fibonacci (- number 2)))))
```