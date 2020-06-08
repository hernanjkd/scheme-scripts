;Sorts a list of numbers.
(define sort-number
  (lambda (lst)
    (cond
      ((null? lst) '())
      (else
       (let ((low (apply min lst)))
         (cons low (sort-number (remove low lst))))))))

(define sort-number!
  (lambda (lst)
    (if (not (or (null? lst)
                 (= (length lst) 1)))
        (let ((new-lst (sort-number lst)))
          (override lst new-lst)))))

;Sorts a list of numbers or strings.
(define sort
  (lambda (lst)
    (cond
      ((null? lst) '())
      (else
       (add-sort (car lst) (sort (cdr lst)))))))

(define sort!
  (lambda (lst)
    (if (not (or (null? lst)
                 (= (length lst) 1)))
        (let ((new-lst (sort lst)))
          (override lst new-lst)))))


;(define lst '("c" "b" "f" "e" "a"))
;(define lstn '(4 6 5 2 3 8 7))