;Replaces an element in a list with another. #f if element not there.
(define replace
  (lambda (old new lst)
    (cond
      ((null? lst) #f)
      ((eq? (car lst) old) (cons new (cdr lst)))
      (else
       (cons (car lst) (replace old new (cdr lst)))))))

(define replace!
  (lambda (old new lst)
    (if (null? lst) 
        #f
        (let ((new-lst (replace old new lst)))
          (override lst new-lst)))))