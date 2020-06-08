;Returns #t, meaning x is a list. Can put many arguments.
(define exp1
  (lambda x
    (list? x)))

;Returns a list of the arguments entered. Works just like list.
(define exp2 (lambda x x))

;Returns #t, meaning z is a list. x and y are regular arguments. z is a list
;you can enter many arguments.
(define exp3
  (lambda (x y . z)
    (list? z)))