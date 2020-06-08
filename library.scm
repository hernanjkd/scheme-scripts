(load "add-remove.scm")
(load "sort.scm")
(load "replace.scm")

;Returns the type of the value entered. Otherwise #f.
(define type
  (lambda (val)
    (cond
      ((number? val)  (number-type val))
      ((char? val)    'char)
      ((string? val)  'string)
      ((boolean? val) 'boolean)
      ((symbol? val)  'symbol)
      (else
       #f))))

;Type predicate to check if two numbers are equal, or close enough.
(define closeEnough?
  (lambda (x y)
    (define acceptable-error 1/10000)
    (< (abs (- x y) acceptable-error))))

;Returns the index of the element or #f if is not there.
(define index
  (lambda (obj lst)
    (letrec ((loop
              (lambda (lst index)
                (cond
                  ((null? lst) #f)
                  ((eq? obj (car lst)) index)
                  (else
                   (loop (cdr lst) (+ index 1)))))))
      (loop lst 0))))





;(define lst '(4 5 6 7 8 9))