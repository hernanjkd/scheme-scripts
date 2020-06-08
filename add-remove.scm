;Sets lst into new-lst. Does not override a list into the empty list.
(define override
  (lambda (lst new-lst)
    (set-car! lst (car new-lst))
    (set-cdr! lst (cdr new-lst))))

;Removes the first obj from the list. Returns the list, even if it did not find the object.
(define remove
  (lambda (obj lst)
    (cond
      ((null? lst) '())
      ((eq? obj (car lst)) (cdr lst))
      (else
       (cons (car lst) (remove obj (cdr lst)))))))

(define remove!
  (lambda (obj lst)
    (let ((new-lst (remove obj lst)))
      (cond
        ((or (equal? lst new-lst)
             (null? new-lst)) #f)
        (else
         (override lst new-lst))))))

;Removes all obj from the list. Returns the list, even if it did not find the object.
(define remove-all
  (lambda (obj lst)
    (cond
      ((null? lst) '())
      ((eq? obj (car lst)) (remove-all obj (cdr lst)))
      (else
       (cons (car lst) (remove-all obj (cdr lst)))))))

(define remove-all!
  (lambda (obj lst)
    (let ((new-lst (remove-all obj lst)))
      (cond
        ((or (equal? lst new-lst)
             (null? new-lst)) #f)
        (else
         (override lst new-lst))))))

;Remove by index. Returns #f if the index is too large.
(define remove-index
  (lambda (index lst)
    (if (>= index (length lst))
        #f
        (remove (list-ref lst index) lst))))

(define remove-index!
  (lambda (index lst)
    (let ((new-lst (remove-index index lst)))
      (cond
        ((or (not new-lst)
             (null? new-lst)) #f)
        (else
         (override lst new-lst))))))


;Adds a number in a sorted way to a list of numbers.
(define add-number-sort
  (lambda (n lst)
    (cond
      ((null? lst) (cons n '()))
      ((<= n (car lst)) (cons n lst))
      (else
       (cons (car lst) (add-number-sort n (cdr lst)))))))

(define add-number-sort!
  (lambda (n lst)
    (if (null? lst)        
        #f        
        (let ((new-lst (add-number-sort n lst)))
          (override lst new-lst)))))

;Adds a string in a sorted way to a list of strings.
(define add-string-sort
  (lambda (stg lst)
    (cond
      ((null? lst) (cons stg '()))
      ((string<? stg (car lst)) (cons stg lst))
      (else
       (cons (car lst) (add-string-sort stg (cdr lst)))))))

(define add-string-sort!
  (lambda (stg lst)
    (if (null? lst)
        #f
        (let ((new-lst (add-string-sort stg lst)))
          (override lst new-lst)))))


;Combines the two adds for simplicity of use.
(define add-sort
  (lambda (obj lst)
    (cond
      ((number? obj) (add-number-sort obj lst))
      ((string? obj) (add-string-sort obj lst))
      (else #f))))

(define add-sort!
  (lambda (obj lst)
    (cond 
      ((number? obj) (add-number-sort! obj lst))
      ((string? obj) (add-string-sort! obj lst))
      (else #f))))


;Adds the obj in the position provided.
(define add
  (lambda (obj lst index)
    (if (> index (length lst))
        #f
        (letrec ((loop
                  (lambda (ls count)
                    (cond
                      ((= count index) (cons obj ls))
                      (else
                       (cons (car ls) (loop (cdr ls) (+ count 1))))))))
          (loop lst 0)))))

(define add!
  (lambda (obj lst index)
    (if (null? lst)
        #f
        (let ((new-lst (add obj lst index)))
          (override lst new-lst)))))





;(define ls (list 5 4 2 3 6 8 7 2 7 4))
;(define lst (list 1 1 2 2 3 4 5 7 7 7 9))
;(define lsts (list "a" "b" "d" "f" "g" "h"))