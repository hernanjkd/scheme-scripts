;Copies a whole list into another. Not to use if any of the lists is empty.
(define override
  (lambda (lst new-lst)
    (set-car! lst (car new-lst))
    (set-cdr! lst (cdr new-lst))))

;Adds a number in a list of numbers in a sorted way.
(define add
  (lambda (n lst)
    (cond
      ((null? lst) (cons n '()))
      ((<= n (car lst)) (cons n lst))
      (else
       (cons (car lst) (add n (cdr lst)))))))

;Uses add and then overrides the original list into the new one.
(define add!
  (lambda (n lst)
    (if (null? lst)        
        #f        
        (let ((new-lst (add n lst)))
          (override lst new-lst)))))

(define lst '(1 2 3 4 5))
(define lst0 '(0 1 2 3 4 5))

;If you (override lst lst0) there's no problem. Problem is when you (add! 0 lst)
;This does not happen when adding at any other position that's not 0.